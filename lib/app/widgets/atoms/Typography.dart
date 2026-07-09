import 'package:flutter/material.dart';

class TypographyWidget extends StatelessWidget {
  final String text;
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

  const TypographyWidget({
    super.key,
    required this.text,
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

  // [VN] Hàm trả về text đã được chuyển đổi case
  String get _displayText {
    if (lowercase) return text.toLowerCase();
    if (allCaps || uppercase) return text.toUpperCase();
    return text;
  }

  // [VN] Hàm trả về style đã được chuyển đổi case
  TextStyle get _resolvedStyle {
    final base = style ?? const TextStyle();

    TextDecoration? decoration;
    if (underline && strikethrough) {
      decoration = TextDecoration.combine([
        TextDecoration.underline,
        TextDecoration.lineThrough,
      ]);
    } else if (underline) {
      decoration = TextDecoration.underline;
    } else if (strikethrough) {
      decoration = TextDecoration.lineThrough;
    }

    // [VN] Hàm trả về style đã được chuyển đổi case
    return base.copyWith(
      color: color ?? base.color,
      fontSize: fontSize ?? base.fontSize,
      fontWeight: fontWeight ?? (strong ? FontWeight.bold : base.fontWeight),
      fontStyle: italic ? FontStyle.italic : base.fontStyle,
      decoration: decoration ?? base.decoration,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Text(
      _displayText,
      style: _resolvedStyle,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
