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

from django.views.decorators.http import require_http_methods
from .models import CCFInfo
from django.db.models import Count
# Create your views here.
import json

@require_http_methods(["GET"])
def get_info_for_subject(request):
    response = {}
    sub = request.GET.get("subject")
    try:
        sub_info = CCFInfo.objects.filter(subject=sub)
        print(sub_info)
        response["list"] = json.loads(serializers.serialize("json",sub_info))
        response["msg"] = "返回ccf列表数据成功"
        response["ret"] = 1
    except Exception as e:
        response["msg"] = str(e)
        response["ret"] = 0
    return JsonResponse(response)

@require_http_methods(["GET"])
def get_info_all(request):
    response = {}
    try:
        ccf_info = CCFInfo.objects.all()
        sub_info = CCFInfo.objects.values("subject").annotate(Count("subject"))
        ccf_list = []
        sub_list = []
        for sub in sub_info:
            sub_list.append(sub["subject"])
            ccf_list.append(json.loads(serializers.serialize("json",ccf_info.filter(subject=sub["subject"]))))
        response["sub_list"] = sub_list
        response["ccf_list"] = ccf_list
        response["msg"] = "返回ccf列表数据成功"
        response["ret"] = 1
    except Exception as e:
        response["msg"] = str(e)
        response["err"] = 1
    return JsonResponse(response)

@require_http_methods(["GET"])
def add_ccf_info(request):
    response = {}
    try:
        short_name = request.GET.get("short_name")
        full_name = request.GET.get("full_name")
        published = request.GET.get("published")
        url_link = request.GET.get("url_link")
        classes = request.GET.get("classes")
        subject = request.GET.get("subject")
        category = request.GET.get("category")
        ccf_item = CCFInfo(short_name=short_name,full_name=full_name,published=published,url_link=url_link,classes=classes,subject=subject,category=category)
        ccf_item.save()
        response['msg'] = 'success'
        response['error_num'] = 0
    except Exception as e:
        response['msg'] = str(e)
        response['error_num'] = 1
    return JsonResponse(response)

        




