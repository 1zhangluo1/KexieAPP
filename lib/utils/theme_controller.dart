import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:kexie_app/gen/assets.gen.dart';
import 'package:kexie_app/utils/get_storage.dart';

class ThemeController extends GetxController{
  late GetStorage themeStorage;
  Rx<ThemeMode> themeMode = ThemeMode.light.obs;
  Rx<Color> primaryColor = Colors.blue.shade400.obs;
  var themeModeText = '夜间模式'.obs;
  var themeModeSvg = Assets.svgs.darkMode.obs;

  Future initTheme() async {
    themeStorage = (await SettingsRepository.get()).settingsStorage;
    themeMode.value = mapThemeMode(themeStorage.read('themeMode') ?? 'light');
    primaryColor.value = Color(themeStorage.read('primaryColor') ?? Colors.blue.shade400.value);
    changeThemeMode(themeMode: themeMode.value);
    changeThemeColor(primaryColor.value);
    Get.forceAppUpdate();
  }
  
  getThemeSettingTitle() {
    themeModeText.value = themeMode.value == ThemeMode.dark ? '日间模式' : '夜间模式';
    themeModeSvg.value = themeMode.value == ThemeMode.dark ? Assets.svgs.dayMode : Assets.svgs.darkMode;
  }

  void changeThemeMode({ThemeMode? themeMode}) {
    if (themeMode == null) {
      Get.changeThemeMode(this.themeMode.value == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark);
      this.themeMode.value = this.themeMode.value == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    } else {
      Get.changeThemeMode(themeMode);
      this.themeMode.value = themeMode;
    }
    Get.changeTheme(getThemeData());
    getThemeSettingTitle();
    saveThemeMode(this.themeMode.value);
    Get.forceAppUpdate();
  }

  void changeThemeColor(Color color) {
    primaryColor.value = color;
    Get.changeTheme(getThemeData());
    savePrimaryColor(primaryColor.value);
    Get.forceAppUpdate();
  }

  void saveThemeMode(ThemeMode themeMode) {
    themeStorage.write('themeMode', themeMode.toString().split('.').last);
  }

  void savePrimaryColor(Color color) {
    themeStorage.write('primaryColor', color.value);
  }

  ThemeData getThemeData() {
    Brightness brightness = themeMode.value == ThemeMode.dark ? Brightness.dark : Brightness.light;
    return ThemeData.from(
      colorScheme: ColorScheme.fromSeed(
        seedColor: brightness == Brightness.dark
            ? primaryColor.value
            : primaryColor.value,
        brightness: brightness,
        primary: brightness == Brightness.light
            ? primaryColor.value
            : primaryColor.value,
      ),
      useMaterial3: true,
    );
  }

  ThemeMode mapThemeMode(String mode) {
    switch (mode) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      default:
        return ThemeMode.light;
    }
  }

  @override
  Future<void> onInit() async {
    super.onInit();
    await initTheme();
  }
  
}