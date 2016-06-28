# -*- coding: utf-8 -*-
from __future__ import unicode_literals

from django.db import models, migrations


class Migration(migrations.Migration):

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Usuario',
            fields=[
                ('id', models.AutoField(verbose_name='ID', serialize=False, auto_created=True, primary_key=True)),
                ('fecha_nacimiento', models.DateTimeField()),
                ('nombres', models.TextField()),
                ('correo', models.EmailField(max_length=254)),
                ('peso', models.IntegerField()),
                ('estatura_cm', models.IntegerField()),
                ('ejercicio', models.IntegerField(default=0)),
                ('genero', models.BooleanField(default=0)),
            ],
        ),
    ]
