import 'package:get/route_manager.dart';
import 'package:wetv/app/routes/AppRoutes.dart';
import 'package:wetv/app/modules/home/HomeScreen.dart';
import 'package:wetv/app/modules/home/HomeBinding.dart';

class AppPages {
  static const INITIAL = AppRoutes.HOME;

  static void register() {
    Get.clearRouteTree();
    Get.addPages(routes);
  }

  static final routes = [
    GetPage(name: AppRoutes.HOME, page: () => HomeScreen(), binding: HomeBinding())
  ];
}