import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class MainStructController extends GetxController {
  void toKexieWeb() {
    launchUrl(Uri.https('hello.kexie.space'));
  }
  void tokexieNetdisk() {
    launchUrl(Uri.parse('https://pan.kexie.space/s/ZQLNbqMGEn3XKeH'));
  }

}