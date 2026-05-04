import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';

class BannerSlide extends StatelessWidget {
  const BannerSlide({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: ImageSlideshow(
        height: 180,
        autoPlayInterval: 3000,
        isLoop: true,
        children: [
          Image.network(
            "https://i.pinimg.com/736x/bc/a5/96/bca596a83d166c064e76ea7edfffbf00.jpg",
            fit: BoxFit.cover,
          ),
          Image.network(
            "https://i.pinimg.com/1200x/fa/4e/e5/fa4ee5eee769906bc2e374f103d59476.jpg",
            fit: BoxFit.cover,
          ),
        ],
      ),
    );
  }
}
