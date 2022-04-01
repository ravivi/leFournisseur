import 'package:get/get.dart';

import 'package:lefournisseur/app/modules/productDetail/bindings/productdetail_binding.dart';
import 'package:lefournisseur/app/modules/productdetail/views/productdetail_view.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/login/bindings/login_binding.dart';
import '../modules/login/views/login_view.dart';
import '../modules/productlist/bindings/productlist_binding.dart';
import '../modules/productlist/views/productlist_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.SPLASH,
      page: () => SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCTLIST,
      page: () => ProductListView(),
      binding: ProductlistBinding(),
    ),
    GetPage(
      name: _Paths.LOGIN,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.PROFIL,
      page: () => LoginView(),
      binding: LoginBinding(),
    ),
    GetPage(
      name: _Paths.PRODUCTDETAIL,
      page: () => ProductdetailView(),
      binding: ProductdetailBinding(),
    ),
  ];
}
