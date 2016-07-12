from django.shortcuts import render

# Create your views here.
from django.shortcuts import render
from django.template import loader, Context, RequestContext
from nutricionApp.models import Alimento, Usuario, Nutriente, Etiqueta, Nutriente_Etiqueta, Funcion_Lineal
from django.http import HttpResponse
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render, render_to_response

import os


# Create your views here.

def home(request):
    template = loader.get_template("home.html")
    context = RequestContext(request)
    return HttpResponse({template.render(context)})
def listar_alimentos(request):
    try:
        alimentos=Alimento.objects.all()
    except:
        alimentos=None
        error="No se pudo obtener el listado de alimentos"
        diccionario={'error_message':error}

    if not alimentos:
        error="No hay Alimentos Registrados" 
        diccionario={'error_message':error}       
    else:
        diccionario={'alimentos':alimentos}      

    template = loader.get_template("alimentos.html")
    context = RequestContext(request,diccionario)
    return HttpResponse({template.render(context)})
def listar_nutrientes(request):
    try:
        nutrientes=Nutriente.objects.all()
    except:
        nutrientes=None
        error="No se pudo obtener el listado de nutrientes"
        diccionario={'error_message':error}

    if not nutrientes:
        error="No hay nutrientes Registrados" 
        diccionario={'error_message':error}       
    else:
        diccionario={'nutrientes':nutrientes}      

    template = loader.get_template("nutrientes.html")
    context = RequestContext(request,diccionario)
    return HttpResponse({template.render(context)})
def listar_etiquetas(request,n):
    
    try:
        nutriente1=Nutriente.objects.filter(nombre=n)
        etiquetas_nutriente=Nutriente_Etiqueta.objects.filter(nutriente=nutriente1)
        funciones_lineales={}
        for e in etiquetas_nutriente:		
		    funciones_lineales[e.etiqueta.nombre]=Funcion_Lineal.objects.filter (conjunto=e)
    except:
        etiquetas_nutriente=None
        error="No se pudo obtener el listado de etiquetas"
        diccionario={'error_message':error}

    if not etiquetas_nutriente:
        error="No hay etiquetas Registrados" 
        diccionario={'error_message':error}       
    else:
        diccionario={'etiquetas':etiquetas_nutriente, 'test':funciones_lineales}      

    template = loader.get_template("etiquetas.html")
    context = RequestContext(request,diccionario)
    return HttpResponse({template.render(context)})
