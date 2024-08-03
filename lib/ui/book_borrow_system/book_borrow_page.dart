import 'package:flutter/material.dart';

class BookBorrowPage extends StatefulWidget {
  const BookBorrowPage({super.key});

  @override
  State<BookBorrowPage> createState() => _BookBorrowPageState();
}

class _BookBorrowPageState extends State<BookBorrowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('图书借阅',style: TextStyle(color: Theme.of(context).colorScheme.onSurface),),
      ),
    );
  }
}
