from django.conf.urls import include, url
from django.contrib import admin

urlpatterns = [
    url(r'^admin/', include(admin.site.urls)),
    url(r'^$', 'nutricionApp.views.home'),
    url(r'^alimentos$', 'nutricionApp.views.listar_alimentos'),
]
