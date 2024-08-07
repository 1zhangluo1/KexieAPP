// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'onlineUsers.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OnlineUsers _$OnlineUsersFromJson(Map<String, dynamic> json) => OnlineUsers(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      code: (json['code'] as num?)?.toInt() ?? 0,
      msg: json['msg'] as String? ?? '',
    );

Map<String, dynamic> _$OnlineUsersToJson(OnlineUsers instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
      'code': instance.code,
      'msg': instance.msg,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      userId: (json['userId'] as num?)?.toInt() ?? 0,
      userName: json['userName'] as String? ?? '',
      userDept: json['userDept'] as String? ?? '',
      userLocation: json['userLocation'] as String? ?? '',
      status: (json['status'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'userId': instance.userId,
      'userName': instance.userName,
      'userDept': instance.userDept,
      'userLocation': instance.userLocation,
      'status': instance.status,
    };
