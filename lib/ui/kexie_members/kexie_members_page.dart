import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kexie_app/ui/kexie_members/kexie_members_controller.dart';

class KexieMembersPage extends StatelessWidget {
  const KexieMembersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(KexieMembersController());
    return Scaffold(
      appBar: AppBar(
        title: Text('科协成员'),
      ),
      body: Column(

      ),
    );
  }
}
