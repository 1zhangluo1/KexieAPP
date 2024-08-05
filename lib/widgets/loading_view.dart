import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({super.key,required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical:  30),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SpinKitWave(
              color: Theme.of(context).colorScheme.primary,
              size: 50,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(text,style: TextStyle(fontSize: 16),),
          ],
        ),
      ),
    );
  }

  static void show(BuildContext context, {required String text}) {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return LoadingView(text: text);
      },
    );
  }

  static void hide(BuildContext context) {
    Navigator.of(context, rootNavigator: true).pop();
  }

}
