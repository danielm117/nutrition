from django.db import models

# Create your models here.

class Usuario(models.Model):
    fecha_nacimiento = models.DateTimeField()
    nombres = models.CharField(max_length=254, null=False)
    correo = models.EmailField(null=False,max_length=254)
    peso = models.DecimalField(max_digits=5, decimal_places=2)
    estatura_cm = models.IntegerField()
    ejercicio = models.IntegerField()
    genero = models.CharField(max_length=1)
    
    def __unicode__(self):
        return unicode(self.correo)
