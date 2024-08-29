// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'borrow_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BorrowRecord _$BorrowRecordFromJson(Map<String, dynamic> json) => BorrowRecord(
      code: (json['code'] as num?)?.toInt() ?? 0,
      result: json['result'] as bool? ?? false,
      msg: json['msg'] as String? ?? '',
      record: (json['data'] as List<dynamic>?)
              ?.map((e) => Record.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$BorrowRecordToJson(BorrowRecord instance) =>
    <String, dynamic>{
      'code': instance.code,
      'result': instance.result,
      'msg': instance.msg,
      'data': instance.record.map((e) => e.toJson()).toList(),
    };

Borrower _$BorrowerFromJson(Map<String, dynamic> json) => Borrower(
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
      books: json['Books'],
    );

Map<String, dynamic> _$BorrowerToJson(Borrower instance) => <String, dynamic>{
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
      'Books': instance.books,
    };

Book _$BookFromJson(Map<String, dynamic> json) => Book(
      iD: (json['ID'] as num?)?.toInt() ?? 0,
      createdAt: json['CreatedAt'] as String? ?? '',
      updatedAt: json['UpdatedAt'] as String? ?? '',
      deletedAt: json['DeletedAt'],
      name: json['name'] as String? ?? '',
      isbn: json['isbn'] as String? ?? '',
      count: json['count'],
      area: json['area'] as String? ?? '',
      coverImageUrl: json['cover_image_url'],
      author: json['author'] as String? ?? '',
      publisher: json['publisher'] as String? ?? '',
      borrowers: json['Borrowers'],
      borrowRecords: json['BorrowRecords'],
    );

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
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

Record _$RecordFromJson(Map<String, dynamic> json) => Record(
      iD: (json['ID'] as num?)?.toInt() ?? 0,
      createdAt: json['CreatedAt'] as String? ?? '',
      updatedAt: json['UpdatedAt'] as String? ?? '',
      deletedAt: json['DeletedAt'],
      userId: (json['user_id'] as num?)?.toInt() ?? 0,
      bookId: (json['book_id'] as num?)?.toInt() ?? 0,
      planBorrowTime: json['plan_borrow_time'] as String? ?? '',
      borrowedAt: json['borrowed_at'] as String? ?? '',
      returnedAt: json['returned_at'] as String? ?? '',
      status: json['status'] as bool? ?? false,
      borrower: json['borrower'] == null
          ? Borrower.emptyInstance()
          : Borrower.fromJson(json['borrower'] as Map<String, dynamic>),
      book: json['book'] == null
          ? Book.emptyInstance()
          : Book.fromJson(json['book'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RecordToJson(Record instance) => <String, dynamic>{
      'ID': instance.iD,
      'CreatedAt': instance.createdAt,
      'UpdatedAt': instance.updatedAt,
      'DeletedAt': instance.deletedAt,
      'user_id': instance.userId,
      'book_id': instance.bookId,
      'plan_borrow_time': instance.planBorrowTime,
      'borrowed_at': instance.borrowedAt,
      'returned_at': instance.returnedAt,
      'status': instance.status,
      'borrower': instance.borrower.toJson(),
      'book': instance.book.toJson(),
    };
