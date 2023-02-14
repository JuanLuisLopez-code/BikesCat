from rest_framework import permissions
from src.app.user.models import User
from rest_framework import exceptions


class IsAdmin(permissions.BasePermission):
    message = 'You are not an admin'

    def has_permission(self, request, view):
        try:
            user = User.objects.get(username=request.user)
            return user.types == 'admin'
        except:
            return False


class IsActive():
    message = 'You are not an active'

    def has_permission(self, request, view):
        try:
            user = User.objects.get(username=request.user)
            return user.is_active == True
        except:
            msg = 'This is a test'
            raise exceptions.AuthenticationFailed(msg)
            # return False
