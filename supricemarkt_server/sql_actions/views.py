from django.shortcuts import render

# Create your views here.
from django.views.decorators.http import require_http_methods
import json
from django.http import JsonResponse
from . import models
from django.views.decorators.csrf import ensure_csrf_cookie

@ensure_csrf_cookie
def InsertProduct(request):
    if request.method == 'POST':
        data = json.loads(request.body)
        nombre = data['nombre']
        precio = data['precio']
        image = data['image']
        supermercado_nombre = data['supermercado']
        
        
        all_supermarkets = models.Supermercado.objects.all()
        
        print(all_supermarkets)
        
        
        # hacer algo con los datos recibidos
        return JsonResponse({'status': 'ok'})
