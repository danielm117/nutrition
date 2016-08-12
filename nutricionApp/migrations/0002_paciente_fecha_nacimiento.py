# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('nutricionApp', '0001_initial'),
    ]

    operations = [
        migrations.AddField(
            model_name='paciente',
            name='fecha_nacimiento',
            field=models.BigIntegerField(default=1),
        ),
    ]
