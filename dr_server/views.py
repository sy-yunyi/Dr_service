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
from rest_framework import mixins
from rest_framework.viewsets import ModelViewSet
from rest_framework.pagination import LimitOffsetPagination
from django.views.decorators.http import require_http_methods
from .models import CCFInfo,ConferenceInfo,JournalsInfo,IndexInfo
from .serializers import CCFInfoSerializer,ConferenceSerializer,JournalsSerializer,IndexsSerializer
from django.db.models import Count
from rest_framework import generics,status
from django.http import Http404
from .filter import JournalsFilter
from datetime import datetime
from django.db.models import Q
# Create your views here.
import json
import pdb


@api_view(['GET'])
def api_root(request, format=None):
    return Response({
        'ccf': reverse('ccf_list', request=request, kwargs={'type':'conference'},format=format),
        'conferences': reverse('conference_list', request=request, format=format),
        "conference_info":reverse("conference_info",request=request,format=format),
        "journals_hot":reverse('journals_hot',request=request,format=format),
        "journals_sub":reverse("journals_sub",request=request,kwargs={'sub':"管理科学"},format=format),
        "journals_id":reverse("journals_id",request=request,kwargs={'jid':1},format=format),
        "journals_sea":reverse("journals_sea",request=request,kwargs={'search':'4OR'},format=format),
        "journals":reverse("journals",request=request,format=format),
        "indexinfo":reverse("indexinfo",request=request,format=format)
    })

@api_view(['GET'])
def messageNotify(request,format=None):
    return Response({
        'ret':1,
        'data':{
            "short_message":'Dr',
            "message":'Dr',
            "tip_title":"",
            "tip_content":"会议信息每天更新，若信息有误，可以通过“关于”页面的公众号按钮或者意见反馈按钮进行反馈。",
            "tip_btn":1
        }
    })


@api_view(['GET'])
def dyInfo(request,format=None):
    return Response({
        'ret':1,
        'data':{
            "background":'https://s1.ax1x.com/2020/06/02/tY7hPe.md.jpg',
            "appreciation_qr":'https://s1.ax1x.com/2020/06/03/tddFqs.jpg',
            "dr_qr":'https://s1.ax1x.com/2020/06/03/tddAZn.gif',
        }
    })




class MyPagination(LimitOffsetPagination):
    #默认显示的个数
    default_limit = 2
    #当前的位置
    offset_query_param = "offset"
    #通过limit改变默认显示的个数
    limit_query_param = "limit"
    #一页最多显示的个数
    max_limit = 10

class CCFInfoList(generics.UpdateAPIView,generics.ListCreateAPIView):
    serializer_class = CCFInfoSerializer
    
    def list(self,request,type = None):
        response = {
            'ret': 0,
            'data':[],
            'msg': '',
        }
        # queryset = CCFInfo.objects.all()
        sub_info = CCFInfo.objects.values("subject").annotate(Count("subject"))
        ccf_info = CCFInfo.objects.all()
        
        if type=="conference":
            data_l = []
            for sub in sub_info:
                sub_dict = {}
                sub_dict["subject_name"]=(sub["subject"])
                sub_dict["list"]=CCFInfoSerializer(ccf_info.filter(subject=sub["subject"],category="会议"), many=True).data
                data_l.append(sub_dict)
            response['data'] = data_l
            response["ret"] = 1
            response["msg"] = "success"
        elif type == "journal":
            data_l = []
            for sub in sub_info:
                sub_dict = {}
                sub_dict["subject_name"]=(sub["subject"])
                sub_dict["list"]=CCFInfoSerializer(ccf_info.filter(subject=sub["subject"],category="期刊"), many=True).data
                response['data'].append(sub_dict)
            response["ret"] = 1
            response["msg"] = "success"
        else:
            response["ret"] = 0
            response["msg"] = "failed"

        return Response(response)

    def update(self,request,type=None,*args,**kwargs):
        ccf_name = self.request.query_params.get('name', None)
        ccf_sname = self.request.query_params.get('sname', None)
        conf1 = None
        conf2 = None
        if ccf_sname:
            conf1 = CCFInfo.objects.filter(short_name=ccf_sname).first()
        elif ccf_name:
            conf2 = CCFInfo.objects.filter(full_name=ccf_name).first()
        if conf1:
            conf_ser = CCFInfoSerializer(conf1,data=request.data)
        elif conf2:
            conf_ser = CCFInfoSerializer(conf2,data=request.data)
        else:
            rep = {"status":0}
            return Response(rep,status=status.HTTP_400_BAD_REQUEST)
        if conf_ser.is_valid():
            conf_ser.save()
            return Response(conf_ser.data,status=status.HTTP_201_CREATED)
        rep = {"status":0}
        return Response(rep,status=status.HTTP_400_BAD_REQUEST)


class CCFJournalInfo(APIView):

    def get(self,request,journal_name,format = None):
        ccfjoural = CCFInfo.objects.get(full_name_u=journal_name)
        data1 = CCFInfoSerializer(ccfjoural).data
        response = {
            'ret':"1",
            'msg': 'success',
            'data':' '
            }
        # pdb.set_trace()
        try:
            journal = JournalsInfo.objects.filter(journal_name_u=journal_name)
            data2 = JournalsSerializer(journal,many=True).data[0]
        except:
            response["data"]=data1
            return Response(response)
        else:
            response["data"]=dict(data1,**data2)
            return Response(response)


        # ccf = CCFInfo.objects.get(full_name_u=journal_name)
        


class ConferenceList(APIView):
    """
    列出所有的会议，或者增加一个会议
    """

    serializer_class = ConferenceSerializer
    def get(self,request,format=None):
        
        conferences = ConferenceInfo.objects.order_by("con_paper_deadline")
        con_ccf = self.request.query_params.get('ccf', None)
        con_onTime = self.request.query_params.get('onTime', None)
        if con_ccf and con_onTime:
            conferences = conferences.filter(Q(con_rank1__in=['A','B','C']) & Q(con_paper_deadline__gt=datetime.now()))
        elif con_ccf:
            conferences = conferences.filter(con_rank1__in=['A','B','C'])
        elif con_onTime:
            conferences = conferences.filter(con_paper_deadline__gt=datetime.now())
        response = {
            'ret': 1,
            'data': [],
            'msg': 'success',
            'total': ''}
        page=MyPagination()
        response["total"]=page.get_count(conferences)
        conferences=page.paginate_queryset(conferences,request,view=self)

        confer_list = []
        for conf in conferences:
            confer_dict = {}
            confer_dict["confer_id"] = conf.id
            confer_dict["fullName"] = conf.con_name
            confer_dict["shortName"] = conf.con_sname
            confer_dict["property"] = ["截稿日期："+str(conf.con_paper_deadline),"地点："+ str(conf.con_where)]
            dy=conf.con_delay if conf.con_delay!=" " else ""
            if conf.con_rank1!="" and conf.con_rank1!=" " and conf.con_rank1!="暂无" and conf.con_delay!=" " and conf.con_delay!="":
                confer_dict["rate"] = ["CCF: "+ str(conf.con_rank1),conf.con_delay]
            elif conf.con_rank1!="" and conf.con_rank1!=" " and conf.con_rank1!="暂无":
                confer_dict["rate"] =["CCF: "+ str(conf.con_rank1)]
            elif conf.con_delay!=" " and conf.con_delay!="":
                confer_dict["rate"] =[conf.con_delay]
            else:
                confer_dict["rate"] = []
            confer_list.append(confer_dict)
        response["data"] = confer_list

        # con_serializer = ConferenceSerializer(page_list,many=True)
        return Response(response)
    
    def post(self,request,format=None):
        con_serializer = ConferenceSerializer(data=request.data)
        if con_serializer.is_valid():
            con_serializer.save()
            return Response(con_serializer.data,status=status.HTTP_201_CREATED)
        rep = {"status":0}
        return Response(rep,status=status.HTTP_400_BAD_REQUEST)

class ConferenceInfoDetail(APIView):
    """
    获取,更新，删除一个会议的详细信息
    """
    def get_object_by_name(self,con_name):
        """
        通过会议全称获取会议信息
        """
        try:
            return ConferenceInfo.objects.filter(con_name=con_name).first()
        except ConferenceInfo.DoesNotExist:
            return 0

    def get_object_by_sname(self,con_sname):
        """
        通过会议简称获取会议信息
        """
        try:
            return ConferenceInfo.objects.filter(con_sname=con_sname).first()
        except ConferenceInfo.DoesNotExist:
            return 0

    def get_object_by_id(self,con_id):
        """
        通过会议ID获取会议信息
        """
        try:
            return ConferenceInfo.objects.filter(id=con_id).first()
        except ConferenceInfo.DoesNotExist:
            return 0

    def get(self,request,format=None):
        """
        通过名称，简称，ID 获取会议信息
        """
        con_name = self.request.query_params.get('con_name', None)
        con_sname = self.request.query_params.get('con_sname', None)
        con_id = self.request.query_params.get('id', None)
        if con_name:
            conf = self.get_object_by_name(con_name)
            if conf ==0 :
                raise Http404
            conf_ser = ConferenceSerializer(conf)
            return Response(conf_ser.data)
        elif con_sname:
            conf = self.get_object_by_sname(con_sname)
            if conf ==0 :
                raise Http404
            conf_ser = ConferenceSerializer(conf)
            return Response(conf_ser.data)
        elif con_id:
            conf = self.get_object_by_id(con_id)
            if conf ==0 :
                raise Http404
            conf_ser = ConferenceSerializer(conf)
            return Response(conf_ser.data)
        else:
            raise Http404
 

    def put(self,request,format=None):
        """
        通过ID，更新会议信息
        """
        con_id = self.request.query_params.get('id', None)
        conf = self.get_object_by_id(con_id)
        conf_ser = ConferenceSerializer(conf,data=request.data)
        if conf_ser.is_valid():
            conf_ser.save()
            return Response(conf_ser.data,status=status.HTTP_201_CREATED)
        rep = {"status":0}
        return Response(rep,status=status.HTTP_400_BAD_REQUEST)

    def delete(self,request,format=None):
        """
        通过ID 删除会议
        """
        con_id = self.request.query_params.get('id', None)
        conf = self.get_object_by_id(con_id)
        conf.delete()
        return Response(status=status.HTTP_204_NO_CONTENT)


class ConferenceHotList(APIView):
    serializer_class = ConferenceSerializer
    def get(self,request,format=None):
        conferences = ConferenceInfo.objects.filter(con_paper_deadline__gt=datetime.now()).order_by("con_paper_deadline")
        response = {
            'ret': 1,
            'data': [],
            'msg': 'success',
            'total': ''}
        page=MyPagination()
        response["total"]=page.get_count(conferences)
        conferences=page.paginate_queryset(conferences,request,view=self)
        confer_list = []
        for conf in conferences:
            confer_dict = {}
            confer_dict["confer_id"] = conf.id
            confer_dict["fullName"] = conf.con_name
            confer_dict["shortName"] = conf.con_sname
            confer_dict["property"] = ["截稿日期："+str(conf.con_paper_deadline),"地点："+ str(conf.con_where)]
            dy=conf.con_delay if conf.con_delay!=" " else ""
            if conf.con_rank1!="" and conf.con_rank1!=" " and conf.con_delay!=" ":
                confer_dict["rate"] = ["CCF: "+ str(conf.con_rank1),conf.con_delay]
            elif conf.con_rank1!="" and conf.con_rank1!=" ":
                confer_dict["rate"] =["CCF: "+ str(conf.con_rank1)]
            elif conf.con_delay!=" ":
                confer_dict["rate"] =[conf.con_delay]
            else:
                confer_dict["rate"] = []
            confer_list.append(confer_dict)
        response["data"] = confer_list
        # con_serializer = ConferenceSerializer(conferences,many=True)
        return Response(response)


class JournalsHotList(APIView):
    # def get_journals_list(self):
    def get(self,request,format=None):
        try:
            journal_info = JournalsInfo.objects.filter(journal_hot=True)
            response = {
            'ret': 1,
            'data': [],
            'msg': 'success',
            'total': ''}
            journal_list = []
            for journal in journal_info:
                journal_dict = {}
                journal_dict["journal_id"] = journal.id
                journal_dict["fullName"] = journal.journal_name
                journal_dict["shortName"] = journal.journal_short_name
                journal_dict["property"] = [journal.journal_b_sub,"影响因子："+ str(journal.journal_index)]
                # journal_dict["rate"] = ["JCR: "+ str(journal.journal_jcr),"CCF: "+ str(journal.journal_ccf)]
                if str(journal.journal_ccf) !="暂无":
                    journal_dict["rate"] = ["JCR: "+ str(journal.journal_q),"CCF: "+ str(journal.journal_ccf)]
                else:
                    journal_dict["rate"] = ["JCR: "+ str(journal.journal_q)]
                journal_list.append(journal_dict)
            response["data"] = journal_list
        except JournalsInfo.DoesNotExist:
            raise Http404
        else:
            # return Response(JournalsSerializer(journal_info,many=True).data)
            return Response(response)
    
class JournalInfoList(APIView):
    serializer_class = JournalsSerializer

    def get(self,request,format=None):
        try:
            response = {
            'ret': 1,
            'data': [],
            'msg': 'success',
            'total': ''}
            journal_info = JournalsInfo.objects.all()
            page=MyPagination()
            response["total"]=page.get_count(journal_info)
            page_list=page.paginate_queryset(journal_info,request,view=self)
            
            journal_list = []
            for journal in page_list:
                journal_dict = {}
                journal_dict["journal_id"] = journal.id
                journal_dict["fullName"] = journal.journal_name
                journal_dict["shortName"] = journal.journal_short_name
                journal_dict["property"] = [journal.journal_b_sub,"影响因子："+ str(journal.journal_index)]
                # journal_dict["rate"] = ["JCR: "+ str(journal.journal_jcr),"CCF: "+ str(journal.journal_ccf)]
                if str(journal.journal_ccf) !="暂无":
                    journal_dict["rate"] = ["JCR: "+ str(journal.journal_q),"CCF: "+ str(journal.journal_ccf)]
                else:
                    journal_dict["rate"] = ["JCR: "+ str(journal.journal_q)]

                journal_list.append(journal_dict)
            response["data"] = journal_list
        except JournalsInfo.DoesNotExist:
            raise Http404
        else:
            return Response(response)
    
    def post(self,request,format=None):
        jou_serializer = JournalsSerializer(data=request.data,many=False)

        if jou_serializer.is_valid():
            jou_serializer.save()
            return Response(jou_serializer.data,status=status.HTTP_201_CREATED)
        return Response("error",status=status.HTTP_400_BAD_REQUEST)
    
    def put(self,request,format=None):
        """
        通过ID，更新期刊信息
        """
        jou_id = self.request.query_params.get('id', None)
        jou_info = JournalsInfo.objects.filter(id=jou_id)
        
        jou_ser = ConferenceSerializer(jou_info,request.data)

        if jou_ser.is_valid():
            jou_ser.save()
            return Response(jou_ser.data)
        return Response(jou_ser.error,status=status.HTTP_400_BAD_REQUEST)
        
class JournalsSubList(APIView):

    def get(self,request,sub,format=None):
        try:
            search_key = self.request.query_params.get("qk",None)
            if search_key:
                search_key = search_key.upper()
            if sub=="all":
                if search_key:
                    journal_info = JournalsInfo.objects.filter(Q(journal_short_name__contains=search_key)|Q(journal_name_u__contains=search_key))
                else:
                    journal_info = JournalsInfo.objects.all()
            else:
                if search_key:
                    journal_info = JournalsInfo.objects.filter(Q(journal_b_sub=sub) & (Q(journal_name__contains=search_key)|Q(journal_short_name__contains=search_key)))
                else:
                    journal_info = JournalsInfo.objects.filter(journal_b_sub=sub)
            journal_ssub = journal_info.values("journal_s_sub").annotate(Count("journal_s_sub"))
            journal_bsub = journal_info.values("journal_b_sub").annotate(Count("journal_b_sub"))

            
            jou_index = self.request.query_params.get('index', None)
            jou_sub_list = self.request.query_params.get('subList', None)
            if jou_index and jou_sub_list:
                journal_info = journal_info.filter(Q(journal_index__range=(jou_index.split(",")[0][1:],jou_index.split(",")[1][:-1])) & Q(journal_s_sub__in=jou_sub_list.split(",")))
            elif jou_index:
                journal_info = journal_info.filter(journal_index__range=(jou_index.split(",")[0][1:],jou_index.split(",")[1][:-1]))
            elif jou_sub_list:
                journal_info = journal_info.filter(journal_s_sub__in=jou_sub_list.split(","))
            order_index = self.request.query_params.get('order', None)
            if order_index=='1':  # 升序
                journal_info = journal_info.order_by("journal_index")
            elif order_index=='0' or order_index is None:
                journal_info = journal_info.order_by("-journal_index")

            response = {
            'ret': 0,
            'data': [],
            "s_sub_list":[],
            "b_sub_list":[],
            'msg': '',
            'total': ''}
            page=MyPagination()
            response["total"]=page.get_count(journal_info)
            page_list=page.paginate_queryset(journal_info,request,view=self)
            
            journal_list = []
            for journal in page_list:
                journal_dict = {}
                journal_dict["journal_id"] = journal.id
                journal_dict["fullName"] = journal.journal_name
                journal_dict["shortName"] = journal.journal_short_name
                journal_dict["property"] = [journal.journal_b_sub,"影响因子："+ str(journal.journal_index)]
                if str(journal.journal_ccf) !="暂无":
                    journal_dict["rate"] = ["JCR: "+ str(journal.journal_q),"CCF: "+ str(journal.journal_ccf)]
                else:
                    journal_dict["rate"] = ["JCR: "+ str(journal.journal_q)]

                journal_list.append(journal_dict)
            response["data"] = journal_list
            response["s_sub_list"] = [su["journal_s_sub"] for su in journal_ssub]
            response["b_sub_list"] = [su["journal_b_sub"] for su in journal_bsub]
            response["ret"] = 1
            response["msg"] = "success"
        except JournalsInfo.DoesNotExist:
            raise Http404
        else:
            # return Response(JournalsSerializer(journal_info,many=True).data)
            return Response(response)
    
    def post(self,resquest,format=None):
        jou_serializer = JournalsSerializer(data=request.data)
        if jou_serializer.is_valid():
            jou_serializer.save()
            return Response(jou_serializer.data,status=status.HTTP_201_CREATED)
        return Response("error",status=status.HTTP_400_BAD_REQUEST)


class JournalInfoDetial(APIView):
    """
    通过期刊ID获取期刊信息或者更新期刊信息
    """
    # filter_class = JournalsFilter
    serializer_class = JournalsSerializer
    # search_fields = ("journal_name","journal_short_name")
    def get(self,request,jid,format=None):
        response = {
            'ret':"1",
            'msg': 'success',
            'data':' ',
            "year_list":"",
            "index_list":""
        }
        journal_info = JournalsInfo.objects.filter(id=jid)
        jindexs = IndexInfo.objects.filter(issn=journal_info[0].journal_issn)
       
        year_list = []
        index_list = []
        # pdb.set_trace()
        for jis in jindexs:
            year_list.append(jis.year)
            index_list.append(jis.index_num)
        response["year_list"] =year_list
        response["index_list"] = index_list

        response["year_list"] =year_list
        response["index_list"] = index_list
        response["data"] = JournalsSerializer(journal_info,many=True).data
        return Response(response)
    
    def put(self,request,jid,format=None):
        """
        通过ID，更新期刊信息
        """
        journal_info = JournalsInfo.objects.filter(id=jid)
        journal = ConferenceSerializer(journal_info,request.data)

        if journal.is_valid():
            journal.save()
            return Response(journal.data)
        return Response(journal.error,status=status.HTTP_400_BAD_REQUEST)


class JournalSearch(APIView):
    
    serializer_class = JournalsSerializer
    def get(self,request,search,format=None):
        # start_search = JournalsInfo.objects.filter("journal_name_startwith"=search)
        # start_search_s = JournalsInfo.objects.filter("journal_short_name_startwith"=search)
        
        response = {
                "ret":1,
                "msg":"success",
                "data":[],
                "total":0
            }
        try:

            search = search.upper()
            contain_search = JournalsInfo.objects.filter(Q(journal_name_u__contains=search)|Q(journal_short_name__contains=search))
        except JournalsInfo.DoesNotExist:
            response = {
            "ret":1,
            "msg":"success",
            "data":[],
            "total":0
            }
            return Response(response)
        else:

            page=MyPagination()
            response["total"]=page.get_count(contain_search)
            contain_search=page.paginate_queryset(contain_search,request,view=self)
            
            journal_list = []
            for journal in contain_search:
                journal_dict={}
                journal_dict["journal_id"] = journal.id
                journal_dict["fullName"] = journal.journal_name
                journal_dict["shortName"] = journal.journal_short_name
                journal_dict["property"] = [journal.journal_b_sub,"影响因子："+ str(journal.journal_index)]
                journal_dict["rate"] = ["JCR: "+ str(journal.journal_jcr),"CCF: "+ str(journal.journal_ccf)]
                journal_list.append(journal_dict)
            response["data"] = journal_list

            return Response(response)



class JournalIndex(APIView):

    def get(self,request,format=None):
        issn = self.request.query_params.get('issn', None)
        jindexs = IndexInfo.objects.filter(issn=issn)
        year_list = []
        index_list = []
        # pdb.set_trace()
        for jis in jindexs:
            year_list.append(jis.year)
            index_list.append(jis.index_num)
        # pdb.set_trace()
        return Response({"data":[year_list,index_list]})
    
    def post(self,request,format=None):
        index_ser = IndexsSerializer(data=request.data)
        if index_ser.is_valid():
            index_ser.save()
            return Response(index_ser.data,status=status.HTTP_201_CREATED)
        return Response("error",status=status.HTTP_400_BAD_REQUEST)



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

        




