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

# get_by_name = views.ConferenceInfoDetail.as_view({
#     "get":"get_by_name"
# })


urlpatterns = [
    path('ccf_info',views.CCFInfoList.as_view(),name="ccf_list"),
    path("apis",views.api_root),
    path("conferences/",views.ConferenceList.as_view(),name="conference_list"),
    path("conference/",views.ConferenceInfoDetail.as_view(),name="conference_info"),
    path("journals/hot",views.JournalsHotList.as_view(),name="journals_hot"),
    path("journals/<sub>",views.JournalsSubList.as_view(),name='journals_sub'),
    path("journal/<jid>",views.JournalInfoDetial.as_view(),name='journals_id'),
    path("journal/search/<search>",views.JournalSearch.as_view(),name='journals_sea')
    # path('get_info_for_subject/', views.get_info_for_subject,name="subject"),
    # path('get_info_ccf',views.get_info_all,name="get_all"),
    # path('add_ccf_info/',views.add_ccf_info,name="add_ccf")
]