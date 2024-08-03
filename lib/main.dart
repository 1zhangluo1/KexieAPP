import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:kexie_app/Internet/network.dart';
import 'package:kexie_app/global/global.dart';
import 'package:kexie_app/routes/route.dart';
import 'package:kexie_app/widgets/main_struct/main_struct_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    () async {
    await AppNetwork.initNetwork();
    await Global.initUser();
    } (),
  ]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(Global.initSystemUiStyle);
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);
    return GetMaterialApp(
      builder: FToastBuilder(),
      title: 'KeXieApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      debugShowCheckedModeBanner: false,
      home: const Scaffold(
        body: MainStruct(),
      ),
      navigatorKey: AppRoute.navigatorKey,
      getPages: AppRoute.routes,
    );
  }
}
