import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wetv/app/core/i18n/tr_keys.dart';
import 'package:wetv/app/core/theme/app_color.dart';

// [VN] Controller màn Tài khoản
class AccountController extends GetxController {
  // [VN] Tên người dùng hiển thị trên ProfileCard
  final userName = 'Rolling Hunters'.obs;

  // [VN] URL avatar; để trống thì hiện icon mặc định
  final avatarUrl = ''.obs;

  // [VN] Theo dõi locale để UI rebuild khi đổi ngôn ngữ
  final localeCode = 'vi'.obs;

  @override
  void onInit() {
    super.onInit();
    localeCode.value = Get.locale?.languageCode ?? 'vi';
  }

  // [VN] Label ngôn ngữ đang chọn
  String get currentLanguageLabel {
    return localeCode.value == 'en' ? TrKeys.langEn.tr : TrKeys.langVi.tr;
  }

  // [VN] Mở bottom sheet chọn ngôn ngữ
  void openLanguagePicker() {
    Get.bottomSheet(
      const _LanguagePickerSheet(),
      backgroundColor: AppColors.primary,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(12)),
      ),
    );
  }

  // [VN] Đổi locale app
  void changeLanguage(Locale locale) {
    localeCode.value = locale.languageCode;
    Get.updateLocale(locale);
    if (Get.isBottomSheetOpen ?? false) {
      Get.back();
    }
  }
}

// [VN] Bottom sheet chọn ngôn ngữ vi / en
class _LanguagePickerSheet extends StatelessWidget {
  const _LanguagePickerSheet();

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<AccountController>();

    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 12, 16, 24),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 36,
                height: 4,
                decoration: BoxDecoration(
                  color: AppColors.gray_700,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              TrKeys.language.tr,
              style: const TextStyle(
                color: AppColors.white_primary,
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            Obx(() {
              final code = controller.localeCode.value;
              return Column(
                children: [
                  _LanguageOption(
                    label: TrKeys.langVi.tr,
                    selected: code == 'vi',
                    onTap: () => controller.changeLanguage(
                      const Locale('vi', 'VN'),
                    ),
                  ),
                  _LanguageOption(
                    label: TrKeys.langEn.tr,
                    selected: code == 'en',
                    onTap: () => controller.changeLanguage(
                      const Locale('en', 'US'),
                    ),
                  ),
                ],
              );
            }),
          ],
        ),
      ),
    );
  }
}

class _LanguageOption extends StatelessWidget {
  const _LanguageOption({
    required this.label,
    required this.selected,
    required this.onTap,
  });

  final String label;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      behavior: HitTestBehavior.opaque,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 14),
        child: Row(
          children: [
            Expanded(
              child: Text(
                label,
                style: const TextStyle(
                  color: AppColors.white_primary,
                  fontSize: 15,
                ),
              ),
            ),
            Icon(
              selected
                  ? Icons.radio_button_checked
                  : Icons.radio_button_off,
              color: selected
                  ? AppColors.orange_primary
                  : AppColors.gray_600,
              size: 22,
            ),
          ],
        ),
      ),
    );
  }
}
