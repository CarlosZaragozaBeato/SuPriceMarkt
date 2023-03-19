from django.shortcuts import render
from django.http import JsonResponse, HttpResponse
from django.views.decorators.http import require_http_methods


from web_scrapping.scrapping.Search import Search
from selenium import webdriver


@require_http_methods(["GET"])
def getMainData(request):
        driver = webdriver.Chrome()
        driver.maximize_window()
        
        producto = request.GET.get('producto')

        data = []

        search = Search(driver=driver, product_name=producto)
        data = search.SearchAll()

        driver.quit()
        return JsonResponse(data, safe=False)


@require_http_methods(["GET"])
def getCarrefourData(request):
        data = []
        
        driver = webdriver.Chrome()
        driver.maximize_window()
        
        producto = request.GET.get("producto")
        producto = "Coca Cola".lower()
        
        search = Search(driver=driver, producto_name = producto)
        data = search.SearchCarrefourName()
        driver.quit()

        return JsonResponse(data, safe=False)


@require_http_methods(["GET"])
def getAhorraMasData(request):
        data = []
        
        driver = webdriver.Chrome()
        driver.maximize_window()
        
        producto = request.GET.get("producto")
        producto = "Coca Cola 2L".lower()
        
        search = Search(driver=driver, producto_name = producto)
        data = search.SearchAhorraMasName()
        driver.quit()
        
        return JsonResponse(data, safe=False)


@require_http_methods(["GET"])
def getDiaData(request):
        data = []
        
        driver = webdriver.Chrome()
        driver.maximize_window()
        
        producto = request.GET.get("producto")
        producto = "Coca Cola 2L".lower()
        
        search = Search(driver=driver, producto_name = producto)
        data = search.SearchDiaName()
        driver.quit()

        return JsonResponse(data, safe=False)
