import 'package:get/get.dart';

import '../modules/all_books_page/bindings/all_books_page_binding.dart';
import '../modules/all_books_page/views/all_books_page_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.ALL_BOOKS_PAGE,
      page: () => const AllBooksPageView(),
      binding: AllBooksPageBinding(),
    ),
  ];
}
