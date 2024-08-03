import 'package:flutter/material.dart';

class SignRankPage extends StatefulWidget {
  const SignRankPage({super.key});

  @override
  State<SignRankPage> createState() => _SignRankPageState();
}

class _SignRankPageState extends State<SignRankPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('签到排名',style: TextStyle(color: Theme.of(context).colorScheme.onSurface),),
      ),
    );
  }
}
