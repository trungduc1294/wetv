import 'package:flutter/material.dart';

// [VN] Vị trí của label so với icon
enum LabelPosition { left, right, top, bottom }

class IconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback? onPressed;
  final Color? color;
  final double? size;
  final EdgeInsetsGeometry? padding;
  final String? label;
  final TextStyle? labelStyle;
  final LabelPosition labelPosition;

  const IconButton({
    super.key,
    required this.icon,
    required this.onPressed,
    this.color,
    this.size,
    this.padding,
    this.label,
    this.labelStyle,
    this.labelPosition = LabelPosition.right,
  });

  // [VN] Khoảng cách giữa icon và label
  static const double _gap = 8;

  Widget get _icon => Icon(icon, color: color, size: size);

  Widget? get _label {
    if (label == null) return null;
    return Text(label!, style: labelStyle);
  }

  // [VN] Ghép icon và label theo LabelPosition
  Widget get _content {
    final labelWidget = _label;
    if (labelWidget == null) return _icon;

    return switch (labelPosition) {
      LabelPosition.left => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          labelWidget,
          const SizedBox(width: _gap),
          _icon,
        ],
      ),
      LabelPosition.right => Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _icon,
          const SizedBox(width: _gap),
          labelWidget,
        ],
      ),
      LabelPosition.top => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          labelWidget,
          const SizedBox(height: _gap),
          _icon,
        ],
      ),
      LabelPosition.bottom => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          _icon,
          const SizedBox(height: _gap),
          labelWidget,
        ],
      ),
    };
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(padding: padding),
      child: _content,
    );
  }
}
