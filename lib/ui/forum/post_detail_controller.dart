import 'package:flutter/foundation.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:flutter/material.dart';
import 'package:kexie_app/internet/forum_repository.dart';
import '../../Internet/network.dart';
import '../../models/forum_posts/forum_posts.dart';
import '../../widgets/toast.dart';

class PostDetailController extends GetxController {
  final Post post;
  final TextEditingController replyController = TextEditingController();
  final focus = FocusNode().obs;
  final PagingController<int, Post> pagingController = PagingController(firstPageKey: 1);
  static const int pageSize = 20;
  final Rx<int> watchCount;
  final isSending = false.obs;
  final replyIsBlank = true.obs;
  final imagePicker = ImagePicker();
  var images = <XFile>[].obs;
  RxList<String> imageUrls = <String>[].obs;

  PostDetailController({required this.post}) : watchCount = post.watchCount.obs;

  Future<void> fetchReplies(int pageKey) async {
    try {
      final postsResp = await ForumRepository.get().getPosts(
        parentId: post.iD,
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
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      pagingController.error = e;
    }
  }

  Future<void> refresh() async {
    try {
      pagingController.refresh();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
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

  Future<void> viewPost(int postId) async {
    final resp = await ForumRepository.get().view(postId);
    if (resp == 200) {
      watchCount.value += 1;
    }
  }

  void pickImage() async {
    if (images.length < 9) {
      final pickedFile = await imagePicker.pickMultiImage();
      images.addAll(pickedFile);
    } else {
      toastFailure(
          error: '\n一次最多上传9张图片捏',
          message: '图片已达到上限',
          toastGravity: ToastGravity.TOP);
    }
  }

  Future<void> replyPost(int parentId, String text, List<String> images) async {
    try {
      isSending.value = true;
      final dio = AppNetwork.get().appDio;
      Map<String, dynamic> data = {
        "parent_id": parentId,
        "text": text,
        "images": images,
      };
      final response = await dio.post('/forum/upload_post', data: data);
      if (response.data['code'] == 200) {
        toastSuccess0("评论成功");
        if (focus.value.hasFocus) focus.value.unfocus();
        refresh();
      } else {
        toastFailure(message: '评论失败', error: response.data['msg']);
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e);
      }
      toastFailure(message: '评论失败：', error: e);
    } finally {
      isSending.value = false;
      replyController.clear();
    }
  }

  @override
  void onClose() {
    focus.value.dispose();
    super.onClose();
  }

  @override
  void onInit() {
    super.onInit();
    replyController.addListener((){
      replyIsBlank.value = !replyController.text.isNotEmpty;
    });
    pagingController.addPageRequestListener((pageKey) {
      fetchReplies(pageKey);
    });
    print("当前帖子Id:" + post.parentId.toString());
    try {
      viewPost(post.iD);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

}
