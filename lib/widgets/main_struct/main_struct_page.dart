import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:kexie_app/routes/route.dart';
import 'package:kexie_app/ui/forum/forumpage.dart';
import 'package:kexie_app/ui/profile/profile_page.dart';
import 'package:kexie_app/ui/sign_system/sign_page.dart';
import 'package:kexie_app/widgets/contain_image_button.dart';
import 'package:kexie_app/widgets/main_struct/main_struct_controller.dart';

import '../../ui/HomePage/homeopage_view.dart';

class MainStruct extends StatefulWidget {
  const MainStruct({super.key});

  @override
  State<MainStruct> createState() => _MainStructState();
}

class _MainStructState extends State<MainStruct> {
  int pageId = 0;
  final PageController _controller = PageController();
  RxInt angle = 90.obs;
  RxBool floatButtonIsSelected = false.obs;
  RxDouble bottomToolbarHeight = 0.0.obs;
  RxList<ContainImageButton> bottomBarFunctions = [ const ContainImageButton(background: Colors.orange, icon: Icons.event_available, label: '签到'),].obs;

  @override
  Widget build(BuildContext context) {
    final c = Get.put(MainStructController());
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: GestureDetector(
        onTap: () {
          if (floatButtonIsSelected.value) {
            angle.value = 0;
            bottomToolbarHeight.value = 0;
            bottomBarFunctions.clear();
            floatButtonIsSelected.value = !floatButtonIsSelected.value;
          } else if (!floatButtonIsSelected.value) {}
        },
        child: Obx(
            () => Stack(children: [
            PageView(
              onPageChanged: (index) {
                setState(() {
                  pageId = index;
                });
              },
              physics: const NeverScrollableScrollPhysics(),
              controller: _controller,
              children: const [
                HomePages(),
                SignPage(),
                Forum(),
                Profile(),
              ],
            ),
            Positioned(
              bottom: 0,
              child: GestureDetector(
                onTap: (){},
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  padding: const EdgeInsets.fromLTRB(16,0,16,0),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: const BorderRadius.vertical(top: Radius.circular(35)),
                    border: Border.all(width: 0.25,color: Colors.grey),
                  ),
                  height: bottomToolbarHeight.value,
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: GridView(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4, //横轴4个子widget
                          childAspectRatio: 1
                      ),
                      children: bottomBarFunctions,
                    ),
                  ),
                ),
              ),
            )
          ]),
        ),
      ),
      floatingActionButton: Obx(
        () => FloatingActionButton(
          shape: const CircleBorder(),
          backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(0.7),
          child: AnimatedRotation(
              turns: angle.value / 360,
              duration: const Duration(milliseconds: 300),
              child: Icon(
                Icons.add,
                color: Theme.of(context).colorScheme.surface,
              )),
          onPressed: () {
            if (floatButtonIsSelected.value) {
              angle.value = 0;
              bottomToolbarHeight.value = 0;
              bottomBarFunctions.clear();
            } else {
              angle.value += 360 * 1 + 45;
              bottomToolbarHeight.value = MediaQuery.of(context).size.height / 3.6;
              bottomBarFunctions.clear();
              bottomBarFunctions.addAll([
                ContainImageButton(background: Colors.orange, icon: Icons.book, label: '图书借阅',event: () => Get.toNamed(AppRoute.bookBorrow),),
                ContainImageButton(background: Colors.deepPurpleAccent, icon: Icons.equalizer, label: '打卡统计', event: () => Get.toNamed(AppRoute.signRank),),
                ContainImageButton(background: Colors.pinkAccent, icon: Icons.add_reaction, label: '科协招新', event: () => Get.toNamed(AppRoute.recruit),),
                ContainImageButton(background: Colors.blueGrey, icon: Icons.token, label: '优秀作品', event: () => c.toKeixeGithub(),),
                ContainImageButton(background: Colors.greenAccent, icon: Icons.web, label: '科协官网',event: () => c.toKexieWeb(),),
                ContainImageButton(background: Colors.yellow, icon: Icons.store, label: '科协git',event: () => c.toKexieGit(),),
                ContainImageButton(background: Colors.blueAccent, icon: Icons.cloud_download, label: '科协网盘', event: () => c.tokexieNetdisk(),),
                ContainImageButton(background: Colors.redAccent, icon: Icons.login, label: '登录',event: () => Get.toNamed(AppRoute.loginPage),),
              ]
              );
            }
            floatButtonIsSelected.value = !floatButtonIsSelected.value;
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: bottomBar(),
    );
  }

  Widget bottomBar() {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 10.0,
      shadowColor: Colors.black,
      color: Theme.of(context).colorScheme.surface,
      surfaceTintColor: Theme.of(context).colorScheme.surface,
      elevation: 5,
      height: 60,
      padding: const EdgeInsets.only(top: 10),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          bottomItem(
            0,
            Icons.school,
            "首页",
          ),
          bottomItem(1, Icons.event_available, "签到"),
          const SizedBox(
            width: 40,
          ),
          bottomItem(2, Icons.forum, "论坛"),
          bottomItem(3, Icons.person, "我的"),
        ],
      ),
    );
  }

  Widget bottomItem(int index, IconData? icon, String title,
      {Color? color = Colors.grey}) {
    return Expanded(
      flex: 1,
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: () {
          setState(() {
            pageId = index;
            _controller.animateToPage(index,
                duration: const Duration(
                    days: 0, hours: 0, minutes: 0, milliseconds: 250),
                curve: Curves.linear);
          });
        },
        child: Column(
          children: [
            Icon(
              icon,
              color: pageId == index ? Theme.of(context).colorScheme.primary.withOpacity(0.7) : color,
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}
