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
        const TextSpan(
            text: '此功能登录后方可使用，', style: TextStyle(fontSize: 20)),
        TextSpan(
            text: '请先登录',
            style: const TextStyle(
                fontSize: 20,
                color: Colors.blue,
                decoration: TextDecoration.underline,
                decorationColor: Colors.blue),
            recognizer: TapGestureRecognizer()
              ..onTap = () => Get.toNamed(AppRoute.loginPage)),
      ])),
    );
  }
}
