import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  var themeModeText = '夜间模式'.obs;
  var themeModeSvg = 'svgs/dark_mode.svg'.obs;

  void changeThemeMode() {
    Get.changeTheme(Get.isDarkMode
        ? ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
            primaryColor: Colors.white,
            useMaterial3: true,
          )
        : ThemeData.dark());
    themeModeText.value = Get.isDarkMode ? '夜间模式' : '日间模式';
    themeModeSvg.value = Get.isDarkMode ? 'svgs/dark_mode.svg' : 'svgs/day_mode.svg';
  }

  // void changeThemeColor() {
  //   Get.changeTheme(ThemeData(colorSchemeSeed: Colors.));
  // }

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
              onPressed: () {},
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
