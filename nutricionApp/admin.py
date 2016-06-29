from django.contrib import admin
from .models import USUARIO
from .models import USUARIO_ALIMENTO_PORCION
from .models import GRAMOSPORPORCION
from .models import ALIMENTO
from .models import CANTIDAD_NUTRIENTE_ALIMENTO
from .models import NUTRIENTE
from .models import NUTRIENTE_ETIQUETA
from .models import FUNCION_LINEAL
from .models import ETIQUETA
from .models import RECOMENDACIONES
from .models import REGLA
from .models import PRECEDENTE_CONSECUENTE

# Register your models here.
admin.site.register(USUARIO)
admin.site.register(USUARIO_ALIMENTO_PORCION)
admin.site.register(GRAMOSPORPORCION)
admin.site.register(ALIMENTO)
admin.site.register(CANTIDAD_NUTRIENTE_ALIMENTO)
admin.site.register(NUTRIENTE)
admin.site.register(NUTRIENTE_ETIQUETA)
admin.site.register(FUNCION_LINEAL)
admin.site.register(ETIQUETA)
admin.site.register(RECOMENDACIONES)
admin.site.register(REGLA)
admin.site.register(PRECEDENTE_CONSECUENTE)
