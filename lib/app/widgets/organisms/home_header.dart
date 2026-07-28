import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wetv/app/core/i18n/tr_keys.dart';
import 'package:wetv/app/core/theme/app_color.dart';
import 'package:wetv/app/routes/app_routes.dart';
import 'package:wetv/app/widgets/atoms/app_logo.dart';
import 'package:wetv/app/widgets/atoms/typography_button.dart';
import 'package:wetv/app/widgets/molecules/search_box.dart';

// [VN] Header ở màn hình Home
class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  void _openSearch() => Get.toNamed(AppRoutes.SEARCH);

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        // [VN] Logo của app
        const AppLogo(),

        // [VN] Search box — tap mở màn Search
        Expanded(
          child: SearchBox(
            onTap: _openSearch,
            SearchWidget: TypographyButton(
              text: 'Vườn sao băng',
              onPressed: _openSearch,
              color: AppColors.gray_600,
            ),
            prefixIcon: const Icon(Icons.search, color: AppColors.white_primary),
            suffixActionButton: TypographyButton(
              text: TrKeys.filter.tr,
              onPressed: () {},
              color: AppColors.white_primary,
            ),
          ),
        ),

        // [VN] Nút chiếu màn hình lớn
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.cast),
          color: AppColors.white_primary,
        ),
      ],
    );
  }
}
