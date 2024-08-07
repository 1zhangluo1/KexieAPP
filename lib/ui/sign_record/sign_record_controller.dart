import 'package:dio/dio.dart' as dios;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../Internet/network.dart';
import '../../global/global.dart';
import '../../models/signRecords/signRecords.dart';
import '../../widgets/toast.dart';

class SignRecordController extends GetxController {
  RxList<String> terms = <String>[].obs;
  RxList<Data> records = <Data>[].obs;
  RxString selectedTerm = ''.obs;
  final ScrollController scrollController = ScrollController();

  getTerms() async {
    dios.Dio dio = AppNetwork.get().kexieDio;
    try {
      dios.Response response =
          await dio.get('/api/record/term/${Global.user.value.studentId}');
      if (response.data['code'] == 0) {
        terms.value = List<String>.from(response.data['data']);
        selectedTerm.value = terms.first;
      } else {
        toastFailure(message: '获取学期失败', error: response.data['msg']);
      }
    } on Exception catch (e) {
      toastFailure(message: '获取学期失败', error: e.toString());
    }
  }

  getRecords({String? term}) async {
    dios.Dio dio = AppNetwork.get().kexieDio;
    try {
      dios.Response response = await dio
          .get('/api/record/${Global.user.value.studentId}/${term ?? ''}');
      if (response.data['code'] == 0) {
        SignRecords signRecords = SignRecords.fromJson(response.data);
        records.clear();
        records.addAll(signRecords.data);
        filterRecords();
      } else {
        toastFailure(message: '获取记录失败', error: response.data['msg']);
      }
    } on Exception catch (e) {
      toastFailure(message: '获取记录失败', error: e.toString());
    }
  }

  Future<void> initRecordData() async {
    await getTerms();
    await getRecords();
  }

  void filterRecords() {
    records.removeWhere((record) {
      return record.status == '已签退' &&
          calculateTotalTime(record.start, record.end,record.status) < 0.05;
    });
  }

  void toTop() {
    scrollController.animateTo(0, duration: const Duration(milliseconds: 300), curve: Curves.easeOut);
  }

  double calculateTotalTime(String start, String end,String status) {
    if (status == '被迫下线') {
      return 100;
    }
    DateTime startTime = DateTime.parse(start);
    DateTime endTime = DateTime.parse(end);
    Duration duration = endTime.difference(startTime);
    double totalTime = duration.inMinutes / 60;
    return double.parse(totalTime.toStringAsFixed(2));
  }
}
