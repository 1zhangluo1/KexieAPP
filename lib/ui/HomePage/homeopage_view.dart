import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kexie_app/ui/HomePage/homepage_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class HomePages extends StatefulWidget {
  const HomePages({super.key});

  @override
  State<HomePages> createState() => _HomePagesState();
}

class _HomePagesState extends State<HomePages> {

  DateTime? lastPressed;

  @override
  Widget build(BuildContext context) {
    final c = Get.put(HomepageController());
    return Scaffold(
      appBar: AppBar(
        title: Text('三院科协简介',style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 28,
          color: Theme.of(context).colorScheme.onSurface
        ),),
      ),
      body: WillPopScope(
        onWillPop: () async {
          final now = DateTime.now();
          const maxDuration = Duration(seconds: 2);
          var isFinish = await c.webViewController.canGoBack().then((value) {
            if (value) {
              c.webViewController.goBack();
            } else {
              if (lastPressed == null ||
                  now.difference(lastPressed!) > maxDuration) {
                lastPressed = now;
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('再按一次返回键退出应用'),
                    duration: Duration(seconds: 1),
                  ),
                );
                return false;
              } else {
                return true;
              }
            }
          });
          return isFinish!;
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
    );
  }
}
