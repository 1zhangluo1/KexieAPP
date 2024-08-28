import 'package:json_annotation/json_annotation.dart';

part 'book_infomation.g.dart';

@JsonSerializable(explicitToJson: true)
class BookInfomation {

  BookInfomation(
      {required this.code,
      required this.result,
      required this.msg,
      required this.data});

  @JsonKey(name: "code", defaultValue: 0)
  int code;

  @JsonKey(name: "result", defaultValue: false)
  bool result;

  @JsonKey(name: "msg", defaultValue: "")
  String msg;

  @JsonKey(name: "data", defaultValue: [])
  List<Data> data;


  factory BookInfomation.fromJson(Map<String, dynamic> json) => _$BookInfomationFromJson(json);
  
  Map<String, dynamic> toJson() => _$BookInfomationToJson(this);
  
  factory BookInfomation.emptyInstance() => BookInfomation(code: 0, result: false, msg: "", data: []);
}

@JsonSerializable(explicitToJson: true)
class Data {

  Data(
      {required this.iD,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt,
      required this.name,
      required this.isbn,
      required this.count,
      required this.area,
      required this.coverImageUrl,
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

  @JsonKey(name: "count", defaultValue: 0)
  int count;

  @JsonKey(name: "area", defaultValue: "")
  String area;

  @JsonKey(name: "cover_image_url", defaultValue: [])
  List<String> coverImageUrl;

  @JsonKey(name: "author", defaultValue: "")
  String author;

  @JsonKey(name: "publisher", defaultValue: "")
  String publisher;

  @JsonKey(name: "Borrowers")
  dynamic borrowers;

  @JsonKey(name: "BorrowRecords")
  dynamic borrowRecords;


  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  
  Map<String, dynamic> toJson() => _$DataToJson(this);
  
  factory Data.emptyInstance() => Data(iD: 0, createdAt: "", updatedAt: "", name: "", isbn: "", count: 0, area: "", coverImageUrl: [], author: "", publisher: "");
}


