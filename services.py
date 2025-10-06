import logging
from django.db import transaction
from django.db.models import F, Sum, Count
from .models import CTWIO, CMSCRP

logger = logging.getLogger('isin')

def process_isin_update(params):
    old_isin = params.get('old_isin')
    new_isin = params.get('new_isin')
    chck_count = params.get('chck_count') == 'Y'
    edit_insin = int(params.get('edit_insin', 0))
    issplit = int(params.get('issplit', 0))
    isbonus = int(params.get('isbonus', 0))
    split_rat = int(params.get('split_rat', 0))

    logger.info(
        f"Request received: old_isin={old_isin}, new_isin={new_isin}, "
        f"chck_count={chck_count}, edit_insin={edit_insin}, "
        f"issplit={issplit}, isbonus={isbonus}, split_rat={split_rat}"
    )

    result = {}

    if chck_count:
        count_data = CTWIO.objects.filter(tio_tISIN__in=[old_isin, new_isin]) \
            .values('tio_tISIN') \
            .annotate(count=Count('id'))
        qty_data = CTWIO.objects.filter(tio_tISIN__in=[old_isin, new_isin]) \
            .values('tio_tISIN') \
            .annotate(qty=Sum('tio_lQty'))

        result['count'] = list(count_data)
        result['qty'] = list(qty_data)
        logger.debug(f"Check count result: {result}")

    if edit_insin == 0:
        try:
            with transaction.atomic():
                if issplit == 1:
                    if split_rat <= 0:
                        result['error'] = 'Invalid split ratio'
                        logger.warning(f"Invalid split ratio: {split_rat}")
                    else:
                        CTWIO.objects.filter(tio_tISIN=old_isin).update(
                            tio_tISIN=new_isin,
                            tio_lQty=F('tio_lQty') * split_rat
                        )
                        result['split'] = 'Split update applied'
                        logger.info(
                            f"Split update applied for ISIN {old_isin} to {new_isin} with ratio {split_rat}"
                        )

                if isbonus == 1:
                    try:
                        srno = CMSCRP.objects.get(scp_tIsin=new_isin).scp_lSrNo
                        CTWIO.objects.filter(tio_tISIN=old_isin).update(
                            tio_tISIN=new_isin,
                            tio_lScpSrNo=srno
                        )
                        result['bonus'] = 'Bonus update applied'
                        logger.info(
                            f"Bonus update applied for ISIN {old_isin} to {new_isin} with SrNo {srno}"
                        )
                    except CMSCRP.DoesNotExist:
                        result['error'] = 'New ISIN not found in CMSCRP'
                        logger.error(f"Bonus update failed: CMSCRP entry not found for ISIN {new_isin}")
        except Exception as e:
            result['error'] = f"Transaction failed: {str(e)}"
            logger.exception("Transaction error during ISIN update")

    return result
