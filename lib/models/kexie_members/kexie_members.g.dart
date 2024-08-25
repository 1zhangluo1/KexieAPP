// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kexie_members.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KexieMembers _$KexieMembersFromJson(Map<String, dynamic> json) => KexieMembers(
      code: (json['code'] as num?)?.toInt() ?? 0,
      result: json['result'] as bool? ?? false,
      msg: json['msg'] as String? ?? '',
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$KexieMembersToJson(KexieMembers instance) =>
    <String, dynamic>{
      'code': instance.code,
      'result': instance.result,
      'msg': instance.msg,
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
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
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
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
    };
