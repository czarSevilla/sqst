# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2017-08-30 20:03
from __future__ import unicode_literals

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('quality', '0004_issueinput'),
    ]

    operations = [
        migrations.AddField(
            model_name='issue',
            name='ref',
            field=models.CharField(default=0, max_length=20),
            preserve_default=False,
        ),
        migrations.AddField(
            model_name='issue',
            name='source',
            field=models.CharField(default='local', max_length=100),
            preserve_default=False,
        ),
    ]
