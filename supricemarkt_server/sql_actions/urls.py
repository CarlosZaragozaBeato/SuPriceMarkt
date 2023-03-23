from django.contrib import admin
from django.urls import path
from . import views

urlpatterns = [
    path('/api/insert', views.InsertProduct, name='insert_product')
]