from django.conf.urls import include, url
from django.contrib import admin

urlpatterns = [
    url(r'^admin/', include(admin.site.urls)),
    url(r'^$', 'nutricionApp.views.home'),
    url(r'^alimentos$', 'nutricionApp.views.listar_alimentos'),
    url(r'^porciones$', 'nutricionApp.views.listar_porciones'),
    url(r'^nutrientes$', 'nutricionApp.views.listar_nutrientes'),
    url(r'^etiquetas/([A-Za-z]{1,20})/$', 'nutricionApp.views.listar_etiquetasNutriente'),
    url(r'^alimento/(\d{1,5})/$', 'nutricionApp.views.listar_nutrientesAlimento'),
    url(r'^etiquetas$', 'nutricionApp.views.listar_etiquetas'),
    url(r'^guardar_alimentos/$', 'nutricionApp.views.guardar_alimentos'),
    url(r'^guardar_funciones/$', 'nutricionApp.views.guardar_funciones'),
    url(r'^guardar_nutrientes/$', 'nutricionApp.views.guardar_nutrientes'),
    url(r'^guardar_etiquetas/$', 'nutricionApp.views.guardar_etiquetas'),
    url(r'^guardar_nutrientesAlimento/$', 'nutricionApp.views.guardar_nutrientesAlimento'),
    url(r'^guardar_nuevo_etiqueta_nutriente/$', 'nutricionApp.views.guardar_nuevo_etiqueta_nutriente'),
    url(r'^guardar_nuevo_nutriente/$', 'nutricionApp.views.guardar_nuevo_nutriente'),
    url(r'^guardar_nueva_etiqueta/$', 'nutricionApp.views.guardar_nueva_etiqueta'),
    url(r'^guardar_nueva_porcion/$', 'nutricionApp.views.guardar_nueva_porcion'),
    url(r'^guardar_nuevo_alimento/$', 'nutricionApp.views.guardar_nuevo_alimento'),
    url(r'^guardar_nuevo_nutrientesAlimento/$', 'nutricionApp.views.guardar_nuevo_nutrientesAlimento'),
    url(r'^eliminar_nutriente_etiqueta/$', 'nutricionApp.views.eliminar_nutriente_etiqueta'),
    url(r'^eliminar_etiqueta/$', 'nutricionApp.views.eliminar_etiqueta'),
    url(r'^eliminar_nutriente/$', 'nutricionApp.views.eliminar_nutriente'),
    url(r'^eliminar_alimento/$', 'nutricionApp.views.eliminar_alimento'),
    url(r'^eliminar_porcion/$', 'nutricionApp.views.eliminar_porcion'),
    url(r'^eliminar_funcion/$', 'nutricionApp.views.eliminar_funcion'),
    url(r'^eliminar_nutrientesAlimento/$', 'nutricionApp.views.eliminar_nutrientesAlimento'),
    url(r'^database/odata/$', 'nutricionApp.views.get_data'),

]
