# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('nutricionApp', '0002_auto_20160628_0016'),
    ]

    operations = [
        migrations.AlterField(
            model_name='usuario',
            name='genero',
            field=models.CharField(max_length=1),
        ),
        migrations.AlterField(
            model_name='usuario',
            name='nombres',
            field=models.CharField(max_length=254),
        ),
    ]
