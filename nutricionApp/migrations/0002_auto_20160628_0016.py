# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('nutricionApp', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='usuario',
            name='ejercicio',
            field=models.IntegerField(),
        ),
        migrations.AlterField(
            model_name='usuario',
            name='genero',
            field=models.BooleanField(),
        ),
        migrations.AlterField(
            model_name='usuario',
            name='peso',
            field=models.DecimalField(max_digits=5, decimal_places=2),
        ),
    ]
