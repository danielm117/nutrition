# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
        ('nutricionApp', '0006_regla_recomendacion'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='medico',
            name='empresa',
        ),
    ]
