import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:kexie_app/global/global.dart';
import 'package:kexie_app/ui/book_borrow_system/book_borrow_record/book_borrow_record_controller.dart';
import 'package:kexie_app/widgets/error_page.dart';

class BookBorrowRecordPage extends StatefulWidget {
  const BookBorrowRecordPage({super.key});

  @override
  State<BookBorrowRecordPage> createState() => _BookBorrowRecordPageState();
}

class _BookBorrowRecordPageState extends State<BookBorrowRecordPage> {
  final c = Get.put(BookBorrowRecordController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('借阅记录'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: FutureBuilder(
              future: c.getRecords(Global.user.value.studentId),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return ErrorPage.loadDataFailed;
                  } else {
                    return borrowRecordPage();
                  }
                } else {
                  return Center(
                      child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SpinKitWave(
                        color: Theme.of(context).colorScheme.primary,
                        size: 70,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        '加载中',
                        style: TextStyle(fontSize: 20, letterSpacing: 10),
                      )
                    ],
                  ));
                }
              }),
        ),
      ),
    );
  }

  Widget borrowRecordPage() {
    return Column(
      children: [
        Expanded(
          child: Obx(
            () => ListView.builder(
              itemBuilder: (context, index) {
                return Card(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: ListTile(
                      title: Text(
                        c.records[index].book.name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('借阅者: ${c.records[index].borrower.name}'),
                          Text(
                              '借阅时间: ${c.timeToString(c.records[index].borrowedAt)}'),
                          c.records[index].returnedAt.isNotEmpty
                              ? Text(
                                  '归还时间: ${c.timeToString(c.records[index].returnedAt)}')
                              : const Text('正在借阅'),
                        ],
                      ),
                      leading: Icon(
                        Icons.book,
                        color: c.records[index].returnedAt.isEmpty
                            ? Colors.red
                            : Colors.black,
                      ),
                      trailing: Column(
                        children: [
                          c.records[index].returnedAt.isEmpty
                              ? TextButton(
                                  onPressed: () async {
                                    bool result = await c.borrowAndReturn
                                        .returnBook(c.records[index].book.isbn);
                                    if (result) {
                                      c.getRecords(Global.user.value.studentId);
                                    }
                                  },
                                  child: const Text('归还'))
                              : const Icon(Icons.check, color: Colors.green),
                        ],
                      ),
                      contentPadding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 16.0),
                    ));
              },
              itemCount: c.records.length,
            ),
          ),
        )
      ],
    );
  }
}
