from django.shortcuts import render
from django.http import JsonResponse, HttpResponse
from django.views.decorators.http import require_http_methods


from web_scrapping.scrapping.Search import Search
from selenium import webdriver


import json
import time

@require_http_methods(["GET"])
def getMainData(request):
        driver = webdriver.Chrome()
        driver.maximize_window()
        
        #producto = request.GET.get('producto')
        producto = "Coca Cola 2L".lower()
        
        
        data = []

        search = Search(driver=driver, product_name=producto)
        data = search.SearchAhorraMasName()
        print(data)
        
        
        driver.quit()
        
        return JsonResponse(data, safe=False)


@require_http_methods(["GET"])
def home(request):
    
    data =  [12,12,12,12,121,21,2]
    return JsonResponse(data, safe=False)
