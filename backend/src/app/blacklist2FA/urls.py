from django.urls import path
from .views import Blacklist2FAAuthenticatedView


urlpatterns = [
    path('checkQRBD', Blacklist2FAAuthenticatedView.as_view({'put': 'checkQRBD'})),
    path('inputQR', Blacklist2FAAuthenticatedView.as_view({'put': 'inputQR'})),
]
