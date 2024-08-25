import 'package:json_annotation/json_annotation.dart';

part 'kexie_members.g.dart';

@JsonSerializable(explicitToJson: true)
class KexieMembers {

  KexieMembers(
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
  List<Data> data;


  factory KexieMembers.fromJson(Map<String, dynamic> json) => _$KexieMembersFromJson(json);
  
  Map<String, dynamic> toJson() => _$KexieMembersToJson(this);
  
  factory KexieMembers.emptyInstance() => KexieMembers(code: 0, result: false, msg: "", data: []);
}

@JsonSerializable(explicitToJson: true)
class Data {

  Data(
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

  @JsonKey(name: "permission", defaultValue: 0)
  int permission;

  @JsonKey(name: "Posts")
  dynamic posts;


  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  
  Map<String, dynamic> toJson() => _$DataToJson(this);
  
  factory Data.emptyInstance() => Data(iD: 0, createdAt: "", updatedAt: "", name: "", avatar: "", email: "", studentId: "", department: "", learnDirection: "", location: "", grade: "", permission: 0);
}


