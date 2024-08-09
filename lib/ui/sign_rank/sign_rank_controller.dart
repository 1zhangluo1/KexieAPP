import 'dart:async';
import 'dart:math';

import 'package:dio/dio.dart' as dios;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kexie_app/models/topFiveUsers/topFiveUsers.dart';
import '../../Internet/network.dart';
import '../../widgets/toast.dart';

class SignRankController extends GetxController {
  List<String> tabs = ['新人','老人'];
  List<Color> colorOptions = [
    Colors.green,
    Colors.deepOrange,
    Colors.deepPurpleAccent,
    Colors.red,
    Colors.lightBlue,
  ];
  PageController pageController = PageController();
  RxList<Data> topFiveUsers = <Data>[].obs;
  var usersCount = 0.obs;
  RxList<Data> oldTopFiveUsers = <Data>[].obs;
  var oldUsersCount = 0.obs;
  var week = 0.obs;

  getNewTopFive() async {
    dios.Dio dio = AppNetwork.get().kexieDio;
    try {
      dios.Response response =
      await dio.get('/api/record/topFive');
      if (response.data['code'] == 0) {
        TopFiveUsers topFiveUsers = TopFiveUsers.fromJson(response.data);
        if (topFiveUsers.data.isNotEmpty) {
          this.topFiveUsers.clear();
          this.topFiveUsers.addAll(topFiveUsers.data);
          usersCount.value = topFiveUsers.data.length;
          week.value = topFiveUsers.data.first.week;
          this.topFiveUsers.sort( (a,b) => b.totalTime.compareTo(a.totalTime)); //降序排序
          for (int i = 0; i < this.topFiveUsers.length; i++) {
            this.topFiveUsers[i].order = i + 1;
          } //将排序序号赋予对应的顺序属性
        }
      } else {
        toastFailure(message: '获取排行榜失败', error: response.data['msg']);
      }
    } on Exception catch (e) {
      toastFailure(message: '获取排行榜失败', error: e.toString());
    }
  }

  getOldTopFive() async {
    dios.Dio dio = AppNetwork.get().kexieDio;
    try {
      dios.Response response =
      await dio.get('/api/record/topFive?old-man=true');
      if (response.data['code'] == 0) {
        TopFiveUsers topFiveUsers = TopFiveUsers.fromJson(response.data);
        if (topFiveUsers.data.isNotEmpty) {
          usersCount.value = topFiveUsers.data.length; //得到现有前五的数据数量
          this.topFiveUsers.clear(); //刷新列表避免重复堆积
          this.topFiveUsers.addAll(topFiveUsers.data);
          week.value = topFiveUsers.data.first.week;
          this.topFiveUsers.sort( (a,b) => b.totalTime.compareTo(a.totalTime)); //降序排序
          for (int i = 0; i < this.topFiveUsers.length; i++) {
            this.topFiveUsers[i].order = i + 1;
          }
        } else {

        }
      } else {
        toastFailure(message: '获取排行榜失败', error: response.data['msg']);
      }
    } on Exception catch (e) {
      toastFailure(message: '获取排行榜失败', error: e.toString());
    }
  }

  double findMax(double number) {
    if (number < 10) {
      return (number.ceil() == 10) ? number : number.ceilToDouble();
    } else {
      return (number % 10 == 0) ? number : ((number ~/ 10 + 1) * 10).toDouble();
    }
  }

}