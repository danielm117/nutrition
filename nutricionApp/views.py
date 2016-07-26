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
def listar_etiquetasNutriente(request,n):
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
    todas_etiquetas=Etiqueta.objects.all()
    etiquetas_usadas = []
    for e in etiquetas_nutriente:
        if e.etiqueta.nombre not in etiquetas_usadas:
            etiquetas_usadas.append(e.etiqueta)
    nueva_etiquetas = []
    for e in todas_etiquetas:
        if e not in etiquetas_usadas:
            nueva_etiquetas.append(e)
    
    if not etiquetas_nutriente:
        error="No hay etiquetas Registrados" 
        diccionario={'error_message':error}       
    else:
	    
        diccionario={'etiquetas':etiquetas_nutriente, 'funciones_lineales':funciones_lineales, 'nueva_etiquetas':nueva_etiquetas}      

    template = loader.get_template("etiquetasNutriente.html")
    context = RequestContext(request,diccionario)
    return HttpResponse({template.render(context)})
def listar_etiquetas(request):
    try:
        etiquetas=Etiqueta.objects.all()
    except:
        etiquetas=None
        error="No se pudo obtener el listado de etiquetas"
        diccionario={'error_message':error}

    if not etiquetas:
        error="No hay etiquetas Registrados" 
        diccionario={'error_message':error}       
    else:
        diccionario={'etiquetas':etiquetas}      

    template = loader.get_template("etiquetas.html")
    context = RequestContext(request,diccionario)
    return HttpResponse({template.render(context)})
    
def guardar_funciones(request):
    error = False
    funcionesrequest = request.GET
    funcionesId=[]
    funciones=[]
    funcion=None
    nueva= Funcion_Lineal()
    nutiente_nuevo=None
    etiqueta_nuevo=None
    for f in funcionesrequest.keys():
        try:
            aux = int(f.split('_',1)[0])
            if f.split('_',1)[0] not in funcionesId:
                funcionesId.append(f.split('_',1)[0])
                funcion=Funcion_Lineal.objects.filter(id=f.split('_',1)[0])[0]
                funciones.append(funcion)
                funciondict=funcionesrequest[f]
            if f.split('_',1)[1]=='x1':
                funcion.x1=funcionesrequest[f]
            elif f.split('_',1)[1]=='x2':
                funcion.x2=funcionesrequest[f]
            elif f.split('_',1)[1]=='m':
                funcion.m=funcionesrequest[f]
            elif f.split('_',1)[1]=='b':
                funcion.b=funcionesrequest[f]
        except ValueError:
            etiqueta_nuevo = f.split('_',1)[0]
            if f.split('_',1)[1]=='x1':
                nueva.x1=funcionesrequest[f]
            elif f.split('_',1)[1]=='x2':
                nueva.x2=funcionesrequest[f]
            elif f.split('_',1)[1]=='m':
                nueva.m=funcionesrequest[f]
            elif f.split('_',1)[1]=='b':
                nueva.b=funcionesrequest[f]

    for f in funciones:
        f.save()
    nutriente_nuevo = (request.META.get('HTTP_REFERER').split('/etiquetas',1)[1]).replace("/", "")
    n = Nutriente.objects.filter(nombre=nutriente_nuevo)[0].pk;
    e = Etiqueta.objects.filter(nombre=etiqueta_nuevo)[0].pk;
    nueva.conjunto = Nutriente_Etiqueta.objects.filter(etiqueta=e,nutriente=n)[0]
    if (not((nueva.x1=="") or (nueva.x2=="") or (nueva.m=="") or (nueva.b==""))):
        nueva.save()
        
    
    #~ diccionario={'test':n,'test1':etiqueta_nuevo,'test2':nutriente_nuevo}      
    #~ template = loader.get_template("test.html")
    #~ context = RequestContext(request,diccionario)
    #~ return HttpResponse({template.render(context)})    
    #~ 
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
    
def guardar_nutrientes(request):
    error = False
    test2=[]
    nutrientesrequest = request.GET
    nutrientesId=[]
    nutrientes=[]
    nutriente=None
    for n in nutrientesrequest.keys():
        if n.split('_',1)[0] not in nutrientesId:
            nutrientesId.append(n.split('_',1)[0])
            nutriente=Nutriente.objects.filter(nombre=n.split('_',1)[0])[0]
            nutrientes.append(nutriente)
        nutrientedict=nutrientesrequest[n]
        if n.split('_',1)[1]=='nombre':
            nutriente.nombre=nutrientesrequest[n]
        elif n.split('_',1)[1]=='kcalxgramo':
            nutriente.kcalxgramo=nutrientesrequest[n]
    for n in nutrientes:
        n.save()    
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
def guardar_etiquetas(request):
    error = False
    test2=[]
    etiquetasrequest = request.GET
    etiquetasId=[]
    etiquetas=[]
    etiqueta=None
    for e in etiquetasrequest.keys():
        if e.split('_',1)[0] not in etiquetasId:
            etiquetasId.append(e.split('_',1)[0])
            etiqueta=Etiqueta.objects.filter(nombre=e.split('_',1)[0])[0]
            etiquetas.append(etiqueta)
        etiquetadict=etiquetasrequest[e]
        if e.split('_',1)[1]=='nombre':
            etiqueta.nombre=etiquetasrequest[e]
    for e in etiquetas:
        e.save()    
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
