import 'package:json_annotation/json_annotation.dart';

part 'recruitInfo.g.dart';

@JsonSerializable(explicitToJson: true)
class RecruitInfo {

  RecruitInfo(
      {required this.name,
      required this.email,
      required this.studentId,
      required this.phone,
      required this.learnDirection,
      required this.isManger,
      required this.introduction,
      required this.reasonToSign,
      required this.impression});

  @JsonKey(name: "name", defaultValue: "")
  String name;

  @JsonKey(name: "email", defaultValue: "")
  String email;

  @JsonKey(name: "student_id", defaultValue: "")
  String studentId;

  @JsonKey(name: "phone", defaultValue: "")
  String phone;

  @JsonKey(name: "learn_direction", defaultValue: "")
  String learnDirection;

  @JsonKey(name: "is_manger", defaultValue: false)
  bool isManger;

  @JsonKey(name: "introduction", defaultValue: "")
  String introduction;

  @JsonKey(name: "reason_to_sign", defaultValue: "")
  String reasonToSign;

  @JsonKey(name: "impression", defaultValue: "")
  String impression;


  factory RecruitInfo.fromJson(Map<String, dynamic> json) => _$RecruitInfoFromJson(json);
  
  Map<String, dynamic> toJson() => _$RecruitInfoToJson(this);
  
  factory RecruitInfo.emptyInstance() => RecruitInfo(name: "", email: "", studentId: "", phone: "", learnDirection: "", isManger: false, introduction: "", reasonToSign: "", impression: "");
}


