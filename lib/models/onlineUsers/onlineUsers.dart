import 'package:json_annotation/json_annotation.dart';

part 'onlineUsers.g.dart';

@JsonSerializable(explicitToJson: true)
class OnlineUsers {

  OnlineUsers(
      {required this.data,
      required this.code,
      required this.msg});

  @JsonKey(name: "data", defaultValue: [])
  List<Data> data;

  @JsonKey(name: "code", defaultValue: 0)
  int code;

  @JsonKey(name: "msg", defaultValue: "")
  String msg;


  factory OnlineUsers.fromJson(Map<String, dynamic> json) => _$OnlineUsersFromJson(json);
  
  Map<String, dynamic> toJson() => _$OnlineUsersToJson(this);
  
  factory OnlineUsers.emptyInstance() => OnlineUsers(data: [], code: 0, msg: "");
}

@JsonSerializable(explicitToJson: true)
class Data {

  Data(
      {required this.userId,
      required this.userName,
      required this.userDept,
      required this.userLocation,
      required this.status});

  @JsonKey(name: "userId", defaultValue: 0)
  int userId;

  @JsonKey(name: "userName", defaultValue: "")
  String userName;

  @JsonKey(name: "userDept", defaultValue: "")
  String userDept;

  @JsonKey(name: "userLocation", defaultValue: "")
  String userLocation;

  @JsonKey(name: "status", defaultValue: 0)
  int status;


  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  
  Map<String, dynamic> toJson() => _$DataToJson(this);
  
  factory Data.emptyInstance() => Data(userId: 0, userName: "", userDept: "", userLocation: "", status: 0);
}


