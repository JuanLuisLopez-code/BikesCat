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

    def checkQRBD(context):

        token = context['token']
        code2FA = context['code2FA']

        payload = jwt.decode(token, settings.SECRET_KEY)
        user = User.objects.get(username=payload['username'])

        Blacklist2FA.objects.filter(user=user).delete()
        try:
            Blacklist2FA.objects.get(user=user, code2FA=code2FA)
            return "Code in blacklist"
        except:
            Blacklist2FA.objects.create(
                user=user,
                code2FA=code2FA,
                status="pending"
            )
            return "Code created"

    def inputQR(context):
        token = context['token']
        code2FA = context['code2FA']

        payload = jwt.decode(token, settings.SECRET_KEY)
        user = User.objects.get(username=payload['username'])

        try:
            codeQR = Blacklist2FA.objects.get(user=user, code2FA=code2FA)
            codeQR.status = "used"
            codeQR.save()
            user.countLogs = 0
            user.save()
            return "Code updated"
        except:
            raise serializers.ValidationError(
                'Algo falla.'
            )
