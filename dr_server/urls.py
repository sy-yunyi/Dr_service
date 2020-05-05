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
    path('ccf_info/<type>',views.CCFInfoList.as_view(),name="ccf_list"),
    path("apis",views.api_root),
    path("conferences/",views.ConferenceList.as_view(),name="conference_list"),
    path("conferences/hot/",views.ConferenceHotList.as_view(),name="conference_hot"),
    path("conference/",views.ConferenceInfoDetail.as_view(),name="conference_info"),
    path("journals/hot",views.JournalsHotList.as_view(),name="journals_hot"),
    path("journals/<sub>",views.JournalsSubList.as_view(),name='journals_sub'),
    path("journal/<jid>",views.JournalInfoDetial.as_view(),name='journals_id'),
    path("journal/search/<search>",views.JournalSearch.as_view(),name='journals_sea'),
    path("journals/",views.JournalInfoList.as_view(),name="journals"),
    path("CCFJournalInfo/<journal_name>",views.CCFJournalInfo.as_view())

]