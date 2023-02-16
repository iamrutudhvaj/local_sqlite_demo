import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:local_sqlite_demo/app/data/sqflite_service.dart';

class HomeController extends GetxController {
  @override
  void onInit() {
    dbOperations();
    super.onInit();
  }

  Future<void> dbOperations() async {
    try {
      await DatabaseService.insertRawInDB();
      await DatabaseService.updateRawOfDB();
      await DatabaseService.fetchRawsFromDB();
    } catch (e) {
      debugPrint(e.toString());
    } finally {
      await DatabaseService.closeDB();
    }
  }
}
