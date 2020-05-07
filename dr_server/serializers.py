from rest_framework import serializers
from .models import CCFInfo,ConferenceInfo,JournalsInfo

class CCFInfoSerializer(serializers.ModelSerializer):
    class Meta:
        model = CCFInfo
        # fields = ("short_name","full_name","full_name_u","published","url_link","classes","subject","category","where","when","paper_deadline","notification")
        fields = "__all__"

class ConferenceSerializer(serializers.ModelSerializer):
    class Meta:
        model = ConferenceInfo
        fields = "__all__"
        # fields = ("id","con_name","con_sname","con_classes","con_where","con_when","con_paper_deadline","con_notification","con_index","con_cfp","created","con_serach_num","con_hot")


class JournalsSerializer(serializers.ModelSerializer):
    class Meta:
        model = JournalsInfo
        fields = "__all__"