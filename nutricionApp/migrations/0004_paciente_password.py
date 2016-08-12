# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('nutricionApp', '0003_remove_paciente_password'),
    ]

    operations = [
        migrations.AddField(
            model_name='paciente',
            name='password',
            field=models.CharField(max_length=10, default='12345'),
        ),
    ]
