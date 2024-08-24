import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kexie_app/gen/assets.gen.dart';
import 'package:kexie_app/ui/recruit/recruit_controller.dart';
import 'package:kexie_app/widgets/recruit_widget.dart';
import 'package:kexie_app/widgets/toast.dart';

class RecruitPage extends StatefulWidget {
  const RecruitPage({super.key});

  @override
  State<RecruitPage> createState() => _RecruitPageState();
}

class _RecruitPageState extends State<RecruitPage> {
  final c = Get.put(RecruitController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '科协招新',
          style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
        ),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: Image.asset(
                  Assets.image.kexieRecruitBackground.path,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 20, 15, 10),
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(5))),
                  child: Form(
                      key: c.formKey,
                      child: Column(
                        children: [
                          RecruitEdit(
                            title: '1.姓名',
                            hint: '姓名',
                            isMust: true,
                            controller: c.nameController,
                            validator: c.nameValidator,
                          ),
                          RecruitEdit(
                              title: '2.学号',
                              hint: '学号',
                              isMust: true,
                              validator: c.idValidator,
                              controller: c.studentIdController),
                          RecruitEdit(
                              title: '3.邮箱',
                              hint: '邮箱',
                              isMust: true,
                              validator: c.emailValidator,
                              controller: c.emailController),
                          RecruitEdit(
                              title: '4.电话号码',
                              hint: '电话号码',
                              isMust: true,
                              validator: c.phoneValidator,
                              controller: c.phoneController),
                          const RecruitSelect(
                            title: '5.学习方向',
                            isMust: true,
                            boolOrString: 1,
                            help: '科协网站上有对应方向的介绍。\n(https://hello.kexie.space)',
                            selectContent: [
                              '安卓开发',
                              '深度学习',
                              '网站开发',
                              '小程序开发',
                              '游戏开发',
                              'UI设计',
                              '嵌入式开发',
                              '视频剪辑'
                            ],
                          ),
                          const RecruitSelect(
                            title: '6.是否加入组织部',
                            isMust: true,
                            boolOrString: 0,
                            help:
                                '组织部是负责平时管理科协的一些事务的部门，在学习技术的同时管理科协的事务，选择完学习方向后可以考虑看看要不要加入组织呢？',
                            selectContent: ['是', '否'],
                          ),
                          RecruitEdit(
                              title: '7.自我介绍',
                              hint: '',
                              isMust: true,
                              validator: c.introduceValidator,
                              maxLines: 5,
                              maxWord: 500,
                              help: '自己的兴趣爱好，对大学生活的打算和憧憬（50-500字以内）',
                              controller: c.introduceController),
                          RecruitEdit(
                              title: '8.加入科协的原因',
                              hint: '',
                              help:
                                  '为了让我们更好地了解你，可以告诉我们你加入科协的理由吗？例如，对科协有什么向往或者想在科协收获什么。（50-500字以内）',
                              isMust: true,
                              maxLines: 5,
                              maxWord: 500,
                              validator: c.reasonValidator,
                              controller: c.reasonController),
                          RecruitEdit(
                              title: '9.对科协的印象 (选填)',
                              hint: '',
                              isMust: false,
                              maxWord: 500,
                              validator: c.impressionValidator,
                              controller: c.impressionController),
                        ],
                      )),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: () {
                        if ((c.formKey.currentState as FormState).validate()) {
                          c.uploadInfo(context);
                        } else {
                          toastFailure(message: '请完整填写表格');
                        }
                      },
                      style: ButtonStyle(
                          backgroundColor: WidgetStatePropertyAll(
                              Theme.of(context).colorScheme.primary)),
                      child: Text(
                        '提交',
                        style: TextStyle(
                            color: Theme.of(context).colorScheme.surface,
                            fontSize: 18,
                            letterSpacing: 10),
                      ),
                    )),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
