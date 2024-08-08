import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kexie_app/routes/route.dart';

class HintDialog extends StatelessWidget {
  const HintDialog({super.key,required this.content});

  final String content;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.zero
      ),
      child: Container(
        height: 200,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              color: Colors.red,
              height: 60,
              width: double.infinity,
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Align( alignment: Alignment.topLeft,child: Text('提示',style: TextStyle(color: Colors.white,fontSize: 25),)),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Text(content,style: TextStyle(fontSize: 16),),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(onPressed: () => {hideHintDialog(context)}, child: Text('取消')),
                  const SizedBox(width: 20,),
                  TextButton(onPressed: () {hideHintDialog(context);Get.toNamed(AppRoute.loginPage);}, child: Text('确定')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  static void showHintDialog(BuildContext context, {required String content}) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return HintDialog(content: content);
      },
    );
  }

  static void hideHintDialog(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }

}
