from django.urls import path
from .views import UserView, UserAuthenticatedView


urlpatterns = [
    # Users
    path('register', UserView.as_view({'post': 'register'})),
    path('login', UserView.as_view({'post': 'login'})),
    path('changeActive', UserView.as_view({'put': 'changeActive'})),
    path('forgotPassword', UserView.as_view({'put': 'forgotPassword'})),
    path('forgot/RecoveryPassword', UserView.as_view({'put': 'RecoveryPassword'})),
    
    path('refreshToken', UserAuthenticatedView.as_view({'post': 'refreshToken'})),
    path('user', UserAuthenticatedView.as_view({'get': 'getUser'})),
]
