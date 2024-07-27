import 'package:flutter/material.dart';

class SignRecordPage extends StatefulWidget {
  const SignRecordPage({super.key});

  @override
  State<SignRecordPage> createState() => _SignRecordPageState();
}

class _SignRecordPageState extends State<SignRecordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('打卡记录统计',style: TextStyle(
          color: Theme.of(context).colorScheme.onSurface
        ),),
      ),
    );
  }
}
