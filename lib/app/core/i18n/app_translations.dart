import 'package:get/get.dart';
import 'package:wetv/app/core/i18n/langs/en_us.dart';
import 'package:wetv/app/core/i18n/langs/vi_vn.dart';

// [VN] Đăng ký bản dịch đa ngôn ngữ cho GetX
class AppTranslations extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'vi_VN': viVn,
        'en_US': enUs,
      };
}
