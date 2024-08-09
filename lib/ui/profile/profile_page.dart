import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:kexie_app/global/global.dart';
import 'package:kexie_app/routes/route.dart';
import 'package:kexie_app/ui/profile/profile_controller.dart';
import 'package:kexie_app/widgets/image_button.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/toast.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 20, 15, 0),
                child: InkWell(
                  onTap: () => Global.isLogin.value ? Get.toNamed(AppRoute.detailProfile) : Get.toNamed(AppRoute.loginPage),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.surface,
                      gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.7),
                            Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.5),
                            Theme.of(context)
                                .colorScheme
                                .primary
                                .withOpacity(0.3),
                          ]), //背景渐变
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(20, 35, 15, 35),
                      child: Obx(() => Global.isLogin.value
                          ? Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                ClipOval(
                                    child: Container(
                                      width: 70,
                                      height: 70,
                                      color: Colors.white,
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            'http://jzhangluo.com:9000${Global.user.value.avatar}',
                                        fit: BoxFit.cover,
                                        width: 60,
                                        height: 60,
                                      ),
                                    )),
                                const SizedBox(
                                  width: 25,
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      Global.user.value.name,
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .surface,
                                          fontSize: 21,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      Global.user.value.department,
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .surface,
                                          fontSize: 17),
                                    ),
                                    Text(
                                      Global.user.value.studentId,
                                      style: TextStyle(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .surface,
                                          fontSize: 17),
                                    )
                                  ],
                                ),
                                Expanded(
                                    child: Container(
                                        alignment: Alignment.centerRight,
                                        child: Icon(
                                          Icons.arrow_forward_ios,
                                          color: Theme.of(context)
                                              .colorScheme
                                              .surface,
                                        )))
                              ],
                            )
                          : Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                  Text(
                                    '您还未登录，点击登录解锁更多功能',
                                    style: TextStyle(
                                        color:
                                            Theme.of(context).colorScheme.surface,
                                        fontSize: 16),
                                  ),
                                  Expanded(
                                      child: Container(
                                          alignment: Alignment.centerRight,
                                          child: Icon(
                                            Icons.arrow_forward_ios,
                                            color: Theme.of(context)
                                                .colorScheme
                                                .surface,
                                          ))),
                                ])),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                elevation: 8,
                color: Theme.of(context).cardTheme.color,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: SizedBox(
                  height: 125,
                  child: GridView(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, crossAxisSpacing: 1),
                    children: [
                      ImageButton(title: '科协成员', imagePath: 'svgs/group.svg', color: Colors.greenAccent, function: () => Get.toNamed(AppRoute.kexieMembers),),
                      ImageButton(title: '学校官网', imagePath: 'svgs/school.svg',function: () => launchUrl(Uri.parse('https://www.guet.edu.cn/')),),
                      ImageButton(title: '学校地图', imagePath: 'svgs/school_map.svg',function: () => Get.toNamed(AppRoute.schoolMap),),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: InkWell(
                        onTap: () {
                          c.changeThemeMode();
                        },
                        child: Obx(
                          () => Container(
                            height: 70,
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.surface,
                              borderRadius: BorderRadius.circular(16),
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
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                  c.themeModeSvg.value,
                                  width: 35,
                                  height: 35,
                                ),
                                const SizedBox(
                                  width: 6,
                                ),
                                Text(
                                  c.themeModeText.value,
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        height: 70,
                        decoration: BoxDecoration(
                          color: Theme.of(context)
                              .colorScheme
                              .primary
                              .withOpacity(0.8),
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                              color: Theme.of(context)
                                  .colorScheme
                                  .onSurface
                                  .withOpacity(0.5), // 阴影颜色
                              spreadRadius: 1.5, // 阴影扩散程度
                              blurRadius: 6, // 阴影模糊半径
                              offset: const Offset(0, 5), // 阴影偏移量
                            ),
                          ],
                        ),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.color_lens_outlined,
                              size: 35,
                              color: Theme.of(context).colorScheme.surface,
                            ),
                            const SizedBox(
                              width: 6,
                            ),
                            Text(
                              '主题换肤',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Theme.of(context).colorScheme.surface),
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              ListTile(
                title: Text(
                  '发帖记录',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 20,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 26,
                ),
                leading: SvgPicture.asset(
                  'svgs/forum_record.svg',
                  width: 26,
                  height: 26,
                ),
              ),
              ListTile(
                onTap: () => Get.toNamed(AppRoute.signRecord),
                title: Text(
                  '签到记录',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 20,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 26,
                ),
                leading: const Icon(
                  Icons.calendar_month_outlined,
                  size: 26,
                  color: Colors.green,
                ),
              ),
              ListTile(
                title: Text(
                  '分享应用',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 20,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 26,
                ),
                leading: const Icon(
                  Icons.share,
                  size: 26,
                  color: Colors.lightBlueAccent,
                ),
              ),
              ListTile(
                title: Text(
                  '关于应用',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 20,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 26,
                ),
                leading: const Icon(
                  Icons.info_outline,
                  size: 26,
                ),
              ),
              ListTile(
                onTap: () => Global.isLogin.value ? c.showExitDialog(context) : toast('请先登录'),
                title: Text(
                  '退出登录',
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onSurface,
                    fontSize: 20,
                  ),
                ),
                trailing: const Icon(
                  Icons.arrow_forward_ios,
                  size: 26,
                ),
                leading: const Icon(
                  Icons.exit_to_app,
                  size: 26,
                  color: Colors.red,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
