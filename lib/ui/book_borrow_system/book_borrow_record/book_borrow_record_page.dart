import 'package:flutter/material.dart';

class BookBorrowRecordPage extends StatefulWidget {
  const BookBorrowRecordPage({super.key});

  @override
  State<BookBorrowRecordPage> createState() => _BookBorrowRecordPageState();
}

class _BookBorrowRecordPageState extends State<BookBorrowRecordPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('借阅记录'),
      ),
    );
  }
}
