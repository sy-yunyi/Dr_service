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
    published = models.CharField(max_length=100)
    url_link = models.CharField(max_length=200)
    classes = models.CharField(max_length=2)
    subject = models.CharField(max_length=100)
    category = models.CharField(max_length=20)
    

    def __str__(self):
        return self.full_name

    class Meta:
        db_table = ''
        managed = True
        verbose_name = 'CCFInfo'
        verbose_name_plural = 'CCFInfos'
class JournalsInfo(models.Model):

    journal_name = models.CharField(max_length = 500)
    journal_short_name = models.CharField(max_length=100)
    journal_issn = models.CharField(max_length=24)
    journal_office = models.CharField(max_length=400)
    journal_contribute = models.CharField(max_length=400)
    journal_focus = models.CharField(max_length = 400)
    journal_h_index = models.FloatField()
    journal_jcr = models.CharField(max_length=24)
    journal_group = models.CharField(max_length=100)
    journal_subgroups = models.CharField(max_length = 500)
    journal_sci = models.CharField(max_length = 30)
    journal_ccf = models.CharField(max_length = 30)
    journal_accept_ratio = models.FloatField()
    journal_amount = models.IntegerField()
    journal_cited = models.IntegerField()
    journal_cited_self = models.FloatField()
    journal_cs = models.FloatField()
    journal_cs_sjr = models.FloatField()
    journal_cs_snip = models.FloatField()
    journal_publish_cycle = models.CharField(max_length=24)

    def __str__(self):
        return self.journal_name

    class Meta:
        db_table = ''
        managed = True
        verbose_name = 'JournalsInfo'
        verbose_name_plural = 'JournalsInfos'



