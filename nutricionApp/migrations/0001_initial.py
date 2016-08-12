# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Alimento',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, serialize=False, primary_key=True)),
                ('nombre', models.CharField(max_length=50, unique=True)),
                ('codigo_fao', models.CharField(max_length=50, unique=True)),
                ('tags', models.CharField(max_length=80)),
            ],
        ),
        migrations.CreateModel(
            name='Cantidad_Nutriente_Alimento',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, serialize=False, primary_key=True)),
                ('cantidad_gr', models.DecimalField(decimal_places=3, max_digits=15)),
                ('alimento', models.ForeignKey(to='nutricionApp.Alimento')),
            ],
        ),
        migrations.CreateModel(
            name='Etiqueta',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, serialize=False, primary_key=True)),
                ('nombre', models.CharField(max_length=50, unique=True)),
            ],
        ),
        migrations.CreateModel(
            name='Funcion_Lineal',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, serialize=False, primary_key=True)),
                ('m', models.DecimalField(decimal_places=4, max_digits=8)),
                ('b', models.DecimalField(decimal_places=4, max_digits=8)),
                ('x1', models.DecimalField(decimal_places=4, max_digits=8)),
                ('x2', models.DecimalField(decimal_places=4, max_digits=8)),
                ('unidad_medida', models.CharField(default='g', max_length=1)),
            ],
        ),
        migrations.CreateModel(
            name='Gramosporporcion',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, serialize=False, primary_key=True)),
                ('nombre_porcion', models.CharField(max_length=254)),
                ('valor_gramos', models.DecimalField(decimal_places=2, max_digits=5)),
                ('alimento', models.ForeignKey(to='nutricionApp.Alimento')),
            ],
        ),
        migrations.CreateModel(
            name='Medico',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, serialize=False, primary_key=True)),
                ('nombres', models.CharField(max_length=254)),
                ('empresa', models.CharField(max_length=254)),
                ('correo', models.EmailField(max_length=254, unique=True)),
            ],
        ),
        migrations.CreateModel(
            name='Medico_Paciente',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, serialize=False, primary_key=True)),
                ('seguimiento', models.BooleanField()),
                ('medico', models.ForeignKey(to='nutricionApp.Medico')),
            ],
        ),
        migrations.CreateModel(
            name='Nutriente',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, serialize=False, primary_key=True)),
                ('nombre', models.CharField(max_length=50, unique=True)),
                ('kcalxgramo', models.IntegerField(default=0)),
            ],
        ),
        migrations.CreateModel(
            name='Nutriente_Etiqueta',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, serialize=False, primary_key=True)),
                ('etiqueta', models.ForeignKey(to='nutricionApp.Etiqueta')),
                ('nutriente', models.ForeignKey(to='nutricionApp.Nutriente')),
            ],
        ),
        migrations.CreateModel(
            name='Paciente',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, serialize=False, primary_key=True)),
                ('nombres', models.CharField(max_length=254)),
                ('correo', models.EmailField(max_length=254, unique=True)),
                ('peso', models.DecimalField(decimal_places=2, max_digits=5)),
                ('estatura_cm', models.IntegerField()),
                ('ejercicio', models.IntegerField()),
                ('genero', models.CharField(max_length=1)),
                ('password', models.CharField(default='12345', max_length=10)),
            ],
        ),
        migrations.CreateModel(
            name='Paciente_Alimento_Porcion',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, serialize=False, primary_key=True)),
                ('tamano_porcion', models.DecimalField(decimal_places=3, max_digits=15)),
                ('fecha_consumo', models.DateTimeField()),
                ('alimento_porcion', models.ForeignKey(to='nutricionApp.Gramosporporcion')),
                ('paciente', models.ForeignKey(to='nutricionApp.Paciente')),
            ],
        ),
        migrations.CreateModel(
            name='Precendente_Regla',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, serialize=False, primary_key=True)),
                ('precendente', models.ForeignKey(to='nutricionApp.Nutriente_Etiqueta')),
            ],
        ),
        migrations.CreateModel(
            name='Recomendacion',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, serialize=False, primary_key=True)),
                ('descripcion', models.CharField(max_length=256)),
            ],
        ),
        migrations.CreateModel(
            name='Regla',
            fields=[
                ('id', models.AutoField(verbose_name='ID', auto_created=True, serialize=False, primary_key=True)),
                ('nombre', models.CharField(max_length=50, unique=True)),
                ('consecuente', models.ForeignKey(to='nutricionApp.Nutriente_Etiqueta')),
                ('recomendacion', models.ForeignKey(to='nutricionApp.Recomendacion')),
            ],
        ),
        migrations.AddField(
            model_name='precendente_regla',
            name='regla',
            field=models.ForeignKey(to='nutricionApp.Regla'),
        ),
        migrations.AddField(
            model_name='medico_paciente',
            name='paciente',
            field=models.ForeignKey(to='nutricionApp.Paciente'),
        ),
        migrations.AddField(
            model_name='funcion_lineal',
            name='conjunto',
            field=models.ForeignKey(to='nutricionApp.Nutriente_Etiqueta'),
        ),
        migrations.AddField(
            model_name='cantidad_nutriente_alimento',
            name='nutriente',
            field=models.ForeignKey(to='nutricionApp.Nutriente'),
        ),
    ]
