from django.contrib import admin
from .models import Paciente
from .models import Medico
from .models import Alimento
from .models import Nutriente
from .models import Etiqueta
from .models import Recomendacion
from .models import Regla
from .models import Gramosporporcion
from .models import Paciente_Alimento_Porcion
from .models import Cantidad_Nutriente_Alimento
from .models import Nutriente_Etiqueta
from .models import Funcion_Lineal
from .models import Precendente_Regla

# Register your models here.
admin.site.register(Paciente)
admin.site.register(Medico)
admin.site.register(Alimento)
admin.site.register(Nutriente)
admin.site.register(Etiqueta)
admin.site.register(Recomendacion)
admin.site.register(Regla)
admin.site.register(Gramosporporcion)
admin.site.register(Paciente_Alimento_Porcion)
admin.site.register(Cantidad_Nutriente_Alimento)
admin.site.register(Nutriente_Etiqueta)
admin.site.register(Funcion_Lineal)
admin.site.register(Precendente_Regla)


