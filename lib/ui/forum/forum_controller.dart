import 'package:get/get.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:kexie_app/models/forum_posts/forum_posts.dart';
import '../../internet/forum_repository.dart';
import '../../widgets/toast.dart';

class PostPageController extends GetxController {
  final String categoryId;
  final PagingController<int, Post> pagingController =
  PagingController(firstPageKey: 1);
  static const int pageSize = 20;
  final isLoadFailed = false.obs;
  PostPageController(this.categoryId);

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

  Future<void> refresh() async {
    pagingController.refresh();
  }

  Future<void> like(int postId) async {
    final response = await ForumRepository.get().like(postId);
    if (response != 200) {
      toastFailure(message: "点赞失败");
      throw Exception("点赞失败");
    }
  }

  Future<void> unlike(int postId) async {
    final resp = await ForumRepository.get().unlike(postId);
    if (resp != 200) {
      toastFailure(message: "取消点赞失败");
      throw Exception("点赞失败");
    }
  }

}
