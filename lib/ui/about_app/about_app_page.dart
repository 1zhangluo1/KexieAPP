import 'package:flutter/material.dart';

class AboutAppPage extends StatefulWidget {
  const AboutAppPage({super.key});

  @override
  State<AboutAppPage> createState() => _AboutAppPageState();
}

class _AboutAppPageState extends State<AboutAppPage> {
  @override
  Widget build(BuildContext context) {

    final titleStyle = TextStyle(
      fontSize: 28,
      fontWeight: FontWeight.bold,
      decoration: TextDecoration.underline,
      decorationThickness: 5,
      decorationColor: Theme.of(context).colorScheme.primary.withOpacity(0.4),
      decorationStyle: TextDecorationStyle.solid
    );

    final textStyle = TextStyle(
        fontSize: 18,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('关于应用'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text('应用简介',style: titleStyle,),
                  SizedBox(
                    height: 15,
                  ),
                  Card(
                    surfaceTintColor: Theme.of(context).colorScheme.primary,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text('这是属于桂林电子科技大学计算机与信息安全学院（三院）大学生科技协会的App。\n此应用的主要功能有:\n 1.打卡签到，查看自己的签到记录，查看每周的打卡排行。\n 2.浏览科协的论坛，了解科协成员的动态。\n 3.图书借阅。\n 4.科协招新报名表的填写提交。\n 5.各种便捷工具入口',style: textStyle,),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
