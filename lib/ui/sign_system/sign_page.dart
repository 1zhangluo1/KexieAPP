
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kexie_app/global/global.dart';
import 'package:kexie_app/models/onlineUsers/onlineUsers.dart';
import 'package:kexie_app/ui/sign_system/sign_controller.dart';
import 'package:kexie_app/widgets/hint_dialog.dart';


class SignPage extends StatefulWidget {
  const SignPage({super.key});

  @override
  State<SignPage> createState() => _SignPageState();
}

class _SignPageState extends State<SignPage> {
  final c = Get.put(SignController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('签到'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: Column(
          children: [
            Obx(
              () => Card(
                  color: c.isSign.value ? Colors.green : Colors.grey,
                  child: c.isSign.value
                      ? Padding(
                          padding: const EdgeInsets.fromLTRB(20, 25, 20, 25),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Icon(
                                Icons.check_circle,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    '已签到',
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 16),
                                  ),
                                  Text('学号: ${Global.user.value.studentId}',
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 16)),
                                  Text('姓名: ${Global.user.value.name}',
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 16)),
                                  Text('周序: ${c.week}',
                                      style: const TextStyle(
                                          color: Colors.white, fontSize: 16)),
                                ],
                              ),
                            ],
                          ),
                        )
                      : const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 30.0),
                            child: Text(
                              '未签到',
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        )),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Expanded(
                    child: Obx(
                  () => ElevatedButton(
                    onPressed: () => {
                      Global.isLogin.value
                          ? (c.isSign.value ? null : c.sign())
                          : HintDialog.showHintDialog(context,
                              content: '需要先登录方可使用此功能，点击确定跳转至登录界面')
                    },
                    style: ButtonStyle(
                      backgroundColor: c.isSign.value
                          ? const WidgetStatePropertyAll(Colors.grey)
                          : WidgetStatePropertyAll(
                              Theme.of(context).colorScheme.primary),
                    ),
                    child: Text(
                      '签到',
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.surface,
                          fontSize: 16),
                    ),
                  ),
                )),
                const SizedBox(
                  width: 40,
                ),
                Expanded(
                  child: ElevatedButton(
                      onPressed: () => {c.signOut()},
                      child: const Text(
                        '签退',
                        style: TextStyle(fontSize: 16),
                      )),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Obx(
              () => c.isSign.value
                  ? Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        boxShadow: [
                          BoxShadow(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.3), // 阴影颜色
                            spreadRadius: 0.5, // 阴影扩散程度
                            blurRadius: 6, // 阴影模糊半径
                            offset: const Offset(0, 5), // 阴影偏移量
                          ),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Obx(() => Text(
                                    '当前在教室人数: ${c.peopleNums.value}',
                                    style: const TextStyle(fontSize: 20),
                                  )),
                              const SizedBox(
                                height: 20,
                              ),
                              SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Column(
                                  children: [
                                    const Row(
                                      children: [
                                        SizedBox(
                                            width: 120,
                                            child: Center(
                                                child: Text(
                                              '学号',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ))),
                                        SizedBox(
                                            width: 120,
                                            child: Center(
                                                child: Text(
                                              '姓名',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ))),
                                        SizedBox(
                                            width: 120,
                                            child: Center(
                                                child: Text(
                                              '部门',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ))),
                                        SizedBox(
                                            width: 120,
                                            child: Center(
                                                child: Text(
                                              '地点',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ))),
                                        SizedBox(
                                            width: 100,
                                            child: Center(
                                                child: Text(
                                              '操作',
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.bold),
                                            ))),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      width: 580,
                                      color: Colors.grey,
                                      height: 1,
                                    ),
                                    SizedBox(
                                      width: 580,
                                      height: 200,
                                      child: Obx(
                                        () => ListView.separated(
                                          itemCount: c.peopleNums.value,
                                          separatorBuilder: (context, index) {
                                            return Container(
                                              color: Colors.grey,
                                              width: 580,
                                              height: 1,
                                            );
                                          },
                                          itemBuilder: (context, index) {
                                            return Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 5.0),
                                              child: userList(
                                                  c.onlineUsers[index]),
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ]),
                      ),
                    )
                  : const SizedBox(
                      height: 0,
                    ),
            ),
          ],
        ),
      ),
    );
  }

  Widget userList(Data user) {
    return Row(
      children: [
        SizedBox(
            width: 120,
            child: Center(
                child: Text(
              user.userId.toString(),
              style: const TextStyle(fontSize: 16),
            ))),
        SizedBox(
            width: 120,
            child: Center(
                child: Text(
              user.userName,
              style: const TextStyle(fontSize: 16),
            ))),
        SizedBox(
            width: 120,
            child: Center(
                child: Text(
              user.userDept,
              style: const TextStyle(fontSize: 16),
            ))),
        SizedBox(
            width: 120,
            child: Center(
                child: Text(
              user.userLocation,
              style: const TextStyle(fontSize: 16),
            ))),
        SizedBox(
            width: 100,
            child: Center(
                child: ElevatedButton(
                    onPressed: () {c.complaintUser(user.userId);},
                    style: ButtonStyle(
                        shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)))),
                    child: const Text('举报')))),
      ],
    );
  }
}

// SingleChildScrollView(
// scrollDirection: Axis.horizontal,
// child: Row(
// children: [
// Text('学号',style: TextStyle(fontSize: 16),),
// SizedBox(width: 30,),
// Text('姓名',style: TextStyle(fontSize: 16),),
// SizedBox(width: 30,),
// Text('部门',style: TextStyle(fontSize: 16),),
// SizedBox(width: 30,),
// Text('地点',style: TextStyle(fontSize: 16),),
// SizedBox(width: 30,),
// Text('操作',style: TextStyle(fontSize: 16),),
// ]
// ),
// ),
// SingleChildScrollView(
// scrollDirection: Axis.horizontal,
// child: Row(
// children: [
// Text('2300320225',style: TextStyle(fontSize: 16),),
// SizedBox(width: 30,),
// Text('张三',style: TextStyle(fontSize: 16),),
// SizedBox(width: 30,),
// Text('软件部',style: TextStyle(fontSize: 16),),
// SizedBox(width: 30,),
// Text('5108',style: TextStyle(fontSize: 16),),
// SizedBox(width: 30,),
// ElevatedButton(
// onPressed: () => {},
// style: const ButtonStyle(
// surfaceTintColor: WidgetStatePropertyAll(Colors.grey),
// ),
// child: Text('举报',style: TextStyle(color: Theme.of(context).colorScheme.onSurface),),
// ),
// ]
// ),
// ),
