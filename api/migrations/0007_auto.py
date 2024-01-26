# Generated by Django 4.0.1 on 2022-12-04 08:07

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('api', '0006_delete_book'),
    ]

    operations = [
        migrations.CreateModel(
            name='Auto',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('activity_name', models.CharField(blank=True, max_length=255, null=True)),
                ('order', models.CharField(blank=True, max_length=255, null=True)),
                ('count', models.IntegerField(blank=True, null=True)),
                ('activity_type', models.IntegerField(blank=True, null=True)),
            ],
            options={
                'db_table': 'auto',
                'managed': False,
            },
        ),
    ]
