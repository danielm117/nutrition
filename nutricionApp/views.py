from django.shortcuts import render

# Create your views here.
from django.shortcuts import render
from django.template import loader, Context, RequestContext
from nutricionApp.models import Alimento, Usuario, Nutriente
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
