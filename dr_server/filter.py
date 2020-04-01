import django_filters

from .models import *

class ConferencesFilter(django_filters.rest_framework.FilterSet):

    class Mate:
        model = ConferenceInfo
        fields = ['con_name',]

class JournalsFilter(django_filters.rest_framework.FilterSet):
    journal_name = django_filters.CharFilter(name='journal_name', lookup_expr='iexact')
    class Meta:
        model = JournalsInfo
        # fields = ["journal_name","journal_short_name"]
        fields = {
            "journal_name": ['exact','icontains'],
            "journal_short_name": ['exact'],
        }
        