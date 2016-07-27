from django.conf.urls import include, url
from django.contrib import admin

urlpatterns = [
    url(r'^admin/', include(admin.site.urls)),
    url(r'^$', 'nutricionApp.views.home'),
    url(r'^alimentos$', 'nutricionApp.views.listar_alimentos'),
    url(r'^nutrientes$', 'nutricionApp.views.listar_nutrientes'),
    url(r'^etiquetas/([A-Za-z]{1,20})/$', 'nutricionApp.views.listar_etiquetasNutriente'),
    url(r'^etiquetas$', 'nutricionApp.views.listar_etiquetas'),
    url(r'^guardar_funciones/$', 'nutricionApp.views.guardar_funciones'),
    url(r'^guardar_nutrientes/$', 'nutricionApp.views.guardar_nutrientes'),
    url(r'^guardar_etiquetas/$', 'nutricionApp.views.guardar_etiquetas'),
    url(r'^guardar_nuevo_etiqueta_nutriente/$', 'nutricionApp.views.guardar_nuevo_etiqueta_nutriente'),

]
