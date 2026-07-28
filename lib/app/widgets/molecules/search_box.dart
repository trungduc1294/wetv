import 'package:flutter/material.dart';
import 'package:wetv/app/core/theme/app_color.dart';
import 'package:wetv/app/widgets/atoms/custom_vertical_divider.dart';

// [VN] Ô tìm kiếm gồm prefix, nội dung search và suffix action
class SearchBox extends StatelessWidget {
  const SearchBox({
    super.key,
    this.prefixIcon,
    this.suffixActionButton,
    this.onTap,
    required this.SearchWidget,
  });

  final Widget? prefixIcon;
  final Widget? suffixActionButton;
  final Widget SearchWidget;
  // [VN] Tap vào vùng search (prefix + nội dung) — không gồm nút filter
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.gray_800,
        borderRadius: BorderRadius.all(Radius.circular(100)),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
      child: Row(
        spacing: 6,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // [VN] Vùng search có thể tap để mở màn Search
          Expanded(
            child: GestureDetector(
              onTap: onTap,
              behavior: HitTestBehavior.opaque,
              child: Row(
                spacing: 6,
                children: [
                  if (prefixIcon != null) prefixIcon!,
                  Expanded(child: SearchWidget),
                ],
              ),
            ),
          ),

          if (suffixActionButton != null) ...[
            const CustomVerticalDivider(margin: EdgeInsets.only(right: 4)),
            suffixActionButton!,
          ],
        ],
      ),
    );
  }
}
