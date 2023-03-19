from django.db import models
from datetime import date
# Create your models here.

    
class Supermercado(models.Model):
    nombre = models.CharField(max_length=100, blank=False, null=False)
    web = models.CharField(max_length=255, blank=False,null=False)
    imagen = models.CharField(max_length=255, null=True)


class Producto(models.Model):
    nombre = models.CharField(max_length=100, blank=False, null=False)
    precio = models.FloatField(blank=False, null=True)
    imagen = models.CharField(max_length=255, null=True)
    numero_veces = models.IntegerField(blank=False, null=False, default=0)
    supermercado = models.ForeignKey(Supermercado, on_delete=models.CASCADE)
    
    
    def __str__(self):
        return self.title
