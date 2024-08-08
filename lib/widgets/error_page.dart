import 'package:flutter/material.dart';

class ErrorPage {
  static const Widget loadDataFailed = Center(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.error,
          color: Colors.red,
          size: 80,
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          '数据加载失败',
          style: TextStyle(fontSize: 20),
        ),
      ],
    ),
  );
}