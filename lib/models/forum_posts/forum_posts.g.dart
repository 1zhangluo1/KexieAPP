// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forum_posts.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ForumPosts _$ForumPostsFromJson(Map<String, dynamic> json) => ForumPosts(
      code: (json['code'] as num?)?.toInt() ?? 0,
      result: json['result'] as bool? ?? false,
      msg: json['msg'] as String? ?? '',
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => Post.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$ForumPostsToJson(ForumPosts instance) =>
    <String, dynamic>{
      'code': instance.code,
      'result': instance.result,
      'msg': instance.msg,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => UserProfile(
      iD: (json['ID'] as num?)?.toInt() ?? 0,
      createdAt: json['CreatedAt'] as String? ?? '',
      updatedAt: json['UpdatedAt'] as String? ?? '',
      deletedAt: json['DeletedAt'],
      name: json['name'] as String? ?? '',
      avatar: json['avatar'] as String? ?? '',
      email: json['email'] as String? ?? '',
      studentId: json['student_id'] as String? ?? '',
      department: json['department'] as String? ?? '',
      learnDirection: json['learn_direction'] as String? ?? '',
      location: json['location'] as String? ?? '',
      grade: json['grade'] as String? ?? '',
      permission: (json['permission'] as num?)?.toInt() ?? 0,
      posts: json['Posts'],
      books: json['Books'],
    );

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'ID': instance.iD,
      'CreatedAt': instance.createdAt,
      'UpdatedAt': instance.updatedAt,
      'DeletedAt': instance.deletedAt,
      'name': instance.name,
      'avatar': instance.avatar,
      'email': instance.email,
      'student_id': instance.studentId,
      'department': instance.department,
      'learn_direction': instance.learnDirection,
      'location': instance.location,
      'grade': instance.grade,
      'permission': instance.permission,
      'Posts': instance.posts,
      'Books': instance.books,
    };

Post _$PostFromJson(Map<String, dynamic> json) => Post(
      iD: (json['ID'] as num?)?.toInt() ?? 0,
      createdAt: json['CreatedAt'] as String? ?? '',
      updatedAt: json['UpdatedAt'] as String? ?? '',
      deletedAt: json['DeletedAt'],
      text: json['text'] as String? ?? '',
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      videos: json['videos'],
      userId: (json['user_id'] as num?)?.toInt() ?? 0,
      userProfile: json['user_profile'] == null
          ? UserProfile.emptyInstance()
          : UserProfile.fromJson(json['user_profile'] as Map<String, dynamic>),
      parentId: json['parent_id'],
      tag: json['tag'] as String? ?? '',
      likesCount: (json['likes_count'] as num?)?.toInt() ?? 0,
      isLiked: json['is_liked'] as bool? ?? false,
      likeUsers: json['LikeUsers'] as List<dynamic>? ?? [],
      watchCount: (json['watch_count'] as num?)?.toInt() ?? 0,
      repliesCount: (json['replies_count'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$PostToJson(Post instance) => <String, dynamic>{
      'ID': instance.iD,
      'CreatedAt': instance.createdAt,
      'UpdatedAt': instance.updatedAt,
      'DeletedAt': instance.deletedAt,
      'text': instance.text,
      'images': instance.images,
      'videos': instance.videos,
      'user_id': instance.userId,
      'user_profile': instance.userProfile.toJson(),
      'parent_id': instance.parentId,
      'tag': instance.tag,
      'likes_count': instance.likesCount,
      'is_liked': instance.isLiked,
      'LikeUsers': instance.likeUsers,
      'watch_count': instance.watchCount,
      'replies_count': instance.repliesCount,
    };
