import 'package:flutter/material.dart';

class ClassSchedule extends StatefulWidget{
  const ClassSchedule({super.key});

  @override
  State<ClassSchedule> createState() => _ClassScheduleState();
}

class _ClassScheduleState extends State<ClassSchedule> {
  @override
  Widget build(BuildContext context){
    return Center(child: Text('课程表',textScaleFactor: 3,));
  }
}