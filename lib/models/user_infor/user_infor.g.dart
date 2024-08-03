// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_infor.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfor _$UserInforFromJson(Map<String, dynamic> json) => UserInfor(
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
      posts: json['Posts'],
    );

Map<String, dynamic> _$UserInforToJson(UserInfor instance) => <String, dynamic>{
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
      'Posts': instance.posts,
    };
