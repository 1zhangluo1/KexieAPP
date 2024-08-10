import 'package:json_annotation/json_annotation.dart';

part 'signRecords.g.dart';

@JsonSerializable(explicitToJson: true)
class SignRecords {

  SignRecords(
      {required this.data,
      required this.code,
      required this.msg});

  @JsonKey(name: "data", defaultValue: [])
  List<Data> data;

  @JsonKey(name: "code", defaultValue: 0)
  int code;

  @JsonKey(name: "msg", defaultValue: "")
  String msg;


  factory SignRecords.fromJson(Map<String, dynamic> json) => _$SignRecordsFromJson(json);
  
  Map<String, dynamic> toJson() => _$SignRecordsToJson(this);
  
  factory SignRecords.emptyInstance() => SignRecords(data: [], code: 0, msg: "");
}

@JsonSerializable(explicitToJson: true)
class Data {

  Data(
      {required this.userId,
      required this.userName,
      required this.userDept,
      required this.userLocation,
      required this.start,
      required this.end,
      required this.status,
      required this.accumulatedTime});

  @JsonKey(name: "userId", defaultValue: 0)
  int userId;

  @JsonKey(name: "userName", defaultValue: "")
  String userName;

  @JsonKey(name: "userDept", defaultValue: "")
  String userDept;

  @JsonKey(name: "userLocation", defaultValue: "")
  String userLocation;

  @JsonKey(name: "start", defaultValue: "")
  String start;

  @JsonKey(name: "end", defaultValue: "")
  String end;

  @JsonKey(name: "status", defaultValue: "")
  String status;

  @JsonKey(name: "accumulatedTime", defaultValue: "")
  dynamic accumulatedTime;


  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  
  Map<String, dynamic> toJson() => _$DataToJson(this);
  
  factory Data.emptyInstance() => Data(userId: 0, userName: "", userDept: "", userLocation: "", start: "", end: "", status: "", accumulatedTime: "");
}


