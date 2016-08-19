from django.db import models

# Create your models here.

class Paciente(models.Model):
    fecha_nacimiento = models.BigIntegerField(default=1)
    nombres = models.CharField(max_length=254, null=False)
    correo = models.EmailField(null=False,max_length=254,unique=True)
    peso = models.DecimalField(max_digits=5, decimal_places=2)
    estatura_cm = models.IntegerField()
    ejercicio = models.IntegerField()
    genero = models.CharField(max_length=1)
    password = models.CharField(default="12345",max_length=10)

    def __str__(self):
        return self.correo
class Medico(models.Model):
    nombres = models.CharField(max_length=254, null=False)
    empresa = models.CharField(max_length=254, null=False)
    correo = models.EmailField(null=False,max_length=254,unique=True)
    
    def __str__(self):
        return self.correo

class Alimento(models.Model):
    nombre = models.CharField(max_length=50, null=False,unique=True)
    codigo_fao = models.CharField(max_length=50, null=False,unique=True)
    tags = models.CharField(max_length=80, null=False)
    
    def __str__(self):
        return self.nombre
        
class Nutriente(models.Model):
    nombre = models.CharField(max_length=50, null=False,unique=True)
    kcalxgramo =  models.IntegerField(null=False, default = 0)
    def __str__(self):
        return self.nombre
        
class Etiqueta(models.Model):
    nombre = models.CharField(max_length=50, null=False,unique=True)
    
    def __str__(self):
        return self.nombre

class Recomendacion(models.Model):
    descripcion = models.CharField(max_length=256, null=False)
    
    def __str__(self):
        return self.descripcion

class Gramosporporcion(models.Model):
    nombre_porcion = models.CharField(max_length=254, null=False)
    valor_gramos = models.DecimalField(max_digits=5, decimal_places=2)
    alimento = models.ForeignKey(Alimento)
    
    def __str__(self):
        return self.nombre_porcion
        
class Medico_Paciente(models.Model):
    paciente = models.ForeignKey(Paciente)
    medico = models.ForeignKey(Medico)
    seguimiento = models.BooleanField(null=False)

    def __str__(self):
        return u'%s %s' % (self.paciente.nombres, self.medico.nombres)

class Paciente_Alimento_Porcion(models.Model):
    paciente = models.ForeignKey(Paciente)
    alimento_porcion = models.ForeignKey(Gramosporporcion)
    tamano_porcion = models.DecimalField(max_digits=15, decimal_places=3)
    fecha_consumo = models.DateTimeField()
    def __str__(self):
        return u'%s %s' % (self.paciente.nombres, self.fecha_consumo)

class Cantidad_Nutriente_Alimento(models.Model):
    nutriente = models.ForeignKey(Nutriente)
    alimento = models.ForeignKey(Alimento)
    cantidad_gr = models.DecimalField(max_digits=15, decimal_places=3)
    def __str__(self):
        return u'%s %s' % (self.alimento, self.nutriente)

       
        
class Nutriente_Etiqueta(models.Model):
    nutriente = models.ForeignKey(Nutriente)
    etiqueta = models.ForeignKey(Etiqueta)
    
    def __str__(self):
        return u'%s %s' % (self.nutriente, self.etiqueta)
        
class Funcion_Lineal(models.Model):
    m = models.DecimalField(max_digits=8, decimal_places=4)
    b = models.DecimalField(max_digits=8, decimal_places=4)
    conjunto = models.ForeignKey(Nutriente_Etiqueta)
    x1 = models.DecimalField(max_digits=8, decimal_places=4)
    x2 = models.DecimalField(max_digits=8, decimal_places=4)
    unidad_medida = models.CharField(max_length=1, null=False,  default= "g")
    def __str__(self):
        return self.conjunto
        
class Regla(models.Model):
    nombre = models.CharField(max_length=50, null=False,unique=True)
    recomendacion = models.CharField(max_length=500, null=False)
    consecuente = models.ForeignKey(Nutriente_Etiqueta)

    def __str__(self):
        return self.nombre
        
class Precendente_Regla(models.Model):
    regla = models.ForeignKey(Regla)
    precendente = models.ForeignKey(Nutriente_Etiqueta)
    
    def __str__(self):
        return u'%s %s' % (self.regla.nombre, self.precendente)


