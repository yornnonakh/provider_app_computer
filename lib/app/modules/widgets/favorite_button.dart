import 'package:computer_app_provider/app/modules/providers/favorite_porvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteButton extends StatelessWidget {
  final VoidCallback? onTap;

  const FavoriteButton({super.key, this.onTap});

  @override
  Widget build(BuildContext context) {
    final fav = context.watch<FavoriteProvider>();

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(right: 8),
        width: 45,
        height: 45,
        decoration: _boxDecoration(),
        child: Stack(
          clipBehavior: Clip.none,
          children: [
            const Center(
              child: Icon(Icons.favorite_border, color: Colors.black),
            ),

            /// 🔴 Badge
            if (fav.count > 0) // ✅ use getter
              Positioned(
                right: 6,
                top: 6,
                child: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Text(
                    fav.count.toString(), // ✅ use getter
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  BoxDecoration _boxDecoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(14),
      boxShadow: [
        BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
      ],
    );
  }
}

extension FavoriteProviderCountExtension on FavoriteProvider {
  int get count {
    final dynamic self = this;
    try {
      final dynamic favorites = self.favorites;
      return (favorites?.length ?? 0) as int;
    } catch (_) {
      return 0;
    }
  }
}
