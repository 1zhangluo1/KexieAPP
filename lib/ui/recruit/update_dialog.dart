import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kexie_app/ui/recruit/recruit_controller.dart';

import '../../widgets/loading_view.dart';

class UpdateDialog extends StatefulWidget {
  UpdateDialog({super.key});

  @override
  State<UpdateDialog> createState() => _UpdateDialogState();
}

class _UpdateDialogState extends State<UpdateDialog> {
  var isLoading = false.obs;

  @override
  Widget build(BuildContext context) {
    RecruitController c = Get.find();
    return Obx(
        () => isLoading.value ? LoadingView(text: '更新报名表数据中，请稍候...') :  Dialog(
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              const Text(
                '重复提交',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                '您是否需要更新报名表数据？',
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Container(
                height: 1,
                width: double.infinity,
                color: Colors.grey,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Expanded(
                    child: TextButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        '取消',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextButton(
                      onPressed: () async {
                        isLoading.value = true;
                        bool result = await c.updateInfo();
                        if (result) {
                          Navigator.of(context).pop();

                        }
                      },
                      child: const Text(
                        '确定',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
