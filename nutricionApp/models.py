from django.db import models

# Create your models here.

class USUARIO(models.Model):
    fecha_nacimiento = models.DateTimeField()
    nombres = models.CharField(max_length=254, null=False)
    correo = models.EmailField(null=False,max_length=254)
    peso = models.DecimalField(max_digits=5, decimal_places=2)
    estatura_cm = models.IntegerField()
    ejercicio = models.IntegerField()
    genero = models.CharField(max_length=1)
    
    def __unicode__(self):
        return unicode(self.correo)
class ALIMENTO(models.Model):
    nombre = models.CharField(max_length=50, null=False)
    codigo_fao = models.CharField(max_length=50, null=False)
    tags = models.CharField(max_length=80, null=False)
    
    def __unicode__(self):
        return unicode(self.nombre)
class GRAMOSPORPORCION(models.Model):
    nombre_porcion = models.CharField(max_length=254, null=False)
    valor_gramos = models.DecimalField(max_digits=5, decimal_places=2)
    alimento = models.IntegerField(ALIMENTO)
    
    def __unicode__(self):
        return unicode(self.nombre_porcion)
        
class USUARIO_ALIMENTO_PORCION(models.Model):
    usuario = models.ForeignKey(USUARIO)
    alimento_porcion = models.ForeignKey(GRAMOSPORPORCION)
    tamano_porcion = models.DecimalField(max_digits=15, decimal_places=3)
    fecha_consumo = models.DateTimeField()
    
    def __unicode__(self):
        return unicode(self.tamano_porcion)

class NUTRIENTE(models.Model):
    nombre = models.CharField(max_length=50, null=False)
    
    def __unicode__(self):
        return unicode(self.nombre)

class CANTIDAD_NUTRIENTE_ALIMENTO(models.Model):
    nutriente = models.ForeignKey(ALIMENTO)
    alimento = models.ForeignKey(NUTRIENTE)
    cantidad_gr = models.DecimalField(max_digits=15, decimal_places=3)
    
    def __unicode__(self):
        return unicode(self.nutriente)
        
class ETIQUETA(models.Model):
    nombre = models.CharField(max_length=50, null=False)
    
    def __unicode__(self):
        return unicode(self.nombre)        

class NUTRIENTE_ETIQUETA(models.Model):
    nutriente = models.ForeignKey(NUTRIENTE)
    etiqueta = models.ForeignKey(ETIQUETA)
    
    def __unicode__(self):
        return unicode(self.nutriente)
        
class FUNCION_LINEAL(models.Model):
    m = models.DecimalField(max_digits=8, decimal_places=4)
    b = models.DecimalField(max_digits=8, decimal_places=4)
    conjunto = models.ForeignKey(NUTRIENTE_ETIQUETA)
    x1 = models.DecimalField(max_digits=8, decimal_places=4)
    x2 = models.DecimalField(max_digits=8, decimal_places=4)
    
    def __unicode__(self):
        return unicode(self.conjunto)

        
class RECOMENDACIONES(models.Model):
    descripcion = models.CharField(max_length=256, null=False)
    
    def __unicode__(self):
        return unicode(self.descripcion)
        
class REGLA(models.Model):
    nombre = models.CharField(max_length=50, null=False)
    
    def __unicode__(self):
        return unicode(self.nombre)
        
class PRECEDENTE_CONSECUENTE(models.Model):
    regla_id = models.ForeignKey(REGLA)
    nutriente_etiqueta = models.ForeignKey(NUTRIENTE_ETIQUETA)
    recomendacion = models.ForeignKey(RECOMENDACIONES)
    tipo = models.CharField(max_length=1, null=False)
    
    def __unicode__(self):
        return unicode(self.regla_id)

