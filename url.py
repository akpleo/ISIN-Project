from django.urls import path
from .views import update_isin_view

urlpatterns = [
    path('update-isin/', update_isin_view, name='update_isin'),
]
