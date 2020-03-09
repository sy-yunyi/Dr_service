'''
@Descripttion: 
@version: 
@Author: Six
@Date: 2020-01-05 20:34:13
@LastEditors  : Six
@LastEditTime : 2020-03-09 16:11:27
'''

from django.urls import path,include
from . import views

urlpatterns = [
    path('get_info_for_subject/', views.get_info_for_subject,name="subject"),
    path('get_info_ccf',views.get_info_all,name="get_all"),
    path('add_ccf_info/',views.add_ccf_info,name="add_ccf")
]