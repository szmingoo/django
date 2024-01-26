"""interface URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, re_path
from api import views,serializer
from rest_framework_simplejwt.views import TokenObtainPairView, TokenRefreshView
# from drf_spectacular.views import SpectacularAPIView,SpectacularSwaggerView, SpectacularRedocView


urlpatterns = [
    re_path('search/', views.search),
    re_path('add/', views.add),
    re_path('delete/', views.delete),
    re_path('update/', views.update),
    re_path('send/', views.send),
    re_path('auto/', views.auto),
    re_path('testsuite/', views.testSuite),
    re_path('screen/', views.screen),
    re_path('user/login/', serializer.RewriteTokenObtainPairView.as_view()),
    path('user/info/', views.get_user_info),
    path('token/refresh/', TokenRefreshView.as_view()),
    # path('schema/', SpectacularAPIView.as_view(), name='schema'),
    # path('schema/swagger-ui/', SpectacularSwaggerView.as_view(url_name='schema'), name='swagger-ui'),  # swagger接口文档
    # path('schema/redoc/', SpectacularRedocView.as_view(url_name='schema'), name='redoc'),  # redoc接口文档
]
