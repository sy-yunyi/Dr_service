'''
@Descripttion: 
@version: 
@Author: Six
@Date: 2020-01-05 17:24:43
@LastEditors  : Six
@LastEditTime : 2020-03-09 18:07:21
'''
from django.shortcuts import render
from django.views import View
from django.http import JsonResponse
from django.core import serializers
from rest_framework.decorators import api_view
from rest_framework.response import Response
from rest_framework.reverse import reverse
from rest_framework.views import APIView
from rest_framework.viewsets import ModelViewSet
from django.views.decorators.http import require_http_methods
from .models import CCFInfo,ConferenceInfo,JournalsInfo
from .serializers import CCFInfoSerializer,ConferenceSerializer,JournalsSerializer
from django.db.models import Count
from rest_framework import generics,status
from django.http import Http404
from .filter import JournalsFilter
# Create your views here.
import json
import pdb


@api_view(['GET'])
def api_root(request, format=None):
    return Response({
        'ccf': reverse('ccf_list', request=request, format=format),
        'conferences': reverse('conference_list', request=request, format=format),
        "conference_info":reverse("conference_info",request=request,format=format),
        "journals_hot":reverse('journals_hot',request=request,format=format),
        "journals_sub":reverse("journals_sub",request=request,kwargs={'sub':"管理科学"},format=format),
        "journals_id":reverse("journals_id",request=request,kwargs={'jid':1},format=format),
        "journals_sea":reverse("journals_sea",request=request,kwargs={'search':'4OR'},format=format)

    })

class CCFInfoList(generics.ListCreateAPIView):
    serializer_class = CCFInfoSerializer
    def list(self,request):
        # queryset = CCFInfo.objects.all()
        response = {
            'ret': 1,
            'ccf_list': [],
            "sub_list":[],
            'msg': 'success',
            'total': ''
        }
        ccf_info = CCFInfo.objects.all()
        sub_info = CCFInfo.objects.values("subject").annotate(Count("subject"))
        ccf_list = []
        sub_list = []
        for sub in sub_info:
            sub_list.append(sub["subject"])
            ccf_list.append([CCFInfoSerializer(ccf_info.filter(subject=sub["subject"],category="期刊"), many=True).data,CCFInfoSerializer(ccf_info.filter(subject=sub["subject"],category="会议"), many=True).data])      
        response['ccf_list'] = ccf_list
        response['sub_list'] = sub_list
        return Response(response)

class ConferenceList(APIView):
    """
    列出所有的会议，或者增加一个会议
    """

    serializer_class = ConferenceSerializer
    def get(self,request,format=None):
        conferences = ConferenceInfo.objects.all()
        con_serializer = ConferenceSerializer(conferences,many=True)
        return Response(con_serializer.data)
    
    def post(self,request,format=None):
        con_serializer = ConferenceSerializer(data=reuqest.data)
        if con_serializer.is_valid():
            con_serializer.save()
            return Response(con_serializers.data,status=status.HTTP_201_CREATED)
        return Response(con_serializer.error,status=status.HTTP_400_BAD_REQUEST)

class ConferenceInfoDetail(APIView):
    """
    获取,更新，删除一个会议的详细信息
    """
    def get_object_by_name(self,con_name):
        """
        通过会议全称获取会议信息
        """
        try:
            return ConferenceInfo.objects.get(con_name=con_name)
        except ConferenceInfo.DoesNotExist:
            return 0

    def get_object_by_sname(self,con_sname):
        """
        通过会议简称获取会议信息
        """
        try:
            return ConferenceInfo.objects.get(con_sname=con_sname)
        except ConferenceInfo.DoesNotExist:
            return 0

    def get_object_by_id(self,con_id):
        """
        通过会议ID获取会议信息
        """
        try:
            return ConferenceInfo.objects.get(id=con_id)
        except ConferenceInfo.DoesNotExist:
            return 0

    def get(self,reuqest,format=None):
        con_name = self.request.query_params.get('con_name', None)
        con_sname = self.request.query_params.get('con_sname', None)
        con_id = self.request.query_params.get('id', None)
        if con_name:
            conf = self.get_object_by_name(con_name)
            conf_ser = ConferenceSerializer(conf)
            return Response(conf_ser.data)
        elif con_sname:
            conf = self.get_object_by_name(con_sname)
            conf_ser = ConferenceSerializer(conf)
            return Response(conf_ser.data)
        elif con_id:
            conf = self.get_object_by_id(con_id)
            conf_ser = ConferenceSerializer(conf)
            return Response(conf_ser.data)
        else:
            raise Http404
 

    def put(self,reuqest,format=None):
        con_id = self.request.query_params.get('id', None)
        conf = self.get_object_by_id(con_id)
        conf_ser = ConferenceSerializer(conf,request.data)

        if conf_ser.is_valid():
            conf_ser.save()
            return Response(conf_ser.data)
        return Response(conf_ser.error,status=status.HTTP_400_BAD_REQUEST)

    def delete(self,request,format=None):
        con_id = self.request.query_params.get('id', None)
        conf = self.get_object_by_id(con_id)
        conf.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)



class JournalsHotList(APIView):

    # def get_journals_list(self):

    def get(self,request,format=None):
        try:
            journal_info = JournalsInfo.objects.filter(journal_hot=True)
            response = {
            'ret': 1,
            'journal_list': [],
            'msg': 'success',
            'total': ''}
            journal_list = []
            for journal in journal_info:
                journal_dict = {}
                journal_dict["journal_id"] = journal.id
                journal_dict["fullName"] = journal.journal_name
                journal_dict["shortName"] = journal.journal_short_name
                journal_dict["property"] = [journal.journal_b_sub,"影响因子："+ str(journal.journal_index)]
                journal_dict["rate"] = ["JCR: "+ str(journal.journal_jcr),"CCF: "+ str(journal.journal_ccf)]
                journal_list.append(journal_dict)
            response["journal_list"] = journal_list
        except JournalsInfo.DoesNotExist:
            raise Http404
        else:
            # return Response(JournalsSerializer(journal_info,many=True).data)
            return Response(response)
        
class JournalsSubList(APIView):

    def get(self,request,sub,format=None):
        try:
            journal_info = JournalsInfo.objects.filter(journal_b_sub=sub)
            response = {
            'ret': 1,
            'journal_list': [],
            'msg': 'success',
            'total': ''}
            journal_list = []
            for journal in journal_info:
                journal_dict = {}
                journal_dict["journal_id"] = journal.id
                journal_dict["fullName"] = journal.journal_name
                journal_dict["shortName"] = journal.journal_short_name
                journal_dict["property"] = [journal.journal_b_sub,"影响因子："+ str(journal.journal_index)]
                journal_dict["rate"] = ["JCR: "+ str(journal.journal_jcr),"CCF: "+ str(journal.journal_ccf)]
                journal_list.append(journal_dict)
            response["journal_list"] = journal_list
        except JournalsInfo.DoesNotExist:
            raise Http404
        else:
            # return Response(JournalsSerializer(journal_info,many=True).data)
            return Response(response)
    
    def post(self,resquest,format=None):
        jou_serializer = JournalsSerializer(data=reuqest.data)
        if jou_serializer.is_valid():
            jou_serializer.save()
            return Response(jou_serializer.data,status=status.HTTP_201_CREATED)
        return Response(jou_serializer.error,status=status.HTTP_400_BAD_REQUEST)


class JournalInfoDetial(APIView):
    # filter_class = JournalsFilter
    serializer_class = JournalsSerializer
    # search_fields = ("journal_name","journal_short_name")
    def get(self,request,jid,format=None):
        journal_info = JournalsInfo.objects.filter(id=jid)
        response = {
            'ret':"1",
            'msg': 'success',
            'data':' '
        }
        response["data"] = JournalsSerializer(journal_info,many=True).data
        return Response(response)


class JournalSearch(APIView):
    serializer_class = JournalsSerializer
    def get(self,request,search,format=None):
        # start_search = JournalsInfo.objects.filter("journal_name_startwith"=search)
        # start_search_s = JournalsInfo.objects.filter("journal_short_name_startwith"=search)
        try:
            contain_search = JournalsInfo.objects.filter(journal_name__contains=search)
        except JournalsInfo.DoesNotExist:
            try:
                contain_search_s = JournalsInfo.objects.filter(journal_short_name__contains=search)
            except JournalsInfo.DoesNotExist:
                response = {
                "ret":1,
                "msg":"success",
                "journal_list":[]
                }
                return Response(response)
        else:
            response = {
                "ret":1,
                "msg":"success",
                "journal_list":[]
            }
            journal_list = []
            for journal in contain_search:
                journal_dict={}
                journal_dict["journal_id"] = journal.id
                journal_dict["fullName"] = journal.journal_name
                journal_dict["shortName"] = journal.journal_short_name
                journal_dict["property"] = [journal.journal_b_sub,"影响因子："+ str(journal.journal_index)]
                journal_dict["rate"] = ["JCR: "+ str(journal.journal_jcr),"CCF: "+ str(journal.journal_ccf)]
                journal_list.append(journal_dict)
            response["journal_list"] = journal_list

            return Response(response)






# @require_http_methods(["GET"])
# def get_info_for_subject(request):
#     response = {}
#     sub = request.GET.get("subject")
#     try:
#         sub_info = CCFInfo.objects.filter(subject=sub)
#         print(sub_info)
#         response["list"] = json.loads(serializers.serialize("json",sub_info))
#         response["msg"] = "返回ccf列表数据成功"
#         response["ret"] = 1
#     except Exception as e:
#         response["msg"] = str(e)
#         response["ret"] = 0
#     return JsonResponse(response)

# @require_http_methods(["GET"])
# def get_info_all(request):
#     response = {}
#     try:
#         ccf_info = CCFInfo.objects.all()
#         sub_info = CCFInfo.objects.values("subject").annotate(Count("subject"))
#         ccf_list = []
#         sub_list = []
#         for sub in sub_info:
#             sub_list.append(sub["subject"])
#             ccf_list.append(json.loads(serializers.serialize("json",ccf_info.filter(subject=sub["subject"]))))
#         response["sub_list"] = sub_list
#         response["ccf_list"] = ccf_list
#         response["msg"] = "返回ccf列表数据成功"
#         response["ret"] = 1
#     except Exception as e:
#         response["msg"] = str(e)
#         response["err"] = 1
#     return JsonResponse(response)

# @require_http_methods(["GET"])
# def add_ccf_info(request):
#     response = {}
#     try:
#         short_name = request.GET.get("short_name")
#         full_name = request.GET.get("full_name")
#         published = request.GET.get("published")
#         url_link = request.GET.get("url_link")
#         classes = request.GET.get("classes")
#         subject = request.GET.get("subject")
#         category = request.GET.get("category")
#         ccf_item = CCFInfo(short_name=short_name,full_name=full_name,published=published,url_link=url_link,classes=classes,subject=subject,category=category)
#         ccf_item.save()
#         response['msg'] = 'success'
#         response['error_num'] = 0
#     except Exception as e:
#         response['msg'] = str(e)
#         response['error_num'] = 1
#     return JsonResponse(response)

        




