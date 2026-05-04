import 'package:computer_app_provider/app/modules/widgets/banner_slide.dart';
import 'package:computer_app_provider/app/modules/widgets/product_gride.dart';
import 'package:computer_app_provider/app/modules/widgets/section_header.dart';
import 'package:flutter/material.dart';

class HomeContent extends StatelessWidget {
  final List products;

  const HomeContent({super.key, required this.products});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding:  EdgeInsets.all(16),
      child: Column(
        children: [
           BannerSlide(),
           SizedBox(height: 20),
           SectionHeader(),
           SizedBox(height: 10),
          ProductGride(products: products),
        ],
      ),
    );
  }
}