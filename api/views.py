#coding=utf-8
# from django.shortcuts import render
# from django.http import HttpResponse, JsonResponse
from api import models
import json
# import subprocess
import requests
import ast
# from rest_framework.decorators import api_view
# from django.core import serializers
from django.views.decorators.http import require_http_methods
from django.core.paginator import Paginator
from django.db.models import Q
from django.core import serializers
from rest_framework_simplejwt import authentication
from django.http import JsonResponse
from django.views.decorators.csrf import csrf_exempt
# from  django_redis import get_redis_connection
import os
from bs4 import BeautifulSoup
# import time
# from python_jenkins_monitor.python_jenkins_monitor import get_next_time
from django.contrib import auth
from apscheduler.schedulers.background import BackgroundScheduler
# from apscheduler.schedulers.blocking import BlockingScheduler

path_list=os.getcwd().split("\\")
reportDir="\\".join(path_list[:path_list.index('interface')+1])+"\\report"

@csrf_exempt
def get_user_info(request):
    if request.method == 'GET':
        token = request.headers.get('Authentication')

        token_msg = authentication.JWTAuthentication().get_validated_token(token)
        user_object = authentication.JWTAuthentication().get_user(token_msg)

        data = {
            "username": user_object.username,
            "avatar": "administrator",
            "roles": "admin",
        }
        re_data = {
            "data": data,
            "code": 20000,
            "message": "success"
        }
        return JsonResponse(re_data)

        # user_object = authentication.JWTAuthentication().get_user(token)
        # conn=get_redis_connection('default')
        # cache=conn.get(str(user_object.id))
        # if token==cache:
        #     data = {
        #         "username": user_object.username,
        #         "avatar": "administrator",
        #         "roles": "admin",
        #     }
        #     re_data = {
        #         "data": data,
        #         "code": 20000,
        #         "message": "success"
        #     }
        #     return JsonResponse(re_data)


def log_in(request):
    if request.method == "POST":
        username = request.POST.get("username")
        password = request.POST.get("password")
        user = auth.authenticate(username=username, password=password)
        if user: pass

@csrf_exempt
@require_http_methods(["GET"])
def search(request):
    response = {}
    name = request.GET.get('name')
    if name == None:
        model_list = models.Interface.objects.filter().order_by("id")
    else:
        model_list = models.Interface.objects.filter(Q(name=name)).order_by("id")
    response['list'] = json.loads(serializers.serialize("json", model_list))  # 将querySet对象序列化成json传给前端展示
    page = request.GET.get('page')
    limit = request.GET.get('limit')
    paginator = Paginator(model_list, limit)
    model_list = paginator.page(page)
    data_list = []
    for data in model_list:
        data_dict = {}
        data_dict["id"] = data.id
        data_dict["name"] = data.name
        data_dict["url"] = data.url
        data_dict["method"] = data.method
        data_dict["data"] = data.data
        data_dict["header"] = data.header
        data_dict["response"] = data.response
        data_dict["remark"] = data.remark
        data_dict["status"] = data.status
        data_list.append(data_dict)
    return JsonResponse(
            {
                "data": {
                    "records": data_list,
                    "total": paginator.count,
                },
                "code": "200",
                "msg": "success"
            }
    )


@csrf_exempt  # 后执行
@require_http_methods(["POST"])  # 先执行
def add(request):
    response = {}
    try:
        name = json.loads(request.body).get('name')
        url = json.loads(request.body).get('url')
        method = json.loads(request.body).get('method')
        data = json.loads(request.body).get('data')
        header = json.loads(request.body).get('header')
        remark = json.loads(request.body).get('remark')
        models.Interface.objects.create(name=name, url=url, method=method, data=data, header=header, remark=remark)
        response['code'] = '200'
        response['error_num'] = 0
    except Exception as e:
        response['msg'] = str(e)
        response['error_num'] = 1

    return JsonResponse(response)


# @csrf_exempt
# @require_http_methods(["GET"])
# def update(request):
#     response = {}
#     try :
#         id=request.GET.get('id')
#         name = request.GET.get('name')
#         url = request.GET.get('url')
#         method = request.GET.get('method')
#         data = request.GET.get('data')
#         models.Interface.objects.filter(id=id).update(name=name, url=url, method=method, data=data)
#         response['code'] = '200'
#         response['error_num'] = 0
#     except Exception as e:
#         response['msg'] = str(e)
#         response['error_num'] = 1
#
#     return JsonResponse(response)


@csrf_exempt
@require_http_methods(["POST"])
def update(request):
    response = {}
    try:
        id = json.loads(request.body).get('id')
        name = json.loads(request.body).get('name')
        url = json.loads(request.body).get('url')
        method = json.loads(request.body).get('method')
        data = json.loads(request.body).get('data')
        header = json.loads(request.body).get('header')
        remark = json.loads(request.body).get('remark')
        models.Interface.objects.filter(id=id).update(name=name, url=url, method=method, data=data, header=header,
                                                      remark=remark)
        response['code'] = '200'
        response['error_num'] = 0
    except Exception as e:
        response['msg'] = str(e)
        response['error_num'] = 1

    return JsonResponse(response)


@csrf_exempt
@require_http_methods(["POST"])  # 没有put、delete
def delete(request):
    response = {}
    # id = request.POST.get('id')  # 接收Form data：Content-Type: application/x-www-form-urlencoded
    id = json.loads(request.body).get('id')  # 接收Body data（Request payload）：Content-Type: application/json
    try:
        models.Interface.objects.get(id=int(id)).delete()
        response['code'] = '200'
        response['error_num'] = 0
    except Exception as e:
        response['msg'] = str(e)
        response['error_num'] = 1
        response['id'] = id
    return JsonResponse(response)


def post_request(url, data, header):
    header = ast.literal_eval(header)
    data = ast.literal_eval(data)
    s = requests.session()
    if header["Content-Type"] in "application/x-www-form-urlencoded;charset=UTF-8":
        return s.post(url=url, data=data, headers=header)
    elif header["Content-Type"] in "text/xml":
        pass
    elif header["Content-Type"] in "multipart/form-data":
        pass
    elif header["Content-Type"] in "application/json;charset=utf-8":
        return s.post(url=url, json=data, headers=header)
    else:
        return s.post(url=url, data=data, headers=header)


def get_request(url, data, header):
    header = ast.literal_eval(header)
    data = ast.literal_eval(data)
    s = requests.session()
    return s.get(url=url, params=data, headers=header)


# def put_request(url,data,header):pass
# def delete_request(url,data,header):pass


@csrf_exempt
@require_http_methods(["POST"])
def send(request):
    response = {}
    try:
        id = json.loads(request.body).get('id')
        model = models.Interface.objects.filter(id=id).first()
        url = model.url
        data = model.data
        header = model.header
        method = model.method
        if method == 2:
            r = post_request(url, data, header)
            print(r.text)
            model.response = r.text
            if r.status_code == 200:
                model.status = 1
            else:
                model.status = 2
            model.save()
        # elif method==0:
        #     model.update(response=put_request(url,data,header))
        # elif method==3:
        #     model.update(response=delete_request(url,data,header))
        else:
            r = get_request(url, data, header)
            model.response = r.text
            if r.status_code == 200:
                model.status = 1
            else:
                model.status = 2
            model.save()
        response['code'] = '200'
        response['error_num'] = 0
    except Exception as e:
        response['msg'] = str(e)
        response['error_num'] = 1
    return JsonResponse(response)


def send_alarm(report_url,passing_rate,title="营销活动"):
    url="https://qyapi.weixin.qq.com/cgi-bin/webhook/send?key=a1064355-36cd-4603-9649-e352c42a7e0a"
    # url="https://qyapi.weixin.qq.com/cgi-bin/webhook/send?key=635d56b5-fe25-44b2-ae94-a95e41ec6f1d"
    data={
            "msgtype": "template_card",
            "template_card": {
                "card_type": "text_notice",
                # "source": {
                #     "icon_url": "https://image-c.weimobwmc.com/ol-6LEtw/96ea26d345ef469cb79016ccb678415f.png",
                #     "desc": "Automation",
                #     "desc_color": 0
                # },
                "main_title": {
                    "title": title,
                    "desc": "自动化测试报告"
                },
                "emphasis_content": {
                    "title": str(passing_rate) + '%',
                    "desc": "通过率"
                },
                "horizontal_content_list": [
                    {
                        "keyname": "跑测类型",
                        "value": "回归测试"
                    },
                    {
                        "keyname": "版本类型",
                        "value": "测试版本",
                    },
                ],
                "jump_list": [
                    {
                        "type": 1,
                        "url": report_url,
                        "title": "查看报告详情"
                    },
                ],
                "card_action": {
                    "type": 1,
                    "url": report_url
                }
            }
        }
    s=requests.session()
    s.post(url=url,json=data)

def reptile(report):
    file=open(report,'r', encoding='utf-8').read()
    soup = BeautifulSoup(file,'html.parser')
    total=int(soup.select("body > div > div.card > div > div > div")[14].get_text())
    fail_num=int(soup.select("body > div > div.card > div > div > div")[15].get_text())
    if fail_num=='0':
        passing_rate=100
    else:
        passing_rate=100-int(fail_num/total*100)
    return passing_rate


@csrf_exempt
@require_http_methods(["POST"])
def auto(request):
    response = {}
    try:
        id = json.loads(request.body).get('id')
        model = models.Auto.objects.filter(id=id).first()
        get_order = model.order
        print("---------------------->",type(get_order))
        order=get_order.format("report",reportDir)
        print(order)
        # order="apifox run https://api.apifox.cn/api/v1/api-test/ci-config/356258/detail?token=xoT1Y3V0LE-VuKUa47Hwlv  -r html,cli --out-dir %report --out-file bigwheel"%reportDir
        os.system(order)
        # time.sleep(10)
        if model.count==None:
            count=1
        else:
            count = model.count+1
        models.Auto.objects.filter(id=id).update(count=count)
        report=reportDir+"\\"+model.name+".html"
        send_alarm(report,reptile(report),model.activity_name)
        response['code'] = '200'
        response['error_num'] = 0
    except Exception as e:
        response['msg'] = str(e)
        response['error_num'] = 1
    return JsonResponse(response)

# @csrf_exempt
# @require_http_methods(["POST"])
# def testSuite(request):
#     response = {}
#     try:
#         adjure = json.loads(request.body).get('adjure')#默认id=1每天凌晨两点10执行任务 (秒 分 时 日 月 星期 年)，参数值：* 10 2 * * * *
#         if adjure:
#             models.Autotimer.objects.filter(id=1).update(adjure=adjure)#默认id=1
#         else:
#             order="apifox run https://api.apifox.cn/api/v1/api-test/ci-config/349454/detail?token=x1nbBPMZpVGHWmEeKFg0Sx -r html,cli --out-dir %s --out-file allactivity"%reportDir
#             print(order)
#             os.system(order)
#             report=reportDir+"\\allactivity.html"
#             send_alarm(report,reptile(report))
#         response['code'] = '200'
#         response['error_num'] = 0
#     except Exception as e:
#         response['msg'] = str(e)
#         response['error_num'] = 1
#     return JsonResponse(response)


@csrf_exempt
@require_http_methods(["POST"])
def testSuite(request):
    response = {}
    try:
        order="apifox run https://api.apifox.cn/api/v1/api-test/ci-config/349454/detail?token=x1nbBPMZpVGHWmEeKFg0Sx -r html,cli --out-dir %s --out-file allactivity"%reportDir
        # print(order)
        os.system(order)
        # subprocess.run(order,shell=True,check=True)
        report=reportDir+"\\allactivity.html"
        send_alarm(report,reptile(report))
        response['code'] = '200'
        response['error_num'] = 0
    except Exception as e:
        response['msg'] = str(e)
        response['error_num'] = 1
    return JsonResponse(response)



@csrf_exempt
@require_http_methods(["GET"])
def screen(request):
    response = {}
    activity_name = request.GET.get('activity_name')
    if activity_name == None:
        model_list = models.Auto.objects.filter().order_by("id")
    else:
        model_list = models.Auto.objects.filter(Q(activity_name=activity_name)).order_by("id")
    response['list'] = json.loads(serializers.serialize("json", model_list))  # 将querySet对象序列化成json传给前端展示
    page = request.GET.get('page')
    limit = request.GET.get('limit')
    paginator = Paginator(model_list, limit)
    model_list = paginator.page(page)
    data_list = []
    for data in model_list:
        data_dict = {}
        data_dict["id"] = data.id
        data_dict["activity_name"] = data.activity_name
        data_dict["name"] = data.name
        data_dict["count"] = data.count
        data_dict["order"] = data.order
        data_list.append(data_dict)
    return JsonResponse(
            {
                "data": {
                    "records": data_list,
                    "total": paginator.count,
                },
                "code": "200",
                "msg": "success"
            }
    )




def tester():
    order="apifox run https://api.apifox.cn/api/v1/api-test/ci-config/349454/detail?token=x1nbBPMZpVGHWmEeKFg0Sx -r html,cli --out-dir %s --out-file allactivity"%reportDir
    # print(order)
    os.system(order)
    report=reportDir+"\\allactivity.html"
    send_alarm(report,reptile(report))

scheduler = BackgroundScheduler(timezone='Asia/Shanghai')
#如果用BlockingScheduler，运行时报Watching for file changes with StatReloader
# scheduler = BlockingScheduler(timezone='Asia/Shanghai')
# from django.utils import timezone
# print(timezone.now())

# model = models.Autotimer.objects.filter(id=1).first()
# adjure = model.adjure
#秒 分 时 日 月 星期 年
# rate = adjure.split()
# scheduler.add_job(tester,"cron",second=rate[0], minute=rate[1], hour=rate[2], day=rate[3],month=rate[4], day_of_week=rate[5], year=rate[6])
scheduler.add_job(tester,"cron",hour='16')
# scheduler._logger = logging
scheduler.start()

