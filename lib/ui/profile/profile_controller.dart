import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kexie_app/service/user.dart';

import '../sign_system/sign_controller.dart';

class ProfileController extends GetxController {

  SignController signController = Get.find();

  void showExitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            '退出登录',
            style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
          ),
          content: Text(
            '您确定要退出登录吗？',
            style: TextStyle(
                color: Theme.of(context).colorScheme.onSurface, fontSize: 16),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                '取消',
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onSurface),
              ),
            ),
            TextButton(
              onPressed: () {
                AppService().exitLogin();
                signController.isSign.value = false;
                Navigator.of(context).pop();
              },
              child: Text(
                '确定',
                style:
                    TextStyle(color: Theme.of(context).colorScheme.onSurface),
              ),
            ),
          ],
        );
      },
    );
  }
}
