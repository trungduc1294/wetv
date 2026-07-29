import 'package:flutter/material.dart';
import 'package:wetv/app/core/theme/app_color.dart';
import 'package:wetv/app/data/models/movie_hero_slide.dart';

// [VN] Hero slider 2 layer: foreground PNG đè lên background fade
class MovieHeroSlider extends StatefulWidget {
  const MovieHeroSlider({
    super.key,
    required this.slides,
    this.height = 420,
    this.backgroundFadeDuration = const Duration(milliseconds: 500),
    this.gradientHeight = 120,
    this.gradientColor = AppColors.primary,
    this.titleStyle = const TextStyle(
      color: AppColors.white_primary,
      fontSize: 16,
      fontWeight: FontWeight.w500,
    ),
    this.dotSize = 6,
    this.activeDotSize = 7,
    this.dotSpacing = 6,
    this.contentPadding = const EdgeInsets.fromLTRB(16, 0, 16, 16),
    this.onSlideTap,
  });

  final List<MovieHeroSlide> slides;
  final double height;
  // [VN] Thời gian fade in/out của background
  final Duration backgroundFadeDuration;
  // [VN] Chiều cao vùng gradient chuyển màu xuống background app
  final double gradientHeight;
  final Color gradientColor;
  final TextStyle titleStyle;
  final double dotSize;
  final double activeDotSize;
  final double dotSpacing;
  final EdgeInsetsGeometry contentPadding;
  final void Function(MovieHeroSlide slide, int index)? onSlideTap;

  @override
  State<MovieHeroSlider> createState() => _MovieHeroSliderState();
}

class _MovieHeroSliderState extends State<MovieHeroSlider> {
  late final PageController _pageController;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() => _currentIndex = index);
  }

  @override
  Widget build(BuildContext context) {
    if (widget.slides.isEmpty) return const SizedBox.shrink();

    // [VN] Clamp index vì slides có thể đổi độ dài khi API trả về
    final index = _currentIndex.clamp(0, widget.slides.length - 1);
    final currentSlide = widget.slides[index];

    return SizedBox(
      height: widget.height,
      width: double.infinity,
      child: Stack(
        fit: StackFit.expand,
        children: [
          // [VN] Layer nền: fade out/in khi đổi slide
          AnimatedSwitcher(
            duration: widget.backgroundFadeDuration,
            switchInCurve: Curves.easeIn,
            switchOutCurve: Curves.easeOut,
            child: Image.network(
              currentSlide.backgroundUrl,
              key: ValueKey('bg_${currentSlide.backgroundUrl}_$index'),
              fit: BoxFit.cover,
              width: double.infinity,
              height: double.infinity,
            ),
          ),

          // [VN] Layer foreground: PageView PNG chủ thể đè lên background
          PageView.builder(
            controller: _pageController,
            itemCount: widget.slides.length,
            onPageChanged: _onPageChanged,
            itemBuilder: (context, index) {
              final slide = widget.slides[index];
              return GestureDetector(
                onTap: () => widget.onSlideTap?.call(slide, index),
                child: Image.network(
                  slide.foregroundUrl,
                  fit: BoxFit.contain,
                  alignment: Alignment.bottomCenter,
                ),
              );
            },
          ),

          // [VN] Gradient dưới cùng chuyển mượt sang màu nền app
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            height: widget.gradientHeight,
            child: IgnorePointer(
              child: DecoratedBox(
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      widget.gradientColor.withValues(alpha: 0),
                      widget.gradientColor,
                    ],
                  ),
                ),
              ),
            ),
          ),

          // [VN] Title bottom-left + dots bottom-right
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Padding(
              padding: widget.contentPadding,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Expanded(
                    child: AnimatedSwitcher(
                      duration: const Duration(milliseconds: 250),
                      child: Align(
                        key: ValueKey('title_$currentSlide.title'),
                        alignment: Alignment.centerLeft,
                        child: Text(
                          currentSlide.title,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: widget.titleStyle,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  _SliderDots(
                    count: widget.slides.length,
                    currentIndex: index,
                    dotSize: widget.dotSize,
                    activeDotSize: widget.activeDotSize,
                    spacing: widget.dotSpacing,
                    onDotTap: (index) {
                      _pageController.animateToPage(
                        index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeOut,
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// [VN] Dãy chấm chỉ báo slide hiện tại
class _SliderDots extends StatelessWidget {
  const _SliderDots({
    required this.count,
    required this.currentIndex,
    required this.dotSize,
    required this.activeDotSize,
    required this.spacing,
    required this.onDotTap,
  });

  final int count;
  final int currentIndex;
  final double dotSize;
  final double activeDotSize;
  final double spacing;
  final void Function(int index) onDotTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(count, (index) {
        final active = index == currentIndex;
        final size = active ? activeDotSize : dotSize;
        return GestureDetector(
          onTap: () => onDotTap(index),
          behavior: HitTestBehavior.opaque,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: spacing / 2),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: size,
              height: size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: active
                    ? AppColors.white_primary
                    : AppColors.white_primary.withValues(alpha: 0.35),
              ),
            ),
          ),
        );
      }),
    );
  }
}
