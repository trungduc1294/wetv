import 'package:get/instance_manager.dart';
import 'package:wetv/app/modules/home/HomeController.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => Homecontroller());
  }
}