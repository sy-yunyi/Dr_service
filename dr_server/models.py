'''
@Descripttion: 
@version: 
@Author: Six
@Date: 2020-01-05 17:24:43
@LastEditors  : Six
@LastEditTime : 2020-01-13 16:18:59
'''
from django.db import models

# Create your models here.

class CCFInfo(models.Model):

    short_name = models.CharField(max_length=64)
    full_name = models.CharField(max_length=500)

    full_name_u = models.CharField(max_length=500,default=" ")

    published = models.CharField(max_length=100)
    url_link = models.CharField(max_length=200)

    classes = models.CharField(max_length=2)
    subject = models.CharField(max_length=100)
    category = models.CharField(max_length=20)

    con_home = models.CharField(max_length=200)
    ccf_delay = models.CharField(max_length=50)
    ccf_index = models.CharField(max_length=20)

    where = models.CharField(max_length=200)
    when = models.CharField(max_length=200)
    paper_deadline = models.CharField(max_length=50)
    notification = models.CharField(max_length=50,default=" ")

    created = models.DateTimeField(auto_now_add=True)


    def __str__(self):
        return self.full_name

    class Meta:
        db_table = ''
        managed = True
        verbose_name = 'CCFInfo'
        verbose_name_plural = 'CCFInfos'

class ConferenceInfo(models.Model):
    con_name = models.CharField(max_length=500)
    con_sname = models.CharField(max_length=20)
    con_classes = models.CharField(max_length=50)  

    con_home = models.CharField(max_length=200)   # 官网
    con_where = models.CharField(max_length=200)
    con_when = models.CharField(max_length=200)
    con_paper_deadline = models.CharField(max_length=100)
    con_notification = models.CharField(max_length=100) 
    con_index = models.CharField(max_length=20) #届数
    con_cfp = models.TextField()
    con_delay = models.CharField(max_length=50)

    con_rank1 = models.CharField(max_length=10)  #CCF
    con_rank2 = models.CharField(max_length=10)
    con_rank3 = models.CharField(max_length = 10)
    con_rank4 = models.CharField(max_length=10)
    con_rank5 = models.CharField(max_length = 10)

    created = models.DateTimeField(auto_now_add=True)
    con_serach_num = models.IntegerField()
    con_hot = models.BooleanField()

    def __str__(self):
        return self.con_name
    
    class Meta:
        db_table = ''
        managed = True
        verbose_name = "ConferenceInfo"
        verbose_name_plural = "ConferenceInfos"

class JournalsInfo(models.Model):

    journal_name = models.CharField(max_length = 500)
    journal_name_u = models.CharField(max_length = 500)
    journal_short_name = models.CharField(max_length=100)
    journal_issn = models.CharField(max_length=24)
    journal_office = models.CharField(max_length=400)
    journal_public = models.CharField(max_length=400)
    journal_desc = models.CharField(max_length = 400)
    
    journal_jcr = models.CharField(max_length=24)
    journal_q = models.CharField(max_length=24)
    journal_b_sub = models.CharField(max_length=100)
    journal_s_sub = models.CharField(max_length = 500)
    journal_sci = models.CharField(max_length = 30)
    journal_ccf = models.CharField(max_length = 30)
    journal_accept = models.CharField(max_length = 50)
    journal_oa = models.CharField(max_length=10)

    journal_index = models.DecimalField(max_digits=15, decimal_places=5)
    journal_h_index = models.CharField(max_length=50)
    journal_total_index = models.CharField(max_length=50)
    journal_index_self = models.CharField(max_length=40)
    journal_period = models.CharField(max_length=50)
    journal_papers = models.CharField(max_length=10)

    created = models.DateTimeField(auto_now_add=True)
    journal_search_num = models.IntegerField()
    journal_hot = models.BooleanField()

    journal_rank1 = models.CharField(max_length=10)
    journal_rank2 = models.CharField(max_length=10)
    journal_rank3 = models.CharField(max_length=10)
    journal_rank4 = models.CharField(max_length=10)

    def __str__(self):
        return self.journal_name

    class Meta:
        db_table = ''
        managed = True
        verbose_name = 'JournalsInfo'
        verbose_name_plural = 'JournalsInfos'


class IndexInfo(models.Model):
    issn = models.CharField(max_length=10)
    year = models.CharField(max_length=10)
    index_num = models.CharField(max_length=10)

    created = models.DateTimeField(auto_now_add=True)

    exer = models.CharField(max_length=50)

    def __str__(self):
        return self.issn
    
    class Meta:
        db_table = ""
        managed = True
        verbose_name = "IndexInfo"
        verbose_name_plural="IndexInfos"

