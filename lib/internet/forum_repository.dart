import 'package:kexie_app/Internet/network.dart';
import 'package:kexie_app/models/forum_posts/forum_posts.dart';

class ForumRepository {
  final dio = AppNetwork.get().appDio;

  Future<ForumPosts> getPosts({
    int page = 1,
    int pageSize = 30,
    String sortBy = 'created_at',
    String order = 'desc',
    String? userId,
    String? categoryId,
    String? parentId,
  }) async {
    final queryParameters = {
      'page': page,
      'page_size': pageSize,
      'sort_by': sortBy,
      'order': order,
      if (userId != null) 'user_id': userId,
      if (categoryId != null) 'category_id': categoryId,
      if (parentId != null) "parent_id": parentId
    };

    final response = await dio.get(
      '/forum/get_posts',
      queryParameters: queryParameters,
    );
    final postsResp = ForumPosts.fromJson(response.data);
    print(postsResp.data.first.text);
    return postsResp
      ..data = postsResp.data
          .map((e) => e
        ..images =
        e.images.map((e) => "http://jzhangluo.com:9000$e").toList())
          .toList();
  }

  // Future<CommonResponse> like(String postId) async {
  //   final response = await dio.put("forum/post/${postId}/like");
  //   return CommonResponse.fromJson(response.data);
  // }
  //
  // Future<CommonResponse> unlike(String postId) async {
  //   final response = await dio.delete("forum/post/${postId}/unlike");
  //   return CommonResponse.fromJson(response.data);
  // }
  //
  // Future<CommonResponse> view(String postId) async {
  //   final response = await dio.put("forum/post/${postId}/view");
  //   return CommonResponse.fromJson(response.data);
  // }

  ForumRepository._create();

  static ForumRepository? _instance;

  factory ForumRepository.get() => _instance ??= ForumRepository._create();

}