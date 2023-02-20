from django.db import models

class Blacklist2FA(models.Model):
    token = models.SlugField(max_length=254, unique=True, editable=False)

    def __str__(self):
        return str(self.id)