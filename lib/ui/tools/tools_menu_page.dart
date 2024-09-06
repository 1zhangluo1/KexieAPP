import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../routes/route.dart';

class ToolsMenuPage extends StatefulWidget {
  const ToolsMenuPage({super.key});

  @override
  State<ToolsMenuPage> createState() => _ToolsMenuPageState();
}

class _ToolsMenuPageState extends State<ToolsMenuPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('便捷工具'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                physics: AlwaysScrollableScrollPhysics(),
                children: [
                  ListTile(
                    onTap: () => Get.toNamed(AppRoute.electricityQuery),
                    title: Text(
                      '电费查询',
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.onSurface,
                        fontSize: 18,
                      ),
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios,
                      size: 20,
                    ),
                    leading: const Icon(
                      Icons.electric_bolt_outlined,
                      size: 26,
                      color: Colors.yellow,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
