import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/all_books_page_controller.dart';

class AllBooksPageView extends GetView<AllBooksPageController> {
  const AllBooksPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AllBooksPageView'),
        centerTitle: true,
      ),
      body: Obx(() => ListView.separated(
          itemBuilder: (context, index) {
            var book = controller.bookList[index];
            return ListTile(
              title: Text(book.name ?? '-'),
              subtitle: Text(book.author ?? '-'),
            );
          },
          separatorBuilder: (context, index) => const SizedBox(
                height: 8,
              ),
          itemCount: controller.bookList.length)),
    );
  }
}
