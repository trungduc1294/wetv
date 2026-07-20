import 'package:flutter/widgets.dart';

// [VN] Logo ứng dụng WeTV
class AppLogo extends StatelessWidget {
  const AppLogo({super.key, this.height = 40, this.width = 40});
  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/logo.webp',
      height: height,
      width: width,
      fit: BoxFit.contain,
    );
  }
}
