# -*- coding: utf-8 -*-
# Generated by Django 1.11.4 on 2017-08-27 16:33
from __future__ import unicode_literals

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Customer',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100, unique=True)),
                ('logo', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='Issue',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('description', models.CharField(max_length=500)),
                ('created', models.DateField()),
                ('resolved', models.DateField(null=True)),
                ('closed', models.DateField(null=True)),
            ],
        ),
        migrations.CreateModel(
            name='IssuePriority',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('description', models.CharField(max_length=100, unique=True)),
            ],
        ),
        migrations.CreateModel(
            name='IssueSeverity',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('description', models.CharField(max_length=100, unique=True)),
            ],
        ),
        migrations.CreateModel(
            name='IssueStatus',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('description', models.CharField(max_length=100, unique=True)),
            ],
        ),
        migrations.CreateModel(
            name='IssueSeverity',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('description', models.CharField(max_length=100, unique=True)),
            ],
        ),
        migrations.CreateModel(
            name='Member',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
            ],
        ),
        migrations.CreateModel(
            name='Project',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('name', models.CharField(max_length=100)),
                ('start', models.DateField(blank=True, null=True)),
                ('end', models.DateField(blank=True, null=True)),
                ('logo', models.CharField(max_length=100)),
                ('customer', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='quality.Customer')),
            ],
        ),
        migrations.CreateModel(
            name='ProjectStatus',
            fields=[
                ('id', models.AutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('description', models.CharField(max_length=100, unique=True)),
            ],
        ),
        migrations.AddField(
            model_name='project',
            name='status',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='quality.ProjectStatus'),
        ),
        migrations.AddField(
            model_name='issue',
            name='assignee',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='assignee', to='quality.Member'),
        ),
        migrations.AddField(
            model_name='issue',
            name='priority',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='quality.IssuePriority'),
        ),
        migrations.AddField(
            model_name='issue',
            name='project',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='quality.Project'),
        ),
        migrations.AddField(
            model_name='issue',
            name='reporter',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, related_name='reporter', to='quality.Member'),
        ),
        migrations.AddField(
            model_name='issue',
            name='status',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='quality.IssueStatus'),
        ),
        migrations.AddField(
            model_name='issue',
            name='severity',
            field=models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='quality.IssueSeverity'),
        ),
    ]