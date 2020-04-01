#encoding: utf-8

# import os
#
# from celery import Celery
# from django.conf import settings
#
# os.environ.setdefault('DJANGO_SETTINGS_MODULE', 'dr_dj.settings')
#
# app = Celery("dr_dj")
#
# app.config_from_object("django.conf:settings", namespace="CELERY")
#
# app.autodiscover_tasks(lambda: settings.INSTALLED_APPS)