from django.db import models
from src.app.user.models import User


class Blacklist2FA(models.Model):
    user = models.ForeignKey(
        User, on_delete=models.CASCADE, related_name="user_2FA")
    code2FA = models.IntegerField(default=None)
    status = models.CharField(max_length=100, default='pending')

    def __str__(self):
        return str(self.id)
