import 'package:flutter/material.dart';
import 'package:wetv/app/core/theme/AppColors.dart';
import 'package:wetv/app/widgets/atoms/AppLogo.dart';
import 'package:wetv/app/widgets/atoms/TypographyButton.dart';
import 'package:wetv/app/widgets/molecules/SearchBox.dart';

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
          child: SearchBox(
            SearchWidget: TypographyButton(
              text: 'Vườn sao băng',
              onPressed: () {},
              color: AppColors.gray_600,
            ),
            prefixIcon: Icon(Icons.search, color: AppColors.white_primary),
            suffixActionButton: TypographyButton(
              text: "Lọc",
              onPressed: () {},
              color: AppColors.white_primary,
            ),
          ),
        ),

        // [VN] Nút chiếu màn hình lớn
        IconButton(
          onPressed: () {},
          icon: Icon(Icons.cast),
          color: AppColors.white_primary,
        ),
      ],
    );
  }
}
