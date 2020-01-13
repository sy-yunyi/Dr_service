'''
@Descripttion: 
@version: 
@Author: Six
@Date: 2020-01-05 20:34:13
@LastEditors  : Six
@LastEditTime : 2020-01-05 21:04:08
'''

from django.urls import path,include
from . import views

urlpatterns = [
    path('get_info/', views.get_info_for_subject,name="subject"),
    path('add_ccf_info/',views.add_ccf_info,name="add_ccf")
]