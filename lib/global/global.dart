import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:kexie_app/models/user_infor/user_infor.dart';
import 'package:kexie_app/service/user.dart';
import 'package:shared_preferences/shared_preferences.dart';


class Global {
  static SystemUiOverlayStyle initSystemUiStyle = const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
      systemNavigationBarColor: Colors.transparent);
  static RxBool isLogin = false.obs;
  static Rx<UserInfor> user = UserInfor(iD: -1, createdAt: '', updatedAt: '', name: '', avatar: '', email: '', studentId: '', department: '', learnDirection: '', location: '', grade: '', permission: 10).obs;

  static Future<void> initUser() async {
    final pref = await SharedPreferences.getInstance();
    String token = pref.getString('token') ?? '';
    isLogin.value = token.isEmpty ? false : true;
    if (isLogin.value) {
      print('开始初始化');
      AppService().initUserInfor();
    }
  }

}