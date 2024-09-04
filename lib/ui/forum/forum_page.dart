import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:kexie_app/global/global.dart';
import 'package:kexie_app/models/forum_posts/forum_posts.dart';
import 'package:kexie_app/routes/route.dart';
import 'package:kexie_app/widgets/keep_alive_wrapper.dart';
import 'forum_controller.dart';
import 'post_card.dart';

class PostPage extends StatelessWidget {
  final String categoryId;

  const PostPage({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    final PostPageController postController =
        Get.put(PostPageController(categoryId), tag: categoryId);

    return RefreshIndicator(
      onRefresh: () async {
        await postController.refresh();
      },
      child: PagedListView<int, Post>(
        pagingController: postController.pagingController,
        builderDelegate: PagedChildBuilderDelegate<Post>(
          itemBuilder: (context, post, index) {
            return PostCard(
              post: post,
              onChangeLikePost: (bool isLiked) async {
                if (isLiked) {
                  await postController.unlike(post.iD);
                  return false;
                } else {
                  await postController.like(post.iD);
                  return true;
                }
              },
            );
          },
          firstPageErrorIndicatorBuilder: (context) => Center(
            child: TextButton(
              onPressed: () => postController.pagingController.refresh(),
              child: const Text("加载失败，点击重试"),
            ),
          ),
          newPageErrorIndicatorBuilder: (context) => Center(
            child: TextButton(
              onPressed: () => print(222222),
              child: const Text("加载失败，点击重试"),
            ),
          ),
          noItemsFoundIndicatorBuilder: (context) => const Center(
            child: Text("没有找到帖子"),
          ),
        ),
      ),
    );
  }
}

class ForumPage extends StatefulWidget {
  const ForumPage({super.key});

  @override
  State<ForumPage> createState() => _ForumPageState();
}

class _ForumPageState extends State<ForumPage>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  final categories = ['全部', '软件部', '多媒体部', '硬件部'];
  final pageController = PageController();

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: categories.length, vsync: this);
  }

  @override
  void dispose() {
    tabController.dispose();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tabController =
        TabController(length: categories.length, vsync: Scaffold.of(context));
    return Obx(() {
      if (Global.isLogin.value) {
        return Global.user.value.permission <= 2
            ? Scaffold(
                appBar: AppBar(
                  title: const Text('科协论坛'),
                  actions: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 8, 15, 8),
                      child: Container(
                          decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              shape: BoxShape.circle),
                          child: IconButton(
                              onPressed: () {
                                Get.toNamed(AppRoute.sendPostPage);
                              },
                              icon: Icon(
                                Icons.add,
                                color: Theme.of(context).colorScheme.surface,
                              ))),
                    )
                  ],
                  bottom: TabBar(
                      controller: tabController,
                      tabs: categories
                          .map((e) => Tab(
                                text: e.toString(),
                              ))
                          .toList(),
                      onTap: (index) => pageController.jumpToPage(index)),
                ),
                body: PageView.builder(
                  controller: pageController,
                  onPageChanged: (index) => tabController.animateTo(index),
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return KeepAliveWrapper(child: PostPage(categoryId: index.toString()));
                  },
                ))
            : permissionLackPage();
      } else {
        return withoutLoginPage();
      }
    });
  }

  Widget permissionLackPage() {
    return const Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '论坛只向科协正式成员开放哦',
            style: TextStyle(fontSize: 18),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            '努力学习，争取成为科协正式的一员吧',
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }

  Widget withoutLoginPage() {
    return Center(
        child: Text.rich(TextSpan(children: [
      const TextSpan(text: '论坛只对科协成员开放,请先完成', style: TextStyle(fontSize: 18)),
      TextSpan(
          text: '登录',
          style: const TextStyle(
              fontSize: 18,
              color: Colors.blue,
              decoration: TextDecoration.underline,
              decorationColor: Colors.blue),
          recognizer: TapGestureRecognizer()
            ..onTap = () => Get.toNamed(AppRoute.loginPage))
    ])));
  }
}
