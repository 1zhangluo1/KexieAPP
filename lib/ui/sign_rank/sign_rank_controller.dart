import 'package:dio/dio.dart' as dios;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kexie_app/models/topFiveUsers/topFiveUsers.dart';
import '../../Internet/network.dart';
import '../../widgets/toast.dart';

class SignRankController extends GetxController {
  List<String> tabs = ['新人','老人'];
  PageController pageController = PageController();
  RxInt pageId = 0.obs;
  RxList<Data> topFiveUsers = <Data>[].obs;
  var usersCount = 0.obs;
  var week = 0.obs;

  getTopFive() async {
    dios.Dio dio = AppNetwork.get().kexieDio;
    try {
      dios.Response response =
      await dio.get('/api/record/topFive');
      if (response.data['code'] == 0) {
        TopFiveUsers topFiveUsers = TopFiveUsers.fromJson(response.data);
        if (topFiveUsers.data.isNotEmpty) {
        this.topFiveUsers.addAll(topFiveUsers.data);
        usersCount.value = topFiveUsers.data.length;
        week.value = topFiveUsers.data.first.week;
        }
      } else {
        toastFailure(message: '获取排行榜失败', error: response.data['msg']);
      }
    } on Exception catch (e) {
      toastFailure(message: '获取排行榜失败', error: e.toString());
    }
  }

}