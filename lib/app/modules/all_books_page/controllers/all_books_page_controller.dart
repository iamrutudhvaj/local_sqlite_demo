import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:local_sqlite_demo/app/data/sqflite_service.dart';

import '../../../data/model/book_model.dart';

class AllBooksPageController extends GetxController {
  final _bookList = <Book>[].obs;
  List<Book> get bookList => _bookList;
  set bookList(List<Book> value) => _bookList.value = value;

  @override
  void onReady() {
    fetchData();
    super.onReady();
  }

  Future<void> fetchData() async {
    try {
      Get.dialog(
        const Center(
          child: CupertinoActivityIndicator(),
        ),
        barrierDismissible: false,
      );
      bookList = await DatabaseService.fetchBooks();
      print(bookList.map((e) => e.toJson()));
      Get.back();
    } catch (e) {
      Get.back();
      print(e);
    }
  }
}
