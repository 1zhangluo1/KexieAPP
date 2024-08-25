import 'package:anim_search_bar/anim_search_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:kexie_app/models/kexie_members/member_info_page.dart';
import 'package:kexie_app/ui/kexie_members/kexie_members_controller.dart';
import 'package:kexie_app/widgets/error_page.dart';
import 'package:kexie_app/widgets/toast.dart';

class KexieMembersPage extends StatefulWidget {
  const KexieMembersPage({super.key});

  @override
  State<KexieMembersPage> createState() => _KexieMembersPageState();
}

class _KexieMembersPageState extends State<KexieMembersPage> {
  final c = Get.put(KexieMembersController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor:
              Theme.of(context).colorScheme.primary.withOpacity(0.5),
          title: const Text('科协成员'),
          actions: [
            Padding(
              padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
              child: AnimSearchBar(
                width: MediaQuery.of(context).size.width - 20,
                textController: c.searchController,
                textFieldColor: Theme.of(context).colorScheme.surface,
                textFieldIconColor: Theme.of(context).colorScheme.onSurface,
                style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
                color: Theme.of(context).colorScheme.surface,
                onSuffixTap: () => c.searchController.clear(),
                onSubmitted: (e) {c.filterMembers.value = c.kexieMembers.value.data.where((member) => member.name.contains(e.trim())).toList();},
                prefixIcon: const Icon(Icons.search),
                helpText: '搜索关键词',
              ),
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SafeArea(
            child: FutureBuilder(
              future: c.members,
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return ErrorPage.loadDataFailed;
                  } else {
                    return Obx(() => memberList());
                  }
                } else {
                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SpinKitWave(
                        color: Theme.of(context).colorScheme.primary,
                        size: 50,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        '加载中...',
                        style: TextStyle(fontSize: 23, letterSpacing: 6),
                      )
                    ],
                  );
                }
              },
            ),
          ),
        ));
  }

  Widget memberList() {
    return c.filterMembers.isEmpty
        ? const Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(Icons.error_outline_outlined,size: 100,),
                SizedBox(height: 15,),
                Text('暂无匹配数据',style: TextStyle(fontSize: 20),),
              ],
            ),
          )
        : ListView.separated(
            itemBuilder: (context, index) {
              return ListTile(
                onTap: () => Get.to(MemberInfoPage(member: c.filterMembers[index]),transition: Transition.cupertino),
                title: Text(c.filterMembers[index].name),
                trailing: const Icon(Icons.arrow_forward_ios_outlined),
              );
            },
            separatorBuilder: (context, index) {
              return Container(
                height: 0.5,
                width: double.infinity,
                color: Colors.grey,
              );
            },
            itemCount: c.filterMembers.length);
  }
}
