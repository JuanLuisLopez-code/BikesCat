from rest_framework import serializers, authentication, exceptions
from django.core.exceptions import PermissionDenied
from .models import User


class userSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ('password', 'email', 'username', 'types')

    def getUser(context):
        username = context['username']
        if username is None:
            raise serializers.ValidationError(
                'username is not find'
            )
        user = User.objects.get(username=username)

        return {
            'user': {
                'username': user.username,
                'email': user.email,
                'types': user.types,
                'is_active': user.is_active
            },
        }

    def register(context):

        email = context['email']
        password = context['password']
        username = context['username']
        type_register = context['type_register']

        username_exist = len(User.objects.filter(username=username))
        email_exist = len(User.objects.filter(email=email))
        if (email_exist > 0 or username_exist > 0):
            raise serializers.ValidationError(
                'Username or email already exists.'
            )

        user = User.objects.create_user(
            email=email,
            username=username,
            password=password,
            type_register=type_register
        )
        return user

    def register_firebase(context):

        email = context['email']
        type_register = context['type_register']
        username = context['username']

        username_exist = len(User.objects.filter(username=username))
        email_exist = len(User.objects.filter(email=email))
        if (email_exist > 0 or username_exist > 0):
            raise serializers.ValidationError(
                'Username or email already exists.'
            )

        user = User.objects.create_user_firebase(
            email=email,
            username=username,
            type_register=type_register
        )
        return user

    def login(context):
        username = context['username']
        password = context['password']
        if username is None:
            raise serializers.ValidationError(
                'An username is required to log in.'
            )

        if password is None:
            raise serializers.ValidationError(
                'A password is required to log in.'
            )

        try:
            user = User.objects.get(username=username)
            user.countTokens = 0
            user.save()
        except:
            raise serializers.ValidationError(
                'Username or password incorrects.'
            )

        if not user.check_password(password):
            raise serializers.ValidationError(
                'Username or password incorrects.'
            )

        return {
            'user': {
                'username': user.username,
                'email': user.email,
                'types': user.types
            },
            'token': user.token
        }

    def login_firebase(context):
        username = context['username']
        type_register = context['type_register']
        if username is None:
            raise serializers.ValidationError(
                'An username is required to log in.'
            )

        if type_register is None:
            raise serializers.ValidationError(
                'An type_register is required to log in.'
            )

        try:
            user = User.objects.get(username=username)
            if (user.type_register != "email"):
                user.countTokens = 0
                user.save()
            else:
                raise exceptions.AuthenticationFailed("error")
        except:
            raise serializers.ValidationError(
                'Username or password incorrects.'
            )

        return {
            'user': {
                'username': user.username,
                'email': user.email,
                'types': user.types
            },
            'token': user.token
        }

    def refreshToken(context):

        username = context['username']

        user = User.objects.get(username=username)
        if (user.countTokens < 3):
            user.countTokens = user.countTokens + 1
            user.save()
        else:
            raise exceptions.AuthenticationFailed("error")

        return {
            'token': user.token
        }

    def changeActive(context):
        email = context['email']

        user = User.objects.get(email=email)
        if (user.is_active == False):
            user.is_active = True
            user.save()
        else:
            raise exceptions.AuthenticationFailed("error")

        return {
            'user': {
                'email': user.email,
            }
        }

    def forgotPassword(context):
        email = context['email']
        user = User.objects.get(email=email['email'])
        if (user.is_active == True):
            user.is_active = False
            user.tokenForgotPassword = user.token
            user.save()
        else:
            raise serializers.ValidationError(
                'User is waiting for change password.'
            )

        return {
            'user': {
                'username': user.username,
                'is_active': user.is_active,
            },
            'token': user.token
        }

    def RecoveryPassword(context):
        print(context)

        tokenForgotPassword = context['token']
        password = context['password']

        try:
            user = User.objects.get(
                tokenForgotPassword=tokenForgotPassword)
            user.tokenForgotPassword = None
            user.set_password(password)
            user.is_active = True
            user.save()
        except:
            raise serializers.ValidationError(
                'Something is wrong.'
            )

        return "asd"
