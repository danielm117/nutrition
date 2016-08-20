# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('nutricionApp', '0005_remove_regla_recomendacion'),
    ]

    operations = [
        migrations.AddField(
            model_name='regla',
            name='recomendacion',
            field=models.CharField(max_length=500, default='no disponible'),
            preserve_default=False,
        ),
    ]
