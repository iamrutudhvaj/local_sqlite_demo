import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:local_sqlite_demo/app/data/model/book_model.dart';
import 'package:local_sqlite_demo/app/data/sqflite_service.dart';

class HomeController extends GetxController {
  TextEditingController bookNameController = TextEditingController();
  TextEditingController bookAuthorController = TextEditingController();

  Future<void> addBook() async {
    try {
      Get.dialog(
        const Center(
          child: CupertinoActivityIndicator(),
        ),
        barrierDismissible: false,
      );
      await DatabaseService.insertBook(Book(
        name: bookNameController.text,
        author: bookAuthorController.text,
      ));
      bookAuthorController.clear();
      bookNameController.clear();
      Get.back();
    } catch (e) {
      Get.back();
      debugPrint(e.toString());
    }
  }
}
