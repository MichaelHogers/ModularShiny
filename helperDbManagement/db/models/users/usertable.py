from django.db import models

class Users(models.Model):
    user_name = models.CharField(max_length=100)
    last_login = models.DateTimeField(auto_now=True)
    access_rights = models.CharField(max_length=50)

    def __str__(self):
        return self.user_name

    class Meta:
        db_table = 'users'
        Managed = False
