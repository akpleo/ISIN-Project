from django.db import models

class CTWIO(models.Model):
    tio_tISIN = models.CharField(max_length=12, db_index=True)
    tio_lQty = models.IntegerField()
    tio_lScpSrNo = models.IntegerField(null=True, blank=True)

    def __str__(self):
        return f"{self.tio_tISIN} - Qty: {self.tio_lQty}"

    class Meta:
        ordering = ['tio_tISIN']

class CMSCRP(models.Model):
    scp_tIsin = models.CharField(max_length=12, db_index=True)
    scp_lSrNo = models.IntegerField()

    def __str__(self):
        return f"{self.scp_tIsin} - SrNo: {self.scp_lSrNo}"
