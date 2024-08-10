import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomepageController extends GetxController{
  late WebViewController webViewController;
  DateTime? lastPressed;
  RxBool isLoading = true.obs;
  RxBool isError = false.obs;

  void setNoticeBar() {

  }

  @override
  void onInit() {
    super.onInit();
    webViewController = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.https('hello.kexie.space'));
  }

}