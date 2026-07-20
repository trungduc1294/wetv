import 'package:flutter/material.dart';
import 'package:wetv/app/core/theme/app_color.dart';
import 'package:wetv/app/widgets/atoms/custom_vertical_divider.dart';

// [VN] Ô tìm kiếm gồm prefix, nội dung search và suffix action
class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
    this.prefixIcon,
    this.suffixActionButton,
    required this.SearchWidget,
  });

  final Widget? prefixIcon;
  final Widget? suffixActionButton;
  final Widget SearchWidget;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.gray_800,
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        spacing: 6,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // [VN] Nêú có prefix icon thì hiển thị
          prefixIcon ?? prefixIcon!,

          // [VN] Nêú có search widget thì hiển thị
          Expanded(child: SearchWidget),

          CustomVerticalDivider(margin: EdgeInsets.only(right: 4)),

          // [VN] Nêú có suffix action button thì hiển thị
          suffixActionButton ?? suffixActionButton!,
        ],
      ),
    );
  }
}
