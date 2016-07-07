from django.conf.urls import include, url
from django.contrib import admin

urlpatterns = [
    url(r'^admin/', include(admin.site.urls)),
    url(r'^$', 'nutricionApp.views.home'),
    url(r'^alimentos$', 'nutricionApp.views.listar_alimentos'),
    url(r'^nutrientes$', 'nutricionApp.views.listar_nutrientes'),
    url(r'^etiquetas/([A-Za-z]{1,20})/$', 'nutricionApp.views.listar_etiquetas'),
]
