import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kexie_app/ui/sign_system/sign_controller.dart';

class SignPage extends StatefulWidget {
  const SignPage({super.key});

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  @override
  Widget build(BuildContext context) {
    final c = Get.put(SignController());
    return Scaffold(
      appBar: AppBar(
        title: Text('签到'),
      ),
      body: Column(
        children: [
        ],
      ),
    );
  }
}
