from django.contrib import admin
from .models import Usuario
from .models import Alimento
from .models import Nutriente
from .models import Etiqueta
from .models import Recomendaciones
from .models import Regla
from .models import Gramosporporcion
from .models import Usuario_Alimento_Porcion
from .models import Cantidad_Nutriente_Alimento
from .models import Nutriente_Etiqueta
from .models import Funcion_Lineal
from .models import Precendente_Consecuente

# Register your models here.
admin.site.register(Usuario)
admin.site.register(Alimento)
admin.site.register(Nutriente)
admin.site.register(Etiqueta)
admin.site.register(Recomendaciones)
admin.site.register(Regla)
admin.site.register(Gramosporporcion)
admin.site.register(Usuario_Alimento_Porcion)
admin.site.register(Cantidad_Nutriente_Alimento)
admin.site.register(Nutriente_Etiqueta)
admin.site.register(Funcion_Lineal)
admin.site.register(Precendente_Consecuente)


