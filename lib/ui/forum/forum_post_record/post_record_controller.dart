import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:kexie_app/global/global.dart';

import '../../../internet/forum_repository.dart';
import '../../../models/forum_posts/forum_posts.dart';

class PostRecordController extends GetxController {
  final PagingController<int, Post> pagingController =
  PagingController(firstPageKey: 1);
  static const int pageSize = 20;
  final isLoadFailed = false.obs;

  @override
  void onInit() {
    super.onInit();
    pagingController.addPageRequestListener((pageKey) {
      fetchPosts(pageKey);
    });
  }

  Future<void> fetchPosts(int pageKey) async {
    try {
      final postsResp = await ForumRepository.get().getPosts(
        page: pageKey,
        pageSize: pageSize,
        userId: Global.user.value.iD,
      );
      final isLastPage = postsResp.data.length < pageSize;
      if (isLastPage) {
        pagingController.appendLastPage(postsResp.data);
      } else {
        final nextPageKey = pageKey + 1;
        pagingController.appendPage(postsResp.data, nextPageKey);
      }
      isLoadFailed.value = false;
    } catch (e) {
      pagingController.error = e;
      isLoadFailed.value = true;
    }
  }

  Future<bool> deletePost(int postId) async {
    final response = await ForumRepository.get().deletePost(postId);
    if (response != 200) {
      return false;
    } else return true;
  }

  Future<void> refresh() async {
    pagingController.refresh();
  }

}