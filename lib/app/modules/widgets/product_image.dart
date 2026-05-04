import 'package:computer_app_provider/app/modules/providers/favorite_porvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductImage extends StatelessWidget {
  final dynamic product;

  const ProductImage({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    final fav = context.watch<FavoriteProvider>();
    final isFav = fav.isFavorite(product);

    return Stack(
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.vertical(
            top: Radius.circular(22),
          ),
          child: Center(
            child: Image.network(
              product.image,
              height: 140,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (_, _, _) =>
                  const Icon(Icons.broken_image, size: 140),
            ),
          ),
        ),
        Positioned(
          right: 10,
          top: 10,
          child: GestureDetector(
            onTap: () => fav.toggleFavorite(product),
            child: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(
                isFav ? Icons.favorite : Icons.favorite_border,
                color: isFav ? Colors.red : Colors.black54,
              ),
            ),
          ),
        ),
      ],
    );
  }
}