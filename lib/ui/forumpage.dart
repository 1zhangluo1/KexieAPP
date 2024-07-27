import 'package:flutter/material.dart';

class Forum extends StatefulWidget{
  const Forum({super.key});

  @override
  State<Forum> createState() => _ForumState();
}

class _ForumState extends State<Forum> {
  @override
  Widget build(BuildContext context){
    return Center(child: Text('论坛',textScaleFactor: 3,),);
  }
}