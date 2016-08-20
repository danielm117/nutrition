# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('nutricionApp', '0004_paciente_password'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='regla',
            name='recomendacion',
        ),
    ]
