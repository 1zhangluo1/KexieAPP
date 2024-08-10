import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kexie_app/ui/HomePage/homepage_controller.dart';
import 'package:kexie_app/widgets/toast.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {
  @override
  Widget build(BuildContext context) {
    final c = Get.put(HomepageController());
    return Scaffold(
      body: WillPopScope(
        onWillPop: () async {
          final now = DateTime.now();
          const maxDuration = Duration(seconds: 2);
          var isFinish = await c.webViewController.canGoBack().then((value) {
            if (value) {
              c.webViewController.goBack();
            } else {
              if (c.lastPressed == null ||
                  now.difference(c.lastPressed!) > maxDuration) {
                c.lastPressed = now;
                toast('再按一次返回键退出应用');
                return false;
              } else {
                return true;
              }
            }
          });
          return isFinish!;
        },
        child: Stack(children: [
          RefreshIndicator(
            onRefresh: () async {
              c.isLoading.value = true;
              c.isError.value = false;
              c.webViewController.reload();
            },
            child: Column(
              children: [
                Expanded(
                  child: SafeArea(
                    child: WebViewWidget(
                      controller: c.webViewController,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
