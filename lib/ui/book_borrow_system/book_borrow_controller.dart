import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:kexie_app/Internet/network.dart';
import 'package:kexie_app/models/book_infomation/book_infomation.dart';
import 'package:kexie_app/widgets/toast.dart';

class BookBorrowController extends GetxController{

  Rx<BookInfomation> bookInformation = BookInfomation(code: 0, result: false, msg: '', data: []).obs;
  final controller = ZoomDrawerController();
  var isColumn = false.obs;
  
  Future getBooks() async {
    try {
      final dio = AppNetwork.get().appDio;
      final response = await dio.get('/book/get_books');
      if (response.statusCode == 200) {
        bookInformation.value = BookInfomation.fromJson(response.data);
        // bookInformation.value.data.forEach((aaa) => print(aaa.name));
        // bookInformation.value.data.forEach((aaa) => aaa.name = 'swift编程实战-uml解析案例实战二十啊啊啊飒飒泡果的屁股');
      } else {
        toastFailure(message: response.data['msg']);
      }
    } on Exception catch (e) {
      toastFailure(message: '获取书籍信息失败',error: e.toString());
    }
  }

  @override
  void onInit() {
    getBooks();
    super.onInit();
  }

}