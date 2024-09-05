import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/route.dart';

class LoginFailPage extends StatelessWidget {
  const LoginFailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text.rich(TextSpan(children: [
      TextSpan(text: '您还未登录，此功能需要登录后才能使用\n点击此处进行',style: TextStyle(fontSize: 16)),
      TextSpan(
          text: '登录',
          style: TextStyle(
              color: Colors.blue,
              fontSize: 16,
              decoration: TextDecoration.underline,
              decorationColor: Colors.blue),
          recognizer: TapGestureRecognizer()
            ..onTap = () => Get.toNamed(AppRoute.loginPage)),
    ])));
  }
}
