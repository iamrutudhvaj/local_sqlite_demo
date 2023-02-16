import 'package:get/get.dart';

import '../controllers/all_books_page_controller.dart';

class AllBooksPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.put<AllBooksPageController>(AllBooksPageController());
  }
}
