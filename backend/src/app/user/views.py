from rest_framework.generics import get_object_or_404
from rest_framework.response import Response
from rest_framework import viewsets
from rest_framework.exceptions import NotFound
from .models import User
from .serializers import userSerializer
from rest_framework.permissions import (
    AllowAny, IsAuthenticated)


class UserView(viewsets.GenericViewSet):
    permission_classes = [AllowAny]

    def register(self, request):
        data = request.data['user']
        if data['email'] is None:
            raise NotFound("Email is required!")

        if data['username'] is None:
            raise NotFound("Username is required!")

        if data['type_register'] == "email":
            if data['password'] is None:
                raise NotFound("Password is required!")

        serializer_context = {
            'email': data['email'],
            'password': data['password'],
            'username': data['username'],
            'type_register': data['type_register']
        }

        if data['password'] == "0":
            serializer = userSerializer.register_firebase(serializer_context)
            return Response("Register END")

        serializer = userSerializer.register(serializer_context)
        return Response("Register END")

    def login(self, request):
        data = request.data['user']

        if data['type_register'] == "email":
            if data['password'] is None:
                raise NotFound("Password is required!")

        if data['username'] is None:
            raise NotFound("Username is required!")

        serializer_context = {
            'username': data['username'],
            'password': data['password'],
            'type_register': data['type_register']
        }

        if data['password'] == "0" and data['type_register'] != "email":
            serializer = userSerializer.login_firebase(serializer_context)
            return Response(serializer)

        serializer = userSerializer.login(serializer_context)
        return Response(serializer)

    def changeActive(self, request):

        email = request.data

        serializer_context = {
            'email': email,
        }

        userSerializer.changeActive(context=serializer_context)

        return Response("changeActive END")

    def forgotPassword(self, request):

        email = request.data

        serializer_context = {
            'email': email,
        }

        serializer = userSerializer.forgotPassword(context=serializer_context)

        return Response(serializer)

    def RecoveryPassword(self, request):

        serializer_context = {
            'password': request.data['password'],
            'token': request.data['token'],
        }

        serializer = userSerializer.RecoveryPassword(
            context=serializer_context)

        return Response("asd")


class UserAuthenticatedView(viewsets.GenericViewSet):
    permission_classes = [IsAuthenticated]

    def getUser(self, request):
        username = request.user
        serializer_context = {
            'username': username
        }
        serializer = userSerializer.getUser(context=serializer_context)
        return Response(serializer)

    def refreshToken(self, request):
        username = request.user

        serializer_context = {
            'username': username
        }

        serializer = userSerializer.refreshToken(serializer_context)
        return Response(serializer)
