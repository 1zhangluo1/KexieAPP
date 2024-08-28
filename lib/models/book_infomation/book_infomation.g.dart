// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_infomation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookInfomation _$BookInfomationFromJson(Map<String, dynamic> json) =>
    BookInfomation(
      code: (json['code'] as num?)?.toInt() ?? 0,
      result: json['result'] as bool? ?? false,
      msg: json['msg'] as String? ?? '',
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => Data.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$BookInfomationToJson(BookInfomation instance) =>
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
      isbn: json['isbn'] as String? ?? '',
      count: (json['count'] as num?)?.toInt() ?? 0,
      area: json['area'] as String? ?? '',
      coverImageUrl: (json['cover_image_url'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      author: json['author'] as String? ?? '',
      publisher: json['publisher'] as String? ?? '',
      borrowers: json['Borrowers'],
      borrowRecords: json['BorrowRecords'],
    );

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'ID': instance.iD,
      'CreatedAt': instance.createdAt,
      'UpdatedAt': instance.updatedAt,
      'DeletedAt': instance.deletedAt,
      'name': instance.name,
      'isbn': instance.isbn,
      'count': instance.count,
      'area': instance.area,
      'cover_image_url': instance.coverImageUrl,
      'author': instance.author,
      'publisher': instance.publisher,
      'Borrowers': instance.borrowers,
      'BorrowRecords': instance.borrowRecords,
    };
