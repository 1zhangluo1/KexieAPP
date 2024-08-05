import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_utils/src/platform/platform.dart';
import 'package:kexie_app/ui/detail_profile/detail_profile_controller.dart';
import 'package:kexie_app/widgets/toast.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:saver_gallery/saver_gallery.dart';

import '../../global/global.dart';

class DetailProfilePage extends StatefulWidget {
  const DetailProfilePage({super.key});

  @override
  State<DetailProfilePage> createState() => _DetailProfilePageState();
}

class _DetailProfilePageState extends State<DetailProfilePage> {

  final c = Get.put(DetailProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('个人信息',style: TextStyle(
          color: Theme.of(context).colorScheme.onSurface
        ),),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Obx(
            () => Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
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
                  height: 150,
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: Align(
                      alignment: Alignment.center,
                      child: InkWell(
                        onLongPress: () => {
                          showBottomSheet(context)
                        },
                        child: Container(
                          width: 120,
                          height: 120,
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(2.0),
                            child: ClipOval(
                              child: CachedNetworkImage(
                                imageUrl:
                                'http://jzhangluo.com:9000${Global.user.value.avatar}',
                                fit: BoxFit.cover,
                                height: 110,
                                width: 110,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('姓名',style: TextStyle(fontSize: 20,color: Theme.of(context).colorScheme.onSurface),),
                                Text(Global.user.value.name,style: TextStyle(fontSize: 20,color: Theme.of(context).colorScheme.onSurface)),
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.grey,
                            width: double.infinity,
                            height: 0.5,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('学号',style: TextStyle(fontSize: 20,color: Theme.of(context).colorScheme.onSurface),),
                                Text(Global.user.value.studentId,style: TextStyle(fontSize: 20,color: Theme.of(context).colorScheme.onSurface)),
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.grey,
                            width: double.infinity,
                            height: 0.5,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('年级',style: TextStyle(fontSize: 20,color: Theme.of(context).colorScheme.onSurface),),
                                Text('${Global.user.value.grade}级',style: TextStyle(fontSize: 20,color: Theme.of(context).colorScheme.onSurface)),
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.grey,
                            width: double.infinity,
                            height: 0.5,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('邮箱',style: TextStyle(fontSize: 20,color: Theme.of(context).colorScheme.onSurface),),
                                Text(Global.user.value.email,style: TextStyle(fontSize: 20,color: Theme.of(context).colorScheme.onSurface)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('部门',style: TextStyle(fontSize: 20,color: Theme.of(context).colorScheme.onSurface),),
                                Text(Global.user.value.department,style: TextStyle(fontSize: 20,color: Theme.of(context).colorScheme.onSurface)),
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.grey,
                            width: double.infinity,
                            height: 0.5,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('学习方向',style: TextStyle(fontSize: 20,color: Theme.of(context).colorScheme.onSurface),),
                                Text(Global.user.value.learnDirection,style: TextStyle(fontSize: 20,color: Theme.of(context).colorScheme.onSurface)),
                              ],
                            ),
                          ),
                          Container(
                            color: Colors.grey,
                            width: double.infinity,
                            height: 0.5,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('所在科协教室',style: TextStyle(fontSize: 20,color: Theme.of(context).colorScheme.onSurface),),
                                Text(Global.user.value.location,style: TextStyle(fontSize: 20,color: Theme.of(context).colorScheme.onSurface)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void showBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                  c.readAvatar();
                },
                child: Container(
                    width: double.infinity,
                    height: 65,
                    child: Center(
                        child: Text(
                          '查看头像',
                          style: TextStyle(fontSize: 20,color: Theme.of(context).colorScheme.onSurface),
                        ))),
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey,
              ),
              InkWell(
                onTap: () async {
                  await c.changeAvatar(context);
                  Navigator.of(context).pop();
                },
                child: Container(
                    width: double.infinity,
                    height: 65,
                    child: Center(
                        child: Text(
                          '更换头像',
                          style: TextStyle(fontSize: 20,color: Theme.of(context).colorScheme.onSurface),
                        ))),
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey,
              ),
              InkWell(
                onTap: () async {
                  await c.saveNetworkImage(context);
                  Navigator.of(context).pop();
                },
                child: Container(
                    width: double.infinity,
                    height: 65,
                    child: Center(
                        child: Text(
                          '保存头像',
                          style: TextStyle(fontSize: 20,color: Theme.of(context).colorScheme.onSurface),
                        ))),
              ),
              Container(
                width: double.infinity,
                height: 1,
                color: Colors.grey,
              ),
              InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Container(
                    width: double.infinity,
                    height: 65,
                    child: Center(
                        child: Text(
                          '取消',
                          style: TextStyle(fontSize: 20,color: Theme.of(context).colorScheme.onSurface),
                        ))),
              ),
            ],
          );
        }
    );
  }
}
