import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:local_sqlite_demo/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Insert Book'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(Routes.ALL_BOOKS_PAGE);
          },
          child: const Icon(Icons.library_books)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: controller.bookNameController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Book Name"),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              controller: controller.bookAuthorController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Book Author"),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            FilledButton.tonal(
                onPressed: controller.addBook, child: const Text("Submit")),
          ],
        ),
      ),
    );
  }
}
