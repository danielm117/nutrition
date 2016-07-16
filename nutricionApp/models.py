from django.db import models

# Create your models here.

class Usuario(models.Model):
    fecha_nacimiento = models.DateTimeField()
    nombres = models.CharField(max_length=254, null=False)
    correo = models.EmailField(null=False,max_length=254,unique=True)
    peso = models.DecimalField(max_digits=5, decimal_places=2)
    estatura_cm = models.IntegerField()
    ejercicio = models.IntegerField()
    genero = models.CharField(max_length=1)
    
    def __unicode__(self):
        return unicode(self.correo)

class Alimento(models.Model):
    nombre = models.CharField(max_length=50, null=False,unique=True)
    codigo_fao = models.CharField(max_length=50, null=False,unique=True)
    tags = models.CharField(max_length=80, null=False)
    
    def __unicode__(self):
        return unicode(self.nombre)
        
class Nutriente(models.Model):
    nombre = models.CharField(max_length=50, null=False,unique=True)
    kcalxgramo =  models.IntegerField(null=False, default = 0)
    def __unicode__(self):
        return unicode(self.nombre)
        
class Etiqueta(models.Model):
    nombre = models.CharField(max_length=50, null=False,unique=True)
    
    def __unicode__(self):
        return unicode(self.nombre)

class Recomendaciones(models.Model):
    descripcion = models.CharField(max_length=256, null=False)
    
    def __unicode__(self):
        return unicode(self.descripcion)

class Regla(models.Model):
    nombre = models.CharField(max_length=50, null=False,unique=True)
    
    def __unicode__(self):
        return unicode(self.nombre)

class Gramosporporcion(models.Model):
    nombre_porcion = models.CharField(max_length=254, null=False)
    valor_gramos = models.DecimalField(max_digits=5, decimal_places=2)
    alimento = models.IntegerField(Alimento)
    
    def __unicode__(self):
        return unicode(self.nombre_porcion)        
        
class Usuario_Alimento_Porcion(models.Model):
    usuario = models.ForeignKey(Usuario)
    alimento_porcion = models.ForeignKey(Gramosporporcion)
    tamano_porcion = models.DecimalField(max_digits=15, decimal_places=3)
    fecha_consumo = models.DateTimeField()
    
    def __unicode__(self):
        return unicode(self.tamano_porcion)


class Cantidad_Nutriente_Alimento(models.Model):
    nutriente = models.ForeignKey(Alimento)
    alimento = models.ForeignKey(Nutriente)
    cantidad_gr = models.DecimalField(max_digits=15, decimal_places=3)

       
        
class Nutriente_Etiqueta(models.Model):
    nutriente = models.ForeignKey(Nutriente)
    etiqueta = models.ForeignKey(Etiqueta)
    
    def __unicode__(self):
        return u'%s %s' % (self.nutriente, self.etiqueta)
        
class Funcion_Lineal(models.Model):
    m = models.DecimalField(max_digits=8, decimal_places=4)
    b = models.DecimalField(max_digits=8, decimal_places=4)
    conjunto = models.ForeignKey(Nutriente_Etiqueta)
    x1 = models.DecimalField(max_digits=8, decimal_places=4)
    x2 = models.DecimalField(max_digits=8, decimal_places=4)
    unidad_medida = models.CharField(max_length=1, null=False,  default= "g")
    def __unicode__(self):
        return unicode(self.conjunto)

        
class Precendente_Consecuente(models.Model):
    regla_id = models.ForeignKey(Regla)
    nutriente_etiqueta = models.ForeignKey(Nutriente_Etiqueta)
    recomendacion = models.ForeignKey(Recomendaciones)
    tipo = models.CharField(max_length=1, null=False)
    
    def __unicode__(self):
        return unicode(self.regla_id)
