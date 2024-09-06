import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:intl/intl.dart';
import 'package:kexie_app/global/global.dart';
import 'package:kexie_app/routes/route.dart';
import 'package:kexie_app/ui/forum/forum_page.dart';
import 'package:kexie_app/ui/forum/forum_post_record/post_record_controller.dart';
import 'package:kexie_app/widgets/login_fail_page.dart';
import 'package:kexie_app/widgets/toast.dart';

import '../../../models/forum_posts/forum_posts.dart';
import '../post_card.dart';
import '../post_detail_page.dart';

class PostRecordPage extends StatefulWidget {
  const PostRecordPage({super.key});

  @override
  State<PostRecordPage> createState() => _PostRecordPageState();
}

class _PostRecordPageState extends State<PostRecordPage> {
  final c = Get.put(PostRecordController(), tag: Global.user.value.studentId);
  final datetimeFormat = DateFormat("yyyy-MM-dd HH:mm:ss");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('发帖记录'),
        ),
        body: Obx(() => Global.user.value.studentId.isNotEmpty
            ? RefreshIndicator(
                onRefresh: () async {
                  await c.refresh();
                },
                child: PagedListView<int, Post>(
                  pagingController: c.pagingController,
                  builderDelegate: PagedChildBuilderDelegate<Post>(
                    itemBuilder: (context, post, index) {
                      return postRecordCard(post: post,index: index);
                    },
                    firstPageErrorIndicatorBuilder: (context) => Center(
                      child: TextButton(
                        onPressed: () => c.pagingController.refresh(),
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
              )
            : LoginFailPage()));
  }

  Widget postRecordCard({
    required Post post,
    required int index
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Slidable(
        key: ValueKey(post.iD),
        direction: Axis.horizontal,
        endActionPane: ActionPane(motion: ScrollMotion(), children: [
          SlidableAction(
            onPressed: (context) async {
              print('删除${post.iD}');
              bool isDelete = await c.deletePost(post.iD);
              if (isDelete) {
                setState(() {
                  c.pagingController.itemList?.removeAt(index);
                });
              } else {
                toastFailure(message: '删除失败');
              }
            } ,
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: '删除',
          ),
        ]),
        child: InkWell(
          onTap: () => Get.toNamed(AppRoute.detailPost,
              preventDuplicates: false,
              arguments: PostDetailPageArgs(post: post)),
          child: Container(
            height: 130,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.black
                  : Colors.white,
              shape: BoxShape.rectangle,
            ),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(16, 10, 0, 10),
                        child: Text(
                          datetimeFormat
                              .format(DateTime.parse(post.createdAt).toLocal()),
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width - 100,
                          child: Text(
                            post.text,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 16),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(16, 10, 0, 10),
                          child: Align(
                            alignment: Alignment.bottomLeft,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(
                                  Icons.remove_red_eye_outlined,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(post.watchCount.toString()),
                                SizedBox(
                                  width: 25,
                                ),
                                Icon(
                                  Icons.favorite_border_outlined,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(post.likesCount.toString()),
                                SizedBox(
                                  width: 25,
                                ),
                                Icon(
                                  Icons.message_outlined,
                                  size: 20,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(post.repliesCount.toString()),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  post.images.isNotEmpty
                      ? Align(
                          alignment: Alignment.bottomRight,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 10, 10),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: CachedNetworkImage(
                                  imageUrl: post.images.first,
                                  width: 60,
                                  height: 60,
                                  fit: BoxFit.cover,
                                )),
                          ),
                        )
                      : SizedBox(),
                ]),
          ),
        ),
      ),
    );
  }
}
