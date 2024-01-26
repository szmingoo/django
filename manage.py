#!/usr/bin/env python
"""Django's command-line utility for administrative tasks."""
import os
import sys


def main():
    """Run administrative tasks."""
    os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'interface.settings')
    try:
        from django.core.management import execute_from_command_line
    except ImportError as exc:
        raise ImportError(
            "Couldn't import Django. Are you sure it's installed and "
            "available on your PYTHONPATH environment variable? Did you "
            "forget to activate a virtual environment?"
        ) from exc
    execute_from_command_line(sys.argv)


if __name__ == '__main__':
    main()






#创建项目
# django-admin startproject
#创建应用
# python manage.py startapp app


# 正向生成
# python manage.py makemigrations
# python manage.py migrate

# 反向生成
# python manage.py inspectdb > app/models.py

#创建超级管理员
# python manage.py createsuperuser


# python manage.py makemigrations --fake
# python manage.py migrate --fake







# npm run dev
# 注释vue.config.js中proxy代码块
# npm run build:prod
