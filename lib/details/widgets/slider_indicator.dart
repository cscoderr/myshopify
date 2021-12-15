import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class SliderIndicator extends StatelessWidget {
  const SliderIndicator(
      {Key? key,
      required this.currentIndex,
      required this.length,
      this.carouselController})
      : super(key: key);

  final int length;
  final int currentIndex;
  final CarouselController? carouselController;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        length,
        (index) {
          return GestureDetector(
            onTap: () => carouselController!.animateToPage(index),
            child: SliderIndicatorItem(
              currentIndex == index,
            ),
          );
        },
      ),
    );
  }
}

class SliderIndicatorItem extends StatelessWidget {
  const SliderIndicatorItem(this.isCurrentSlider, {Key? key}) : super(key: key);

  final bool isCurrentSlider;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).primaryColor;
    return Padding(
      padding: const EdgeInsets.only(
        right: 10.0,
      ),
      child: isCurrentSlider
          ? Container(
              width: 20.0,
              height: 8.0,
              decoration: BoxDecoration(
                color: currentColor(isCurrentSlider, color),
                borderRadius: BorderRadius.circular(4.0),
              ),
            )
          : Container(
              width: 8.0,
              height: 8.0,
              decoration: BoxDecoration(
                color: currentColor(isCurrentSlider, color),
                shape: BoxShape.circle,
              ),
            ),
    );
  }

  Color currentColor(bool isCurrentPage, Color color) {
    return isCurrentPage ? color : Colors.grey;
  }
}
