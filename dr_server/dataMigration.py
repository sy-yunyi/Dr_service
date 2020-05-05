import pymysql
import pdb
import pandas as pd
from datetime import datetime
import math


db = pymysql.connect(host="127.0.0.1", 
                     user="root", 
                     password="", 
                     port=3306,# 端口  
                     database="dr_info", 
                     charset='utf8')
cursor = db.cursor()
def Con2CCF():
    # sql = "select * from dr_server_ccfinfo where category='会议'"
    sql_con = "select * from dr_server_conferenceinfo where con_rank1 in ('A','B','C')"
    try:
        # 执行SQL语句
        # cursor.execute(sql)
        # # 获取所有记录列表
        # results = cursor.fetchall()
        cursor.execute(sql_con)
        con_re  = cursor.fetchall()
        for row in con_re:
            # sql_up = "update dr_server_ccfinfo set notification='{}',paper_deadline='{}',dr_server_ccfinfo.when='{}',dr_server_ccfinfo.where='{}',created='{}',con_home='{}',con_delay='{}',ccf_index='{}' where short_name='{}' and category='会议'".format(
            #     row[7],row[6],row[5],row[4],datetime.now(),row[-2],row[-1],row[8],row[2]
            # )
            sql_up2 = "update dr_server_ccfinfo set notification='{}',paper_deadline='{}',dr_server_ccfinfo.when='{}',dr_server_ccfinfo.where='{}',created='{}',con_home='{}',con_delay='{}',ccf_index='{}' where (short_name='{}' or full_name='{}') and category='会议' ".format(
                row[7],row[6],row[5],row[4],datetime.now(),row[-2],row[-1],row[8],row[2],row[1]
            )
            # sql_up = "update dr_server_ccfinfo set notification='{}',paper_deadline='{}',dr_server_ccfinfo.when='{}',dr_server_ccfinfo.where='{}',created='{}',con_home='{}',con_delay='{}',ccf_index='{}' where short_name='{}'".format(
            #     " "," "," "," ",datetime.now()," "," "," ",row[2]
            # )
            try:
                cursor.execute(sql_up2)
                db.commit()
                print(sql_up2)
            except Exception as e:
                db.rollback()
                print(e)    
    except:
        print("Error: unable to fecth data")


def ConferenceInfo():
    con = pd.read_csv(r"F:\sixpence\数据\conferencs_hui.csv")

    for cinfo in con.iloc:
        try:
            con_name = cinfo["name"].replace("\n", "")
            con_sname = cinfo["short_name"]
            con_classes = " " 

            con_home = cinfo["office"]   # 官网
            con_where = cinfo["where"]
            con_when = cinfo["Dates"]
            con_paper_deadline = cinfo["deadline"]
            con_notification =  cinfo["Notification"] if type(cinfo["Notification"])==str else " "
            con_index = " " if math.isnan(cinfo["number"]) else int(cinfo["number"]) #届数
            con_cfp =" "
            con_delay = cinfo["yanqi"] if type(cinfo["yanqi"])==str else " "

            con_rank1 = str.upper(cinfo["CCF"]) if type(cinfo["CCF"])==str else " "  #CCF
            con_rank2 = " "
            con_rank3 = " "
            con_rank4 = " "
            con_rank5 = " "

            created = datetime.now()
            con_serach_num = 0
            con_hot = 0
            sql_in = """INSERT INTO dr_server_conferenceinfo(con_name,con_sname,con_classes,con_home,con_where,con_when,\
                        con_paper_deadline,con_notification,con_index,con_cfp,con_delay,con_rank1,con_rank2,con_rank3,con_rank4,\
                        con_rank5,created,con_serach_num,con_hot) values("{0}","{1}","{2}","{3}","{4}","{5}","{6}","{7}","{8}","{9}","{10}","{11}","{12}","{13}","{14}","{15}","{16}","{17}","{18}")
            """.format(con_name,con_sname,con_classes,con_home,con_where,con_when,
                        con_paper_deadline,con_notification,con_index,con_cfp,con_delay,con_rank1,con_rank2,con_rank3,con_rank4,
                        con_rank5,created,con_serach_num,con_hot)
            
            cursor.execute(sql_in)
            db.commit()
            print("提交 ：{}".format(con_name))
        except Exception as e:
            db.rollback()
            print(e)
            pdb.set_trace()




if __name__ == '__main__':
    # ConferenceInfo()
    Con2CCF()