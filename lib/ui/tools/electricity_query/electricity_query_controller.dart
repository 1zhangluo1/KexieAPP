import 'package:dio/dio.dart' as dios;
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:kexie_app/widgets/toast.dart';
import 'package:xml/xml.dart';

List<ElectricityData> parseXmlData(String xml) {
  List<ElectricityData> electricityDatas = [];
  final document = XmlDocument.parse(xml);
  final datasets = document.findAllElements('ds');
  datasets.forEach((dataSet) {
    final date = dataSet.findElements('rdate').single.innerText;
    final electricity = dataSet.findElements('remain').single.innerText;
    final electricityData = ElectricityData(date: date, electricity: electricity);
    electricityDatas.add(electricityData);
  });
  return electricityDatas;
}

class ElectricityQueryController extends GetxController {

  final inputController = TextEditingController();
  final focus = FocusNode();
  final isQuery = false.obs;
  final querying = false.obs;
  RxList<ElectricityData> electricityData = <ElectricityData>[].obs;

  Future<void> getElectricityData(String room) async {
    final queryParam = {
      'roomno': room,
      'n': 10,
    };
    try {
      final dio = dios.Dio(dios.BaseOptions(baseUrl: 'http://sdcx.guet.edu.cn',));
      querying.value = true;
      isQuery.value = true;
      final response = await dio.get('/yktserver/ecardserv/ykt.asmx/GetYDLSByRoomno',queryParameters: queryParam);
      if (response.statusCode == 200) {
        isQuery.value = true;
        electricityData.value = parseXmlData(response.data);
      } else {
        toastFailure(message: '查询失败');
      }
    } on Exception catch (e) {
      toastFailure(message: '查询失败',error: e.toString());
    } finally {
      querying.value = false;
    }
  }

}

class ElectricityData{

  ElectricityData({required this.date, required this.electricity});

  final String date;
  final String electricity;

  @override
  String toString() {
    return 'date: $date, electricity: $electricity';
  }

}