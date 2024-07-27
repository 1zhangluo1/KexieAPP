import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  void showExitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('退出登录',style: TextStyle(color: Theme.of(context).colorScheme.onSurface),),
          content: Text('您确定要退出登录吗？',style: TextStyle(color: Theme.of(context).colorScheme.onSurface,fontSize: 16),),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('取消',style: TextStyle(color: Theme.of(context).colorScheme.onSurface),),
            ),
            TextButton(
              onPressed: () {
                print('退出登录');
              },
              child: Text('确定',style: TextStyle(color: Theme.of(context).colorScheme.onSurface),),
            ),
          ],
        );
      },
    );
  }
}
