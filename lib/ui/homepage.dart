import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0, // Hides the AppBar
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.blue[50],
            child: const Row(
              children: [
                CircleAvatar(
                  radius: 30,
                  child: Icon(Icons.person, size: 40),
                ),
                SizedBox(width: 10),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '鱼儿鱼儿鱼儿鱼儿鱼儿',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '快来红岩网校和我一起玩吧~',
                      style: TextStyle(fontSize: 14),
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                const ListTile(
                  leading: Icon(Icons.message, color: Colors.blue),
                  title: Text('消息中心'),
                ),
                const ListTile(
                  leading: Icon(Icons.mail, color: Colors.blue),
                  title: Text('邮票中心'),
                ),
                const ListTile(
                  leading: Icon(Icons.feedback, color: Colors.blue),
                  title: Text('反馈中心'),
                ),
                const ListTile(
                  leading: Icon(Icons.event, color: Colors.blue),
                  title: Text('活动中心'),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('已连续签到 0 天'),
                      ElevatedButton(
                        onPressed: () {},
                        child: const Text('签到'),
                      ),
                    ],
                  ),
                ),
                const ListTile(
                  title: Text('关于我们'),
                ),
                const ListTile(
                  title: Text('设置'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
