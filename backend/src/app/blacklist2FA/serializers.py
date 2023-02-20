import jwt
from rest_framework import serializers
from .models import Blacklist2FA
from src.app.user.models import User

from django.conf import settings
from rest_framework import authentication, exceptions


class blacklist2FASerializer(serializers.ModelSerializer):
    class Meta:
        model = Blacklist2FA
        fields = ('token')

    def newBlackToken(context):

        token = context['token']

        payload = jwt.decode(token, settings.SECRET_KEY)
        user = User.objects.get(username=payload['username'])
        user.countTokens = 0
        user.save()

        token_create = Blacklist2FA.objects.create(
            token=token,
        )
        return {
            'token': token_create.token,
        }
