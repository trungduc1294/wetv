import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wetv/app/core/i18n/tr_keys.dart';
import 'package:wetv/app/core/theme/app_color.dart';
import 'package:wetv/app/data/models/movie_model.dart';
import 'package:wetv/app/modules/account/account_controller.dart';
import 'package:wetv/app/routes/app_routes.dart';
import 'package:wetv/app/widgets/molecules/category_heading.dart';
import 'package:wetv/app/widgets/molecules/setting_item.dart';
import 'package:wetv/app/widgets/organisms/account_header.dart';
import 'package:wetv/app/widgets/organisms/movie_horizontal_card_list.dart';
import 'package:wetv/app/widgets/organisms/profile_card.dart';

// [VN] Màn hình Tài khoản
class AccountView extends GetView<AccountController> {
  AccountView({super.key}) {
    // [VN] Đảm bảo controller tồn tại khi mở tab từ Home
    Get.put(AccountController());
  }

  // [VN] Dữ liệu mẫu lịch sử xem
  static final _historyMovies = [
    MovieModel(
      id: '1',
      posterUrl:
          'https://vcover-vt-pic.wetvinfo.com/vcover_vt_pic/0/cuawe92xrqw8ll61730713408215_09TXvl25/350',
      movieName: 'EP01: Cẩm Nguyệt Như Ca',
    ),
    MovieModel(
      id: '2',
      posterUrl:
          'https://vcover-vt-pic.wetvinfo.com/vcover_vt_pic/0/cuawe92xrqw8ll61730713408215_09TXvl25/350',
      movieName: 'EP02: Cẩm Nguyệt Như Ca',
    ),
    MovieModel(
      id: '3',
      posterUrl:
          'https://vcover-vt-pic.wetvinfo.com/vcover_vt_pic/0/cuawe92xrqw8ll61730713408215_09TXvl25/350',
      movieName: 'EP03: Cẩm Nguyệt Như Ca',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    // [VN] Obx để rebuild toàn màn khi đổi locale
    return Obx(() {
      controller.localeCode.value;
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // [VN] Header: QR + thông báo
            AccountHeader(
              onQrTap: () {},
              onNotificationTap: () {},
            ),

            // [VN] Card thông tin người dùng
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: ProfileCard(
                userName: controller.userName.value,
                avatarUrl: controller.avatarUrl.value,
                onVipCardTap: () => Get.toNamed(AppRoutes.VIP_GIFT),
                onCoinsTap: () => Get.toNamed(AppRoutes.COINS),
                onAssetsTap: () {},
              ),
            ),

            const SizedBox(height: 20),

            // [VN] Section lịch sử xem
            Padding(
              padding: const EdgeInsets.only(left: 8),
              child: CategoryHeading(
                title: TrKeys.history.tr,
                icon: Icons.chevron_right,
                onTap: () {},
              ),
            ),
            MovieHorizontalCardList(
              movies: _historyMovies,
              height: 160,
              onMovieTap: (_) {},
            ),

            const SizedBox(height: 8),

            // [VN] Nhóm setting 1
            SettingItem(
              title: TrKeys.download.tr,
              onTap: () {},
            ),
            SettingItem(
              title: TrKeys.watchlistReserve.tr,
              onTap: () {},
            ),

            // [VN] Divider tách nhóm setting
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Divider(
                color: AppColors.gray_800,
                thickness: 4,
                height: 4,
              ),
            ),

            // [VN] Nhóm setting 2
            SettingItem(
              title: TrKeys.downloadTvApp.tr,
              onTap: () {},
            ),
            SettingItem(
              title: TrKeys.helpFeedback.tr,
              onTap: () {},
            ),
            SettingItem(
              title: TrKeys.language.tr,
              trailingText: controller.currentLanguageLabel,
              onTap: controller.openLanguagePicker,
            ),
            SettingItem(
              title: TrKeys.settings.tr,
              onTap: () {},
            ),

            const SizedBox(height: 24),
          ],
        ),
      );
    });
  }
}
