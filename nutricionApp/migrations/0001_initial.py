# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations
import nutricionApp.models


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Alimento',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('nombre', models.CharField(unique=True, max_length=50)),
                ('codigo_fao', models.CharField(unique=True, max_length=50)),
                ('tags', models.CharField(max_length=80)),
            ],
        ),
        migrations.CreateModel(
            name='Cantidad_Nutriente_Alimento',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('cantidad_gr', models.DecimalField(max_digits=15, decimal_places=3)),
            ],
        ),
        migrations.CreateModel(
            name='Etiqueta',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('nombre', models.CharField(unique=True, max_length=50)),
            ],
        ),
        migrations.CreateModel(
            name='Funcion_Lineal',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('m', models.DecimalField(max_digits=8, decimal_places=4)),
                ('b', models.DecimalField(max_digits=8, decimal_places=4)),
                ('x1', models.DecimalField(max_digits=8, decimal_places=4)),
                ('x2', models.DecimalField(max_digits=8, decimal_places=4)),
            ],
        ),
        migrations.CreateModel(
            name='Gramosporporcion',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('nombre_porcion', models.CharField(max_length=254)),
                ('valor_gramos', models.DecimalField(max_digits=5, decimal_places=2)),
                ('alimento', models.IntegerField(verbose_name=nutricionApp.models.Alimento)),
            ],
        ),
        migrations.CreateModel(
            name='Nutriente',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('nombre', models.CharField(unique=True, max_length=50)),
            ],
        ),
        migrations.CreateModel(
            name='Nutriente_Etiqueta',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('etiqueta', models.ForeignKey(to='nutricionApp.Etiqueta')),
                ('nutriente', models.ForeignKey(to='nutricionApp.Nutriente')),
            ],
        ),
        migrations.CreateModel(
            name='Precendente_Consecuente',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('tipo', models.CharField(max_length=1)),
                ('nutriente_etiqueta', models.ForeignKey(to='nutricionApp.Nutriente_Etiqueta')),
            ],
        ),
        migrations.CreateModel(
            name='Recomendaciones',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('descripcion', models.CharField(max_length=256)),
            ],
        ),
        migrations.CreateModel(
            name='Regla',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('nombre', models.CharField(unique=True, max_length=50)),
            ],
        ),
        migrations.CreateModel(
            name='Usuario',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('fecha_nacimiento', models.DateTimeField()),
                ('nombres', models.CharField(max_length=254)),
                ('correo', models.EmailField(unique=True, max_length=254)),
                ('peso', models.DecimalField(max_digits=5, decimal_places=2)),
                ('estatura_cm', models.IntegerField()),
                ('ejercicio', models.IntegerField()),
                ('genero', models.CharField(max_length=1)),
            ],
        ),
        migrations.CreateModel(
            name='Usuario_Alimento_Porcion',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('tamano_porcion', models.DecimalField(max_digits=15, decimal_places=3)),
                ('fecha_consumo', models.DateTimeField()),
                ('alimento_porcion', models.ForeignKey(to='nutricionApp.Gramosporporcion')),
                ('usuario', models.ForeignKey(to='nutricionApp.Usuario')),
            ],
        ),
        migrations.AddField(
            model_name='precendente_consecuente',
            name='recomendacion',
            field=models.ForeignKey(to='nutricionApp.Recomendaciones'),
        ),
        migrations.AddField(
            model_name='precendente_consecuente',
            name='regla_id',
            field=models.ForeignKey(to='nutricionApp.Regla'),
        ),
        migrations.AddField(
            model_name='funcion_lineal',
            name='conjunto',
            field=models.ForeignKey(to='nutricionApp.Nutriente_Etiqueta'),
        ),
        migrations.AddField(
            model_name='cantidad_nutriente_alimento',
            name='alimento',
            field=models.ForeignKey(to='nutricionApp.Nutriente'),
        ),
        migrations.AddField(
            model_name='cantidad_nutriente_alimento',
            name='nutriente',
            field=models.ForeignKey(to='nutricionApp.Alimento'),
        ),
    ]
