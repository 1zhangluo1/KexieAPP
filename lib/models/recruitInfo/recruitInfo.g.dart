// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recruitInfo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecruitInfo _$RecruitInfoFromJson(Map<String, dynamic> json) => RecruitInfo(
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      studentId: json['student_id'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      learnDirection: json['learn_direction'] as String? ?? '',
      isManger: json['is_manger'] as bool? ?? false,
      introduction: json['introduction'] as String? ?? '',
      reasonToSign: json['reason_to_sign'] as String? ?? '',
      impression: json['impression'] as String? ?? '',
    );

Map<String, dynamic> _$RecruitInfoToJson(RecruitInfo instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'student_id': instance.studentId,
      'phone': instance.phone,
      'learn_direction': instance.learnDirection,
      'is_manger': instance.isManger,
      'introduction': instance.introduction,
      'reason_to_sign': instance.reasonToSign,
      'impression': instance.impression,
    };
