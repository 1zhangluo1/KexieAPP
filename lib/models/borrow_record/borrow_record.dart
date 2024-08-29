import 'package:json_annotation/json_annotation.dart';

part 'borrow_record.g.dart';

@JsonSerializable(explicitToJson: true)
class BorrowRecord {

  BorrowRecord(
      {required this.code,
      required this.result,
      required this.msg,
      required this.record});

  @JsonKey(name: "code", defaultValue: 0)
  int code;

  @JsonKey(name: "result", defaultValue: false)
  bool result;

  @JsonKey(name: "msg", defaultValue: "")
  String msg;

  @JsonKey(name: "data", defaultValue: [])
  List<Record> record;


  factory BorrowRecord.fromJson(Map<String, dynamic> json) => _$BorrowRecordFromJson(json);
  
  Map<String, dynamic> toJson() => _$BorrowRecordToJson(this);
  
  factory BorrowRecord.emptyInstance() => BorrowRecord(code: 0, result: false, msg: "", record: []);
}

@JsonSerializable(explicitToJson: true)
class Borrower {

  Borrower(
      {required this.iD,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt,
      required this.name,
      required this.avatar,
      required this.email,
      required this.studentId,
      required this.department,
      required this.learnDirection,
      required this.location,
      required this.grade,
      required this.permission,
      this.posts,
      this.books});

  @JsonKey(name: "ID", defaultValue: 0)
  int iD;

  @JsonKey(name: "CreatedAt", defaultValue: "")
  String createdAt;

  @JsonKey(name: "UpdatedAt", defaultValue: "")
  String updatedAt;

  @JsonKey(name: "DeletedAt")
  dynamic deletedAt;

  @JsonKey(name: "name", defaultValue: "")
  String name;

  @JsonKey(name: "avatar", defaultValue: "")
  String avatar;

  @JsonKey(name: "email", defaultValue: "")
  String email;

  @JsonKey(name: "student_id", defaultValue: "")
  String studentId;

  @JsonKey(name: "department", defaultValue: "")
  String department;

  @JsonKey(name: "learn_direction", defaultValue: "")
  String learnDirection;

  @JsonKey(name: "location", defaultValue: "")
  String location;

  @JsonKey(name: "grade", defaultValue: "")
  String grade;

  @JsonKey(name: "permission", defaultValue: 0)
  int permission;

  @JsonKey(name: "Posts")
  dynamic posts;

  @JsonKey(name: "Books")
  dynamic books;


  factory Borrower.fromJson(Map<String, dynamic> json) => _$BorrowerFromJson(json);
  
  Map<String, dynamic> toJson() => _$BorrowerToJson(this);
  
  factory Borrower.emptyInstance() => Borrower(iD: 0, createdAt: "", updatedAt: "", name: "", avatar: "", email: "", studentId: "", department: "", learnDirection: "", location: "", grade: "", permission: 0);
}

@JsonSerializable(explicitToJson: true)
class Book {

  Book(
      {required this.iD,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt,
      required this.name,
      required this.isbn,
      this.count,
      required this.area,
      this.coverImageUrl,
      required this.author,
      required this.publisher,
      this.borrowers,
      this.borrowRecords});

  @JsonKey(name: "ID", defaultValue: 0)
  int iD;

  @JsonKey(name: "CreatedAt", defaultValue: "")
  String createdAt;

  @JsonKey(name: "UpdatedAt", defaultValue: "")
  String updatedAt;

  @JsonKey(name: "DeletedAt")
  dynamic deletedAt;

  @JsonKey(name: "name", defaultValue: "")
  String name;

  @JsonKey(name: "isbn", defaultValue: "")
  String isbn;

  @JsonKey(name: "count")
  dynamic count;

  @JsonKey(name: "area", defaultValue: "")
  String area;

  @JsonKey(name: "cover_image_url")
  dynamic coverImageUrl;

  @JsonKey(name: "author", defaultValue: "")
  String author;

  @JsonKey(name: "publisher", defaultValue: "")
  String publisher;

  @JsonKey(name: "Borrowers")
  dynamic borrowers;

  @JsonKey(name: "BorrowRecords")
  dynamic borrowRecords;


  factory Book.fromJson(Map<String, dynamic> json) => _$BookFromJson(json);
  
  Map<String, dynamic> toJson() => _$BookToJson(this);
  
  factory Book.emptyInstance() => Book(iD: 0, createdAt: "", updatedAt: "", name: "", isbn: "", area: "", author: "", publisher: "");
}

@JsonSerializable(explicitToJson: true)
class Record {

  Record(
      {required this.iD,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt,
      required this.userId,
      required this.bookId,
      required this.planBorrowTime,
      required this.borrowedAt,
      required this.returnedAt,
      required this.status,
      required this.borrower,
      required this.book});

  @JsonKey(name: "ID", defaultValue: 0)
  int iD;

  @JsonKey(name: "CreatedAt", defaultValue: "")
  String createdAt;

  @JsonKey(name: "UpdatedAt", defaultValue: "")
  String updatedAt;

  @JsonKey(name: "DeletedAt")
  dynamic deletedAt;

  @JsonKey(name: "user_id", defaultValue: 0)
  int userId;

  @JsonKey(name: "book_id", defaultValue: 0)
  int bookId;

  @JsonKey(name: "plan_borrow_time", defaultValue: "")
  String planBorrowTime;

  @JsonKey(name: "borrowed_at", defaultValue: "")
  String borrowedAt;

  @JsonKey(name: "returned_at", defaultValue: "")
  String returnedAt;

  @JsonKey(name: "status", defaultValue: false)
  bool status;

  @JsonKey(name: "borrower", defaultValue: Borrower.emptyInstance)
  Borrower borrower;

  @JsonKey(name: "book", defaultValue: Book.emptyInstance)
  Book book;


  factory Record.fromJson(Map<String, dynamic> json) => _$RecordFromJson(json);
  
  Map<String, dynamic> toJson() => _$RecordToJson(this);
  
  factory Record.emptyInstance() => Record(iD: 0, createdAt: "", updatedAt: "", userId: 0, bookId: 0, planBorrowTime: "", borrowedAt: "", returnedAt: "", status: false, borrower: Borrower.emptyInstance(), book: Book.emptyInstance());
}


