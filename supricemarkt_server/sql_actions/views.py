from django.shortcuts import render

# Create your views here.
from django.views.decorators.http import require_http_methods
import json
from django.http import JsonResponse
from . import models
from django.views.decorators.csrf import ensure_csrf_cookie


def InsertProduct(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        nombre = data['nombre']
        precio = data['precio'].replace("€","")
        precio = float(precio.replace(",","."))
        image = data['image']
        supermercado_nombre = data['supermercado']
        
        
        all_supermarkets = list(models.Supermercado.objects.all())
        all_products = list(models.Producto.objects.all())
        
        numero_veces = 1
        
        for supermarket in all_supermarkets:
            if supermercado_nombre == supermarket.nombre:
                supermercado = supermarket
        
    
    
        update:bool = False


        for producto in all_products:
            if producto.nombre == nombre and supermercado.nombre == producto.supermercado.nombre:
                numero_veces = producto.numero_veces+1

                producto2 = models.Producto(
                                        supermercado=supermercado, 
                                        imagen=image,
                                        nombre=nombre,
                                        numero_veces=numero_veces,
                                        precio=precio)
                producto.delete()
                producto2.save()
                update = True
                
        else:
            if not update:
                producto = models.Producto(supermercado=supermercado, 
                                            imagen=image,
                                            nombre=nombre,
                                            numero_veces=numero_veces,
                                            precio=precio)
                producto.save()



        return JsonResponse({'status': 'ok'})
