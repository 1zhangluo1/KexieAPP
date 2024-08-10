import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:kexie_app/Internet/network.dart';
import 'package:kexie_app/global/global.dart';
import 'package:kexie_app/routes/route.dart';
import 'package:kexie_app/utils/get_storage.dart';
import 'package:kexie_app/utils/theme_controller.dart';
import 'package:kexie_app/widgets/main_struct/main_struct_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    () async {
      await AppNetwork.initNetwork();
      await Global.initUser();
    }(),
  ]);
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final c = Get.put(ThemeController());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(Global.initSystemUiStyle);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    return GetMaterialApp(
      builder: FToastBuilder(),
      title: 'KeXieApp',
      theme: c.getThemeData(),
      darkTheme: c.getThemeData(),
      themeMode: c.themeMode.value,
      debugShowCheckedModeBanner: false,
      navigatorKey: AppRoute.navigatorKey,
      getPages: AppRoute.routes,
    );
  }
}
