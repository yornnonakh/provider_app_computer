import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/favorite_porvider.dart';
import '../widgets/button_action_bar.dart';

class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favorites = context.watch<FavoriteProvider>().favorites;

    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: AppBar(
        title: Text(
          "My Favorites",
          style: TextStyle(
            fontWeight: FontWeight.w600,
            color: Theme.of(context).primaryColor,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Colors.black,
      ),
      body: favorites.isEmpty
          ? const _EmptyState()
          : ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: favorites.length,
              separatorBuilder: (_, _) => const SizedBox(height: 14),
              itemBuilder: (context, index) {
                final product = favorites[index];

                return Dismissible(
                  key: ValueKey(product.id),
                  direction: DismissDirection.endToStart,
                  background: _deleteBackground(),

                  onDismissed: (_) {
                    final removedProduct = product;
                    final removedIndex = index;

                    context.read<FavoriteProvider>().toggleFavorite(product);

                    showGeneralDialog(
                      context: context,
                      barrierDismissible: false,
                      barrierColor: Colors.transparent,
                      pageBuilder: (_, _, _) {
                        return DeleteActionBar(
                          title: "${removedProduct.name} removed",
                          onUndo: () {
                            context.read<FavoriteProvider>().addFavoriteAt(
                              removedProduct,
                              removedIndex,
                            );
                          },
                          onDelete: () {},
                        );
                      },
                    );
                  },

                  child: _FavoriteCard(product: product),
                );
              },
            ),
    );
  }

  Widget _deleteBackground() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.red,
        borderRadius: BorderRadius.circular(20),
      ),
      alignment: Alignment.centerRight,
      child: const Icon(Icons.delete, color: Colors.white, size: 28),
    );
  }
}

class _FavoriteCard extends StatelessWidget {
  final dynamic product;

  const _FavoriteCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.04),
            blurRadius: 15,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          // 📸 Image
          ClipRRect(
            borderRadius: const BorderRadius.horizontal(
              left: Radius.circular(20),
            ),
            child: SizedBox(
              width: 110,
              height: 110,
              child: Image.network(
                product.image,
                errorBuilder: (_, _, _) =>
                    const Icon(Icons.image_not_supported),
              ),
            ),
          ),

          // 📄 Info
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // 🏷 Title
                  Text(
                    product.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 15,
                    ),
                  ),

                  const SizedBox(height: 6),

                  // 💰 Price
                  Text(
                    "\$${product.price}",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),

                  const SizedBox(height: 8),

                  // ❤️ Favorite tag
                  Row(
                    children: const [
                      Icon(Icons.favorite, size: 16, color: Colors.red),
                      SizedBox(width: 4),
                      Text(
                        "Saved",
                        style: TextStyle(fontSize: 12, color: Colors.grey),
                      ),
                    ],
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

class _EmptyState extends StatelessWidget {
  const _EmptyState();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.favorite_border,
            size: 90,
            color: Theme.of(context).primaryColor,
          ),
          const SizedBox(height: 12),
          const Text(
            "No favorites yet",
            style: TextStyle(
              fontSize: 18,
              color: Colors.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
