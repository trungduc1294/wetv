import 'package:get/get.dart';

// [VN] Controller màn Tài khoản
class AccountController extends GetxController {
  // [VN] Tên người dùng hiển thị trên ProfileCard
  final userName = 'Rolling Hunters'.obs;

  // [VN] URL avatar; để trống thì hiện icon mặc định
  final avatarUrl = ''.obs;
}
