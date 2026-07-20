import 'package:flutter/material.dart';
import 'package:wetv/app/widgets/atoms/typography.dart';

// [VN] Nút dạng text dùng TypographyWidget
class TypographyButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color? color;
  final double? fontSize;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;
  final FontWeight? fontWeight;
  final bool strong;
  final bool italic;
  final bool underline;
  final bool strikethrough;
  final bool allCaps;
  final bool lowercase;
  final bool uppercase;

  const TypographyButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.color,
    this.fontSize,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
    this.fontWeight,
    this.strong = false,
    this.italic = false,
    this.underline = false,
    this.strikethrough = false,
    this.allCaps = false,
    this.lowercase = false,
    this.uppercase = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      behavior: HitTestBehavior.opaque,
      child: TypographyWidget(
        text: text,
        color: color,
        fontSize: fontSize,
        style: style,
        textAlign: textAlign,
        overflow: overflow,
        maxLines: maxLines,
        fontWeight: fontWeight,
        strong: strong,
        italic: italic,
        underline: underline,
        strikethrough: strikethrough,
        allCaps: allCaps,
        lowercase: lowercase,
        uppercase: uppercase,
      ),
    );
  }
}
