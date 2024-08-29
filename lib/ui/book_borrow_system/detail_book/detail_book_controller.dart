import 'package:get/get.dart';
import 'package:kexie_app/ui/book_borrow_system/borrow_and_return/borrow_and_return.dart';

class DetailBookController extends GetxController{
  var planTime = '1天'.obs;
  BorrowAndReturn borrowAndReturn = BorrowAndReturn();
}