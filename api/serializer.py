from rest_framework_simplejwt.serializers import TokenObtainPairSerializer
from rest_framework_simplejwt.views import TokenObtainPairView
# from  django_redis import get_redis_connection
# from rest_framework_simplejwt import authentication

class RewriteTokenObtainPairSerializer(TokenObtainPairSerializer):
    #自定义refresh
    @classmethod
    def get_token(cls, user):
        refresh = super().get_token(user)
        refresh['username'] = user.username
        refresh['code'] = 20000
        # conn=get_redis_connection('default')
        # conn.set(str(user.id),str(refresh.access_token),ex=60*3*1)
        return refresh
    #自定义返回体
    def validate(self, attrs):
        data = super().validate(attrs)

        # user_object = authentication.JWTAuthentication().get_user(data['access'])
        # conn=get_redis_connection('default')
        # conn.set(str(user_object.id),str(data["access"]),ex=60*3*1)

        re_data = {}
        re_data['data'] = data
        re_data['code'] = 20000
        re_data['message'] = 'success'
        return re_data


class RewriteTokenObtainPairView(TokenObtainPairView):
    serializer_class = RewriteTokenObtainPairSerializer