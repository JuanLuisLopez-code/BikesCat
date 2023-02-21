from rest_framework.generics import get_object_or_404
from rest_framework.response import Response
from rest_framework import viewsets
from rest_framework.exceptions import NotFound
from .models import Blacklist2FA
from .serializers import blacklist2FASerializer

from rest_framework.permissions import (IsAuthenticated)


class Blacklist2FAAuthenticatedView(viewsets.GenericViewSet):
    permission_classes = [IsAuthenticated]

    def checkQRBD(self, request):
        bearer = request.headers['Authorization'].split()
        serializer_context = {
            "token":bearer[1],
            "code2FA":request.data
        }

        serializer = blacklist2FASerializer.checkQRBD(context=serializer_context)
        return Response(serializer)
