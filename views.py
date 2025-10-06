from django.views.decorators.csrf import csrf_exempt
from django.http import JsonResponse, HttpResponseBadRequest
from .services import process_isin_update
import logging

logger = logging.getLogger('isin')

@csrf_exempt
def update_isin_view(request):
    if request.method == 'POST':
        try:
            data = request.POST
            logger.info(f"Received POST data: {data}")
            result = process_isin_update(data)
            return JsonResponse(result)
        except Exception as e:
            logger.exception("Error processing ISIN update")
            return JsonResponse({'error': str(e)}, status=500)
    else:
        return HttpResponseBadRequest("Only POST requests are allowed.")
