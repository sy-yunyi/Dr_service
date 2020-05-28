import requests
import pandas as pd
import json
from datetime import datetime
import math

#  查询一个会议，简称，全称，ID
url = "https://sixpence.group/"
def updating(conInfo):
    url = "http://127.0.0.1:8000/dr_server/conference?"
    con_name = conInfo["全称"]
    con_sname = conInfo["简称"]
    sn_url = url+"con_sname="+con_sname
    resps = requests.get(sn_url)
    n_url = url+"con_name="+con_name
    respn = requests.get(n_url)
    dc = {}
    if "id" in json.loads(resps.text).keys():
        dc = json.loads(resps.text)
        dc['con_cfp']="" if type(conInfo["CFP"])!=str and math.isnan(conInfo["CFP"]) else conInfo["CFP"]
        dc['con_rank2']="" if type(conInfo["CORE"])!=str and math.isnan(conInfo["CORE"]) else conInfo["CORE"]
        dc['con_rank3']="" if type(conInfo["QUALIS"])!=str and math.isnan(conInfo["QUALIS"]) else conInfo["QUALIS"]
        dc['created']=datetime.now()
        url = "http://127.0.0.1:8000/dr_server/conference?id="+str(dc["id"])
        resp = requests.put(url,data=dc)
        if resp.status_code==400:
            print("更新失败")
            print(conInfo)
        elif resp.status_code==201:
            print("更新成功")
        # update
    elif "id" in json.loads(respn.text).keys():
        dc = json.loads(respn.text)
        # update
        dc['con_cfp']="" if type(conInfo["CFP"])!=str and math.isnan(conInfo["CFP"]) else conInfo["CFP"]
        dc['con_rank2']="" if type(conInfo["CORE"])!=str and math.isnan(conInfo["CORE"]) else conInfo["CORE"]
        dc['con_rank3']="" if type(conInfo["QUALIS"])!=str and math.isnan(conInfo["QUALIS"]) else conInfo["QUALIS"]
        dc['created']=datetime.now()
        url = "http://127.0.0.1:8000/dr_server/conference?id="+str(dc["id"])
        requests.put(url,data=dc)

    else:
        dc['con_name']="" if type(conInfo["全称"])!=str and math.isnan(conInfo["全称"]) else conInfo["全称"]
        dc['con_sname'] ="" if type(conInfo["简称"])!=str and math.isnan(conInfo["简称"]) else conInfo["简称"]
        dc['con_classes']=""
        dc['con_home']="" if type(conInfo["官网"])!=str and math.isnan(conInfo["官网"]) else conInfo["官网"]
        dc['con_where']="" if type(conInfo["会议地点"])!=str and math.isnan(conInfo["会议地点"]) else conInfo["会议地点"]
        dc['con_when']="" if type(conInfo["会议日期"])!=str and math.isnan(conInfo["会议日期"]) else conInfo["会议日期"]
        dc['con_paper_deadline']="" if type(conInfo["截稿日期"])!=str and math.isnan(conInfo["截稿日期"]) else conInfo["截稿日期"]
        dc['con_notification']="" if type(conInfo["通知日期"])!=str and math.isnan(conInfo["通知日期"]) else conInfo["通知日期"]
        dc['con_index']="" if type(conInfo["届数"])!=str and math.isnan(conInfo["届数"]) else conInfo["届数"]
        dc['con_cfp']="" if type(conInfo["CFP"])!=str and math.isnan(conInfo["CFP"]) else conInfo["CFP"]
        dc['con_delay']="" if type(conInfo["延期"])!=str and math.isnan(conInfo["延期"]) else conInfo["延期"]
        dc['con_rank1']="" if type(conInfo["CCF"])!=str and math.isnan(conInfo["CCF"]) else conInfo["CCF"]
        dc['con_rank2']="" if type(conInfo["CORE"])!=str and math.isnan(conInfo["CORE"]) else conInfo["CORE"]
        dc['con_rank3']="" if type(conInfo["QUALIS"])!=str and math.isnan(conInfo["QUALIS"]) else conInfo["QUALIS"]
        dc['con_rank4']=""
        dc['con_rank5']=""
        dc['created']=datetime.now()
        dc['con_serach_num']=0
        dc['con_hot']=0

        url = "http://127.0.0.1:8000/dr_server/conferences"

        rep = requests.post(url,data=dc)
        if rep.status_code==400:
            print("添加失败")
            print(conInfo)
        elif rep.status_code==201:
            print("添加成功")


    



if __name__ == "__main__":
    file_path = r"F:\sixpence\Dr_spider\conferences_full.csv"
    df = pd.read_csv(file_path)
    for dc in df.iloc:
        updating(dc)
    print("完成")





