import 'package:flutter/material.dart';
import 'package:wetv/app/core/theme/AppColors.dart';
import 'package:wetv/app/widgets/atoms/AppLogo.dart';
import 'package:wetv/app/widgets/atoms/CustomVerticalDivider.dart';
import 'package:wetv/app/widgets/atoms/Typography.dart';
import 'package:wetv/app/widgets/atoms/TypographyButton.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8,
      children: [
        // [VN] Logo của app
        AppLogo(),
        // [VN] Search box
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: AppColors.gray_800,
              borderRadius: BorderRadius.all(Radius.circular(100)),
            ),
            padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            child: Row(
              spacing: 6,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.search, color: AppColors.white_primary),
                Expanded(
                  child: TextField(
                    style: TextStyle(color: AppColors.white_primary),
                    decoration: InputDecoration(
                      isDense: true,
                      border: InputBorder.none,
                      hintText: 'Tìm kiếm',
                      hintStyle: TextStyle(color: AppColors.gray_600),
                      contentPadding: EdgeInsets.zero,
                    ),
                  ),
                ),
                CustomVerticalDivider(margin: EdgeInsets.only(right: 4)),
                TypographyButton(
                  text: "Lọc",
                  onPressed: () {},
                  color: AppColors.white_primary,
                ),
              ],
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.cast),
          color: AppColors.white_primary,
        ),
      ],
    );
  }
}
