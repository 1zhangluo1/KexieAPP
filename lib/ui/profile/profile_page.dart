import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kexie_app/gen/assets.gen.dart';
import 'package:kexie_app/global/global.dart';
import 'package:kexie_app/ui/profile/profile_controller.dart';
import 'package:kexie_app/widgets/image_button.dart';

class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    final c = Get.put(ProfileController());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.cyan.shade100,
      ),
      body: SafeArea(
        child: Column(
          children: [
            DecoratedBox(
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.cyan.shade100,
                        Colors.cyan.shade50,
                        Colors.white,
                      ]), //背景渐变
                  borderRadius: BorderRadius.circular(3),
                  boxShadow: const [
                    //阴影
                    BoxShadow(color: Colors.black54, blurRadius: 8.0)
                  ]),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(20, 35, 15, 40),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Obx(() => Global.isLogin.value
                            ? const Text('账户头像')
                            : ClipOval(
                                child: Image(
                                image: AssetImage(
                                    Assets.image.loginfailHeadimage.path),
                                fit: BoxFit.contain,
                                width: 70,
                                height: 70,
                              ))),
                        const SizedBox(
                          width: 25,
                        ),
                        const Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '张洛',
                              style: TextStyle(
                                  fontSize: 21, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              '软件部',
                              style: TextStyle(fontSize: 16),
                            ),
                            Text(
                              '学号：' '2300320225',
                              style: TextStyle(fontSize: 16),
                            )
                          ],
                        ),
                        Expanded(
                            child: Container(
                                alignment: Alignment.centerRight,
                                child: const Icon(Icons.arrow_forward_ios)))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Expanded(
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16)),
                elevation: 8,
                color: Theme.of(context).cardTheme.color,
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: GridView(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, crossAxisSpacing: 1),
                  children: const [
                    ImageButton(
                      title: '个人信息',
                      imagePath: 'svgs/detail_profiles.svg',
                      color: Colors.cyan,
                    ),
                    ImageButton(
                        title: '发帖记录', imagePath: 'svgs/forum_record.svg'),
                    ImageButton(
                        title: '签到记录', imagePath: 'svgs/sign_record.svg'),
                    ImageButton(title: '夜间模式', imagePath: 'svgs/dark_mode.svg'),
                    ImageButton(
                        title: '学校地图', imagePath: 'svgs/school_map.svg'),
                    ImageButton(
                        title: '发帖记录', imagePath: 'svgs/forum_record.svg'),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            ListTile(
              title: Text(
                '主题换肤',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 20,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 26,
              ),
              leading: Icon(
                Icons.color_lens_outlined,
                size: 26,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
            ListTile(
              title: Text(
                '主题换肤',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurface,
                  fontSize: 20,
                ),
              ),
              trailing: const Icon(
                Icons.arrow_forward_ios,
                size: 26,
              ),
              leading: Icon(
                Icons.color_lens_outlined,
                size: 26,
                color: Theme.of(context).colorScheme.primary,
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
              onTap: () => c.showExitDialog(context),
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
    );
  }
}
