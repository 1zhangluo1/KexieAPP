import 'package:json_annotation/json_annotation.dart';

part 'topFiveUsers.g.dart';

@JsonSerializable(explicitToJson: true)
class TopFiveUsers {
  TopFiveUsers({required this.data, required this.code, required this.msg});

  @JsonKey(name: "data", defaultValue: [])
  List<Data> data;

  @JsonKey(name: "code", defaultValue: 0)
  int code;

  @JsonKey(name: "msg", defaultValue: "")
  String msg;

  factory TopFiveUsers.fromJson(Map<String, dynamic> json) =>
      _$TopFiveUsersFromJson(json);

  Map<String, dynamic> toJson() => _$TopFiveUsersToJson(this);

  factory TopFiveUsers.emptyInstance() =>
      TopFiveUsers(data: [], code: 0, msg: "");
}

@JsonSerializable(explicitToJson: true)
class Data {
  Data({
    required this.userId,
    required this.userName,
    required this.userDept,
    required this.userLocation,
    required this.totalTime,
    required this.week,
    this.order,
  });

  @JsonKey(name: "userId", defaultValue: 0)
  int userId;

  @JsonKey(name: "userName", defaultValue: "")
  String userName;

  @JsonKey(name: "userDept", defaultValue: "")
  String userDept;

  @JsonKey(name: "userLocation", defaultValue: "")
  String userLocation;

  @JsonKey(name: "totalTime", defaultValue: "")
  String totalTime;

  @JsonKey(name: "week", defaultValue: 0)
  int week;

  int? order;

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toJson() => _$DataToJson(this);

  factory Data.emptyInstance() => Data(
      userId: 0,
      userName: "",
      userDept: "",
      userLocation: "",
      totalTime: "",
      week: 0);
}
