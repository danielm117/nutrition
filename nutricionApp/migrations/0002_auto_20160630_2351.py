# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('nutricionApp', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='alimento',
            name='codigo_fao',
            field=models.CharField(unique=True, max_length=50),
        ),
        migrations.AlterField(
            model_name='alimento',
            name='nombre',
            field=models.CharField(unique=True, max_length=50),
        ),
        migrations.AlterField(
            model_name='etiqueta',
            name='nombre',
            field=models.CharField(unique=True, max_length=50),
        ),
        migrations.AlterField(
            model_name='nutriente',
            name='nombre',
            field=models.CharField(unique=True, max_length=50),
        ),
        migrations.AlterField(
            model_name='regla',
            name='nombre',
            field=models.CharField(unique=True, max_length=50),
        ),
        migrations.AlterField(
            model_name='usuario',
            name='correo',
            field=models.EmailField(unique=True, max_length=254),
        ),
    ]
