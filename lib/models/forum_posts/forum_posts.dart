import 'package:json_annotation/json_annotation.dart';

part 'forum_posts.g.dart';

@JsonSerializable(explicitToJson: true)
class ForumPosts {

  ForumPosts(
      {required this.code,
      required this.result,
      required this.msg,
      required this.data});

  @JsonKey(name: "code", defaultValue: 0)
  int code;

  @JsonKey(name: "result", defaultValue: false)
  bool result;

  @JsonKey(name: "msg", defaultValue: "")
  String msg;

  @JsonKey(name: "data", defaultValue: [])
  List<Post> data;


  factory ForumPosts.fromJson(Map<String, dynamic> json) => _$ForumPostsFromJson(json);
  
  Map<String, dynamic> toJson() => _$ForumPostsToJson(this);
  
  factory ForumPosts.emptyInstance() => ForumPosts(code: 0, result: false, msg: "", data: []);
}

@JsonSerializable(explicitToJson: true)
class UserProfile {

  UserProfile(
      {required this.iD,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt,
      required this.name,
      required this.avatar,
      required this.email,
      required this.studentId,
      required this.department,
      required this.learnDirection,
      required this.location,
      required this.grade,
      required this.permission,
      this.posts,
      this.books});

  @JsonKey(name: "ID", defaultValue: 0)
  int iD;

  @JsonKey(name: "CreatedAt", defaultValue: "")
  String createdAt;

  @JsonKey(name: "UpdatedAt", defaultValue: "")
  String updatedAt;

  @JsonKey(name: "DeletedAt")
  dynamic deletedAt;

  @JsonKey(name: "name", defaultValue: "")
  String name;

  @JsonKey(name: "avatar", defaultValue: "")
  String avatar;

  @JsonKey(name: "email", defaultValue: "")
  String email;

  @JsonKey(name: "student_id", defaultValue: "")
  String studentId;

  @JsonKey(name: "department", defaultValue: "")
  String department;

  @JsonKey(name: "learn_direction", defaultValue: "")
  String learnDirection;

  @JsonKey(name: "location", defaultValue: "")
  String location;

  @JsonKey(name: "grade", defaultValue: "")
  String grade;

  @JsonKey(name: "permission", defaultValue: 0)
  int permission;

  @JsonKey(name: "Posts")
  dynamic posts;

  @JsonKey(name: "Books")
  dynamic books;


  factory UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);
  
  Map<String, dynamic> toJson() => _$UserProfileToJson(this);
  
  factory UserProfile.emptyInstance() => UserProfile(iD: 0, createdAt: "", updatedAt: "", name: "", avatar: "", email: "", studentId: "", department: "", learnDirection: "", location: "", grade: "", permission: 0);
}

@JsonSerializable(explicitToJson: true)
class Post {

  Post(
      {required this.iD,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt,
      required this.text,
      required this.images,
      this.videos,
      required this.userId,
      required this.userProfile,
      this.parentId,
      required this.tag,
      required this.likesCount,
      required this.isLiked,
      required this.likeUsers,
      required this.watchCount,
      required this.repliesCount});

  @JsonKey(name: "ID", defaultValue: 0)
  int iD;

  @JsonKey(name: "CreatedAt", defaultValue: "")
  String createdAt;

  @JsonKey(name: "UpdatedAt", defaultValue: "")
  String updatedAt;

  @JsonKey(name: "DeletedAt")
  dynamic deletedAt;

  @JsonKey(name: "text", defaultValue: "")
  String text;

  @JsonKey(name: "images", defaultValue: [])
  List<String> images;

  @JsonKey(name: "videos")
  dynamic videos;

  @JsonKey(name: "user_id", defaultValue: 0)
  int userId;

  @JsonKey(name: "user_profile", defaultValue: UserProfile.emptyInstance)
  UserProfile userProfile;

  @JsonKey(name: "parent_id")
  dynamic parentId;

  @JsonKey(name: "tag", defaultValue: "")
  String tag;

  @JsonKey(name: "likes_count", defaultValue: 0)
  int likesCount;

  @JsonKey(name: "is_liked", defaultValue: false)
  bool isLiked;

  @JsonKey(name: "LikeUsers", defaultValue: [])
  List likeUsers;

  @JsonKey(name: "watch_count", defaultValue: 0)
  int watchCount;

  @JsonKey(name: "replies_count", defaultValue: 0)
  int repliesCount;


  factory Post.fromJson(Map<String, dynamic> json) => _$PostFromJson(json);
  
  Map<String, dynamic> toJson() => _$PostToJson(this);
  
  factory Post.emptyInstance() => Post(iD: 0, createdAt: "", updatedAt: "", text: "", images: [], userId: 0, userProfile: UserProfile.emptyInstance(), tag: "", likesCount: 0, isLiked: false, likeUsers: [], watchCount: 0, repliesCount: 0);
}


