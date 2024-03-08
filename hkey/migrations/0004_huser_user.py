# Generated by Django 2.2.28 on 2024-02-06 22:50

from django.db import migrations, models


class Migration(migrations.Migration):
    dependencies = [
        ("hkey", "0003_auto_20231129_2250"),
    ]

    operations = [
        migrations.AddField(
            model_name="huser",
            name="user",
            field=models.CharField(
                blank=True, default=None, help_text="User", max_length=16, null=True, unique=True, verbose_name="netId"
            ),
        ),
    ]