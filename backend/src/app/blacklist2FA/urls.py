from django.urls import path
from .views import Blacklist2FAAuthenticatedView


urlpatterns = [
    path('', Blacklist2FAAuthenticatedView.as_view({'post': ''})),
]
