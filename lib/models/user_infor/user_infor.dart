import 'package:json_annotation/json_annotation.dart';

part 'user_infor.g.dart';

@JsonSerializable(explicitToJson: true)
class UserInfor {

  UserInfor(
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
      this.posts});

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

  @JsonKey(name: "Posts")
  dynamic posts;


  factory UserInfor.fromJson(Map<String, dynamic> json) => _$UserInforFromJson(json);
  
  Map<String, dynamic> toJson() => _$UserInforToJson(this);
  
  factory UserInfor.emptyInstance() => UserInfor(iD: 0, createdAt: "", updatedAt: "", name: "", avatar: "", email: "", studentId: "", department: "", learnDirection: "", location: "", grade: "");
}


