import 'package:computer_app_provider/app/modules/providers/favorite_porvider.dart';
import 'package:computer_app_provider/app/modules/widgets/product_image.dart';
import 'package:computer_app_provider/app/modules/widgets/product_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductCard extends StatelessWidget {
  final dynamic product;

  const ProductCard({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final fav = context.watch<FavoriteProvider>();
    fav.isFavorite(product);

    return Container(
      decoration: _cardDecoration(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductImage(product: product),
          ProductInfo(product: product),
        ],
      ),
    );
  }

  BoxDecoration _cardDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(20),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withOpacity(0.06),
          blurRadius: 20,
          offset: const Offset(0, 10),
        ),
      ],
    );
  }
}