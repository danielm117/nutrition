# -*- coding: utf-8 -*-
#!/usr/local/bin/python
from django.shortcuts import render
import chardet, json
from django.core.exceptions import ObjectDoesNotExist
from django.db import IntegrityError

from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.core.context_processors import csrf
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.models import User

# Create your views here.
from django.shortcuts import render
from django.template import loader, Context, RequestContext
from nutricionApp.models import Alimento, Paciente, Nutriente, Etiqueta, Nutriente_Etiqueta, Funcion_Lineal,Gramosporporcion,Cantidad_Nutriente_Alimento, Medico, Medico_Paciente, Recomendacion, Regla, Precendente_Regla
from django.http import HttpResponse
from django.http import HttpResponse, HttpResponseRedirect
from django.shortcuts import render, render_to_response, redirect

import os,sys


def log_in(request):
    c = {}
    c.update(csrf(request))
    return render_to_response('login.html', c)

def log_out(request):
    logout(request)
    return render_to_response('logout.html', context_instance=RequestContext(request))

def auth_view(request):
    email = request.POST.get('email', '')
    password = request.POST.get('password', '')
    user = authenticate(username=email,password=password)
    #return HttpResponse(user)
    if user is not None:
        login(request, user)
        print("se logueo")
        return redirect('/nutrientes')

        # return render_to_response('home.html', context_instance=RequestContext(request))
        #return render('hay un usuario')
    else:
        print("no se logueo")
        return redirect('/login')
        # return render_to_response('error_login.html', context_instance=RequestContext(request))
        #return render('no hay usuario')
def error_login(request):
    return render_to_response('error_login.html', context_instance=RequestContext(request))
# Create your views here.
@login_required(login_url='/login/')
def home(request):
    template = loader.get_template("home.html")
    context = RequestContext(request)
    return redirect('/nutrientes')

@login_required(login_url='/login/')
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
        diccionario={'alimentos':alimentos,'active':'alimentos'}      

    template = loader.get_template("alimentos.html")
    context = RequestContext(request,diccionario)
    return HttpResponse({template.render(context)})
@login_required(login_url='/login/')
def listar_porciones(request):
    try:
        porciones=Gramosporporcion.objects.all()
        alimentos=Alimento.objects.all()
    except:
        porciones=None
        error="No se pudo obtener el listado de porciones"
        diccionario={'error_message':error}

    if not porciones:
        error="No hay porciones Registrados" 
        diccionario={'error_message':error}       
    else:
        diccionario={'porciones':porciones,'alimentos':alimentos,'active':'porciones'}      

    template = loader.get_template("porciones.html")
    context = RequestContext(request,diccionario)
    return HttpResponse({template.render(context)})
@login_required(login_url='/login/')
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
        diccionario={'nutrientes':nutrientes,'active':'nutrientes'}      

    template = loader.get_template("nutrientes.html")
    context = RequestContext(request,diccionario)
    return HttpResponse({template.render(context)})
@login_required(login_url='/login/')
def listar_nutrientesAlimento(request,n):
    print(n)
    nutrientes_usados = []
    nuevo_nutrientes = []
    todos_nutrientes=Nutriente.objects.all()
    try:
        nutrienteAlimento=Cantidad_Nutriente_Alimento.objects.filter(alimento = n)
    except:
        nutrienteAlimento=None
        error="No se pudo obtener el listado de nutrientes"
        diccionario={'error_message':error}

    for n in nutrienteAlimento:
        nutrientes_usados.append(n.nutriente)
    for n in todos_nutrientes:
        if n not in nutrientes_usados:
            nuevo_nutrientes.append(n)
    if not nutrienteAlimento:
        error="No hay nutrientes Registrados" 
        diccionario={'error_message':error,'nutrientes_nuevo':todos_nutrientes}       
    else:
        diccionario={'nutrienteAlimento':nutrienteAlimento,'nutrientes_nuevo':nuevo_nutrientes,'active':'alimentos'}      
    template = loader.get_template("nutrientesAlimento.html")
    context = RequestContext(request,diccionario)
    return HttpResponse({template.render(context)})
@login_required(login_url='/login/')
def listar_etiquetasNutriente(request,n):
    todas_etiquetas=Etiqueta.objects.all()
    etiquetas_usadas = []
    nueva_etiquetas = []
    try:
        nutriente1=Nutriente.objects.filter(nombre=n)
        etiquetas_nutriente=Nutriente_Etiqueta.objects.filter(nutriente=nutriente1)
        funciones_lineales={}
        for e in etiquetas_nutriente:
            funciones_lineales[e.etiqueta.nombre]=Funcion_Lineal.objects.filter (conjunto=e)
        for e in etiquetas_nutriente:
            if e.etiqueta.nombre not in etiquetas_usadas:
                etiquetas_usadas.append(e.etiqueta)
    except:
        etiquetas_nutriente=None
        error="No se pudo obtener el listado de etiquetas"
        diccionario={'error_message':error}
    
    for e in todas_etiquetas:
        if e not in etiquetas_usadas:
            nueva_etiquetas.append(e)
    if not etiquetas_nutriente:
        error="No hay etiquetas Registrados" 
        diccionario={'error_message':error,'nueva_etiquetas':nueva_etiquetas}       
    else:
	    
        diccionario={'etiquetas':etiquetas_nutriente, 'funciones_lineales':funciones_lineales, 'nueva_etiquetas':nueva_etiquetas,'active':'nutrientes'}      

    template = loader.get_template("etiquetasNutriente.html")
    context = RequestContext(request,diccionario)
    return HttpResponse({template.render(context)})
@login_required(login_url='/login/')
def listar_reglas(request):
    try:
        reglas=Regla.objects.all()
        precedentes=Precendente_Regla.objects.all()
        nutrienteEtiqueta=Nutriente_Etiqueta.objects.all()
        recomendaciones = Recomendacion.objects.all()
    except:
        reglas=None
        error="No se pudo obtener el listado de etiquetas"
        diccionario={'error_message':error}

    if not reglas:
        error="No hay etiquetas Registrados" 
        diccionario={'error_message':error}       
    else:
        diccionario={'reglas':reglas, 'precedentes': precedentes, 'nutrienteEtiqueta':nutrienteEtiqueta, 'recomendaciones':recomendaciones, 'active':'reglas'}      

    template = loader.get_template("reglas.html")
    context = RequestContext(request,diccionario)
    return HttpResponse({template.render(context)})
@login_required(login_url='/login/')
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
        diccionario={'etiquetas':etiquetas,'active':'etiquetas'}      

    template = loader.get_template("etiquetas.html")
    context = RequestContext(request,diccionario)
    return HttpResponse({template.render(context)})
@login_required(login_url='/login/')
def listar_recomendaciones(request):
    try:
        recomendaciones=Recomendacion.objects.all()
    except:
        recomendaciones=None
        error="No se pudo obtener el listado de recomendaciones"
        diccionario={'error_message':error}
    if not recomendaciones:
        error="No hay recomendaciones Registrados" 
        diccionario={'error_message':error}       
    else:
        diccionario={'recomendaciones':recomendaciones}      
    template = loader.get_template("recomendaciones.html")
    context = RequestContext(request,diccionario)
    return HttpResponse({template.render(context)})
@login_required(login_url='/login/')
def guardar_funciones(request):
    error = False
    funcionesrequest = request.GET
    funcion=None
    nueva= Funcion_Lineal()
    nutiente_nuevo=None
    etiqueta_nuevo=None
    for f in funcionesrequest.keys():
        try:
            aux = int(f.split('_',1)[0])
            funcion=Funcion_Lineal.objects.get(id=f.split('_',1)[0])
            if f.split('_',1)[1]=='x1':
                funcion.x1=funcionesrequest[f]
            elif f.split('_',1)[1]=='x2':
                funcion.x2=funcionesrequest[f]
            elif f.split('_',1)[1]=='m':
                funcion.m=funcionesrequest[f]
            elif f.split('_',1)[1]=='b':
                funcion.b=funcionesrequest[f]
            elif f.split('_',1)[1]=='unidad':
                funcion.unidad_medida=funcionesrequest[f]
            funcion.save()
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
            elif f.split('_',1)[1]=='unidad':
                nueva.unidad_medida=funcionesrequest[f]
    nutriente_nuevo = (request.META.get('HTTP_REFERER').split('/etiquetas',1)[1]).replace("/", "")
    n = Nutriente.objects.filter(nombre=nutriente_nuevo)[0].pk;
    e = Etiqueta.objects.filter(nombre=etiqueta_nuevo)[0].pk;
    nueva.conjunto = Nutriente_Etiqueta.objects.filter(etiqueta=e,nutriente=n)[0]
    if (not((nueva.x1=="") or (nueva.x2=="") or (nueva.m=="") or (nueva.b=="") or (nueva.unidad_medida==""))):
        nueva.save()
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
@login_required(login_url='/login/')
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
@login_required(login_url='/login/')
def guardar_reglas(request):
    regla_request = request.GET
    print(regla_request)
    for n in regla_request.keys():
        if(n.split('_',1)[0]=='precedentes'):  
            precedente_pk = n.split('_',1)[1]
            precedente=Precendente_Regla.objects.get(pk=precedente_pk)
            nutriente_etiqueta = Nutriente_Etiqueta.objects.get(pk=regla_request[n])
            precedente.precendente = nutriente_etiqueta
            precedente.save()
        if(n.split('_',1)[0]=='consecuente'):  
            regla_pk = n.split('_',1)[1]
            regla=Regla.objects.get(pk=regla_pk)
            nutriente_etiqueta = Nutriente_Etiqueta.objects.get(pk=regla_request[n])
            regla.consecuente = nutriente_etiqueta
            regla.save()
        if(n.split('_',1)[0]=='recomendacion'):
            regla_pk = n.split('_',1)[1]
            regla=Regla.objects.get(pk=regla_pk)
            regla.recomendacion = regla_request[n]
            regla.save()
        if(n.split('_',1)[0]=='nuevo'):
            regla_pk = n.split('_',1)[1]
            regla=Regla.objects.get(pk=regla_pk)
            ne = Nutriente_Etiqueta.objects.get(pk=regla_request[n])
            nuevoPrecedente = Precendente_Regla(regla = regla, precendente = ne)
            nuevoPrecedente.save()
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
@login_required(login_url='/login/')
def guardar_porciones(request):
    porcionesrequest = request.GET
    print(porcionesrequest)
    for e in porcionesrequest.keys():
        porcion=Gramosporporcion.objects.get(pk=e.split('_',1)[0])
        if e.split('_',1)[1]=='nombre':
            porcion.nombre_porcion=porcionesrequest[e]
        if e.split('_',1)[1]=='valorgramos':
            porcion.valor_gramos=porcionesrequest[e]
        porcion.save()    
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
@login_required(login_url='/login/')
def guardar_nueva_regla(request):
    regla_request = request.GET
    print(regla_request)
    for n in regla_request.keys():
        if(n=='nombre'):
            nombre = regla_request[n]
        if(n=='consecuente'):
            consecuente = Nutriente_Etiqueta.objects.get(pk =regla_request[n])
        if(n=='recomendacion'):
            recomendacion = regla_request[n]
    regla_nueva = Regla(nombre=nombre,consecuente=consecuente,recomendacion=recomendacion)
    regla_nueva.save()
    for n in regla_request.keys():
        if(n=='precedente'):
            ne = Nutriente_Etiqueta.objects.get(pk =regla_request[n])
    precedente_nuevo = Precendente_Regla(regla = regla_nueva, precendente = ne)
    precedente_nuevo.save()
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
@login_required(login_url='/login/')
def guardar_nutrientesAlimento(request):
    nutrienterequest = request.GET
    for n in nutrienterequest.keys():
        nutriente_nuevo = n.split('_',1)[0]
        gramos = nutrienterequest[n]
    alimento_nuevo = (request.META.get('HTTP_REFERER').split('/alimento',1)[1]).replace("/", "")
    a = Alimento.objects.filter(pk=alimento_nuevo)[0];
    n = Nutriente.objects.filter(nombre=nutriente_nuevo)[0];
    nueva = Cantidad_Nutriente_Alimento.objects.filter(nutriente=n,alimento=a)[0]
    nueva.cantidad_gr = gramos
    nueva.save()
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
@login_required(login_url='/login/')
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
@login_required(login_url='/login/')
def guardar_recomendaciones(request):
    error = False
    test2=[]
    etiquetasrequest = request.GET
    etiquetasId=[]
    etiquetas=[]
    etiqueta=None
    for e in etiquetasrequest.keys():
        if e.split('_',1)[0] not in etiquetasId:
            etiquetasId.append(e.split('_',1)[0])
            etiqueta=Recomendacion.objects.filter(pk=e.split('_',1)[0])[0]
            etiquetas.append(etiqueta)
        if e.split('_',1)[1]=='descripcion':
            etiqueta.descripcion=etiquetasrequest[e]
    for e in etiquetas:
        e.save()    
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
@login_required(login_url='/login/')
def guardar_alimentos(request):
    error = False
    test2=[]
    alimentosrequest = request.GET
    alimentosId=[]
    alimentos=[]
    alimento=None
    for a in alimentosrequest.keys():
        if a.split('_',1)[0] not in alimentosId:
            alimentosId.append(a.split('_',1)[0])
            alimento=Alimento.objects.filter(nombre=a.split('_',1)[0])[0]
            alimentos.append(alimento)
        alimentodict=alimentosrequest[a]
        if a.split('_',1)[1]=='nombre':
            alimento.nombre=alimentosrequest[a]
        elif a.split('_',1)[1]=='codigo_fao':
            alimento.codigo_fao=alimentosrequest[a]
        elif a.split('_',1)[1]=='tags':
            alimento.tags=alimentosrequest[a]
    for a in alimentos:
        a.save()    
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
@login_required(login_url='/login/')
def guardar_nuevo_etiqueta_nutriente(request):
    etiquetarequest = request.GET
    etiqueta_nueva = etiquetarequest.get('etiqueta')
    nutriente_nuevo = (request.META.get('HTTP_REFERER').split('/etiquetas',1)[1]).replace("/", "")
    n = Nutriente.objects.filter(nombre=nutriente_nuevo)[0];
    e = Etiqueta.objects.filter(nombre=etiqueta_nueva)[0];
    nueva = Nutriente_Etiqueta(etiqueta=e,nutriente=n)
    nueva.save()
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
@login_required(login_url='/login/')
def guardar_nuevo_nutrientesAlimento(request):
    nutrienterequest = request.GET
    nutriente_nueva = nutrienterequest.get('nombre_nutriente')
    alimento_nuevo = (request.META.get('HTTP_REFERER').split('/alimento',1)[1]).replace("/", "")
    a = Alimento.objects.filter(pk=alimento_nuevo)[0];
    n = Nutriente.objects.filter(nombre=nutriente_nueva)[0];
    nueva = Cantidad_Nutriente_Alimento(nutriente=n,alimento=a,cantidad_gr =nutrienterequest.get('nombre_cantidad_gr'))
    nueva.save()
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
@login_required(login_url='/login/')
def guardar_nueva_porcion(request):
    porcionrequest = request.GET
    alimento_nueva = porcionrequest.get('nombre_alimento')
    a = Alimento.objects.filter(nombre=alimento_nueva)[0];
    nueva = Gramosporporcion(nombre_porcion=porcionrequest.get('nombre_porcion'),alimento=a,valor_gramos =porcionrequest.get('nombre_valor_gramos'))
    nueva.save()
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
@login_required(login_url='/login/')
def guardar_nuevo_nutriente(request):
    nutrientesrequest = request.GET
    kcalxgramo=0
    nueva = Nutriente(nombre=nutrientesrequest.get('nombre_nutriente'),kcalxgramo=nutrientesrequest.get('nombre_kcalxgramo'))
    nueva.save()
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
@login_required(login_url='/login/')
def guardar_nuevo_alimento(request):
    alimentosrequest = request.GET
    nueva = Alimento(nombre=alimentosrequest.get('nombre_alimento'),codigo_fao=alimentosrequest.get('nombre_codigo_fao'),tags=alimentosrequest.get('nombre_tags'))
    nueva.save()
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
@login_required(login_url='/login/')
def guardar_nueva_etiqueta(request):
    nutrientesrequest = request.GET
    nueva = Etiqueta(nombre=nutrientesrequest.get('nombre_etiqueta'))
    nueva.save()
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
@login_required(login_url='/login/')
def guardar_nueva_recomendacion(request):
    nutrientesrequest = request.GET
    nueva = Recomendacion(descripcion=nutrientesrequest.get('descripcion_recomendacion'))
    nueva.save()
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
@login_required(login_url='/login/')
def eliminar_nutriente_etiqueta(request):
    etiquetarequest = request.GET
    pk = etiquetarequest.get('pk');
    nutriente_etiqueta = Nutriente_Etiqueta.objects.filter(pk=pk)[0]
    nutriente_etiqueta.delete()
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
@login_required(login_url='/login/')
def eliminar_regla(request):
    etiquetarequest = request.GET
    pk = etiquetarequest.get('pk');
    nutriente_etiqueta = Regla.objects.filter(pk=pk)[0]
    nutriente_etiqueta.delete()
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
@login_required(login_url='/login/')
def eliminar_nutrientesAlimento(request):
    etiquetarequest = request.GET
    pk = etiquetarequest.get('pk');
    nutriente_etiqueta = Cantidad_Nutriente_Alimento.objects.filter(pk=pk)[0]
    nutriente_etiqueta.delete()
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
@login_required(login_url='/login/')
def eliminar_etiqueta(request):
    etiquetarequest = request.GET
    pk = etiquetarequest.get('pk');
    etiqueta = Etiqueta.objects.filter(pk=pk)[0]
    etiqueta.delete()
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
@login_required(login_url='/login/')
def eliminar_recomendacion(request):
    etiquetarequest = request.GET
    pk = etiquetarequest.get('pk');
    etiqueta = Recomendacion.objects.filter(pk=pk)[0]
    etiqueta.delete()
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
@login_required(login_url='/login/')
def eliminar_nutriente(request):
    etiquetarequest = request.GET
    pk = etiquetarequest.get('pk');
    nutriente = Nutriente.objects.filter(pk=pk)[0]
    nutriente.delete()
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
@login_required(login_url='/login/')
def eliminar_porcion(request):
    etiquetarequest = request.GET
    pk = etiquetarequest.get('pk');
    nutriente = Gramosporporcion.objects.filter(pk=pk)[0]
    nutriente.delete()
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
@login_required(login_url='/login/')
def eliminar_alimento(request):
    etiquetarequest = request.GET
    pk = etiquetarequest.get('pk');
    nutriente = Alimento.objects.filter(pk=pk)[0]
    nutriente.delete()
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
@login_required(login_url='/login/')
def eliminar_funcion(request):
    etiquetarequest = request.GET
    pk = etiquetarequest.get('pk');
    funcion = Funcion_Lineal.objects.filter(pk=pk)[0]
    funcion.delete()
    return HttpResponseRedirect(request.META.get('HTTP_REFERER'))
def get_data(request):
    database_name="nutricionApp"
    password="tesistesis"
    user="tesis"
    filename = os.path.dirname(__file__)+"/database/database.sqlite"
    outputFileName = os.path.dirname(__file__)+"/database/SQLiteData.sql"
    output = open(outputFileName, "w")
    mysql2sqlite = os.path.dirname(__file__)+"/scripts/mysql2sqlitedata.sh"
    command1 = 'mysql -h localhost -u '+user+' -p'+password+' -N information_schema -e "select table_name from tables where table_schema =\''+database_name+'\' and table_name like \'nutricionApp_%\' and table_name not like \'nutricionApp_services\' and table_name not like \'nutricionApp_paciente\' and table_name not like \'nutricionApp_medico\' and table_name not like \'nutricionApp_medico_paciente\'" > tables.txt'
    #print 'comando: '+command1
    os.system(command1)
    tables = ''
    with open('tables.txt', "r") as tablesfile:
        for line in tablesfile:
            tables = tables+line.rstrip('\n')+' '
        tablesfile.close()
    command2 = 'sh %s -h localhost -u %s -p%s %s %s | sed "%s" > %s' % (
        mysql2sqlite,user,password,database_name, tables, "s/\\\\'//g", filename)
    os.system(command2)

    with open(filename, encoding = "ISO-8859-1") as fileDB:
        
        data=  ""    
        for line in fileDB:
            line = line.replace("\"","")
            line = line.replace('"','')
            data=data+line
    output.close()
    fileDB.close()
    version='1'
    print (data)
    #max_version = Version.objects.all().aggregate(Max('version'))['version__max']
    #version = Version.objects.get(version = max_version)
    diccionario={"version":version,"data": data }
    template = loader.get_template("database.html")
    context = RequestContext(request,diccionario)
    return HttpResponse({template.render(context)})
def api_op(request):
    funcionesrequest = request.GET
    operacion=request.GET["_operation"]
    diccionario=None
    if operacion == "get_requests":
        diccionario=obtenerMedicos(request,request.GET["email"],True)
    elif operacion == "confirm_request":
        diccionario=confirmarSolicitudMedico(request,request.GET["follower_email"],request.GET["followed_email"],True)
    elif operacion == "create_patient":
        diccionario=crearUsuarioPaciente(request)
    elif operacion == "login":
        diccionario=accederAlSistema(request)
    elif operacion == "update_intake":
        diccionario=actualizarConsumos(request)
    return HttpResponse(json.dumps(diccionario))
#http://127.0.0.1:8000/api/?_operation=get_requests&email=dadaoros@gmail.com
def obtenerMedicos(request,email,soloPendientes):
    medicos=[]
    if soloPendientes is True:
        mp=[]
        try:
            mp=Medico_Paciente.objects.filter(paciente=Paciente.objects.get(correo=email).id, seguimiento=False)
        except ObjectDoesNotExist:
            print ("not found")
        for m in mp:
            medicos.append({"nombre":m.medico.nombres,"clinica":m.medico.empresa,"email":m.medico.correo})
        print (medicos)
        diccionario={"result":True,"data": medicos }
        return diccionario

    return True
#http://127.0.0.1:8000/api/?_operation=confirm_request&follower_email=correo%40fian.org&followed_email=dadaoros%40gmail.com&confirm=true
def confirmarSolicitudMedico(request,emailMedico,emailPaciente,acepto):
    medicos=[]
    result=False
    data=None
    if acepto is True:
        mp=[]
        try:
            mp=Medico_Paciente.objects.get(paciente=Paciente.objects.get(correo=emailPaciente).id, medico=Medico.objects.get(correo=emailMedico).id)
            mp.seguimiento=True
            mp.save()
            result=True
            data=mp.medico.correo
        except ObjectDoesNotExist:
            print ("not found")
        print (mp)
        diccionario={"result":result,"data": data }
        return diccionario
    return True
#http://127.0.0.1:8000/api/?_operation=create_patient&genero=f&estatura=180&nombre=Pablo+poncio&email=ryuuzakiupldr%40gmail.com&ejercicio=3&nacimiento=703900800&peso=65.0
def crearUsuarioPaciente(request):
    result=False
    try:
        nuevoPaciente=Paciente(correo=request.GET["email"],nombres=request.GET["nombre"],fecha_nacimiento=request.GET["nacimiento"],peso=request.GET["peso"],estatura_cm=request.GET["estatura"],ejercicio=request.GET["ejercicio"],genero=request.GET["genero"])
        nuevoPaciente.save()
        print(nuevoPaciente.correo)
        result=True
    except IntegrityError:
        print("already exist")
    diccionario={"result":result,"data": "" }
    return diccionario
#/api/?_operation=login&pass=hello&email=dadaoros%40gmail.com
def accederAlSistema(request):
    result=False
    diccionario={"result":result,"data": "" }
    paciente=None
    try:
        paciente=Paciente.objects.get(correo=request.GET["email"])
    except ObjectDoesNotExist:
        result=False
    if(paciente):
        if(paciente.password == request.GET["pass"]):
            result=True    
            diccionario={"result":result,"data": {"email":paciente.correo,"nombres":paciente.nombres,"nacimiento":str(paciente.fecha_nacimiento),"peso":str(paciente.peso),"estatura":str(paciente.estatura_cm),"ejercicio":str(paciente.ejercicio),"genero":paciente.genero} }
    return diccionario
    
