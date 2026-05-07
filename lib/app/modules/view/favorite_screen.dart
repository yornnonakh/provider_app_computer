import 'package:computer_app_provider/app/modules/widgets/bottom_nav.dart';
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
      backgroundColor: Color(0xFFF5F6FA),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: _iconBtn(context, Icons.arrow_back_ios, () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => BottomNav()),
          );
        }),
        title: Text(
          'My Favorite',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Theme.of(context).primaryColor,
          ),
        ),
        actions: [
          _iconBtn(context, Icons.favorite_border, () {}),
          SizedBox(width: 8),
        ],
        centerTitle: true,
      ),
      body: favorites.isEmpty
          ? _EmptyState()
          : ListView.separated(
              padding: EdgeInsets.all(16),
              itemCount: favorites.length,
              separatorBuilder: (_, _) => SizedBox(height: 14),
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
                    final favoriteProvider = context.read<FavoriteProvider>();
                    showGeneralDialog(
                      context: context,
                      barrierDismissible: false,
                      barrierColor: Colors.transparent,
                      pageBuilder: (dialogContext, _, _) {
                        return DeleteActionBar(
                          title: "${removedProduct.name} removed",
                          onUndo: () {
                            favoriteProvider.addFavoriteAt(
                              removedProduct,
                              removedIndex,
                            );
                            Navigator.pop(dialogContext);
                          },
                          onDelete: () {
                            Navigator.pop(dialogContext);
                          },
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

  Widget _iconBtn(
    BuildContext context,
    IconData icon,
    VoidCallback onPressed, {
    Color? color,
    double size = 30,
  }) {
    final resolvedColor = color ?? Theme.of(context).primaryColor;
    return IconButton(
      icon: Icon(icon, color: resolvedColor, size: size),
      onPressed: onPressed,
    );
  }

  Widget _deleteBackground() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        // ignore: deprecated_member_use
        color: Colors.red,
        borderRadius: BorderRadius.circular(20),
      ),
      alignment: Alignment.centerRight,
      child: Icon(Icons.delete, color: Colors.white, size: 28),
    );
  }
}

class _FavoriteCard extends StatelessWidget {
  final dynamic product;

  const _FavoriteCard({required this.product});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            // ignore: deprecated_member_use
            color: Colors.black.withOpacity(0.04),
            blurRadius: 15,
            offset: Offset(0, 6),
          ),
        ],
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.horizontal(left: Radius.circular(20)),
            child: SizedBox(
              width: 110,
              height: 110,
              child: Image.network(
                product.image,
                errorBuilder: (_, _, _) => Icon(Icons.image_not_supported),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
                  ),
                  SizedBox(height: 6),
                  Text(
                    "\$${product.price}",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(
                        Icons.favorite,
                        size: 25,
                        color: Theme.of(context).primaryColor,
                      ),
                      SizedBox(width: 4),
                      Text(
                        'Saved',
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
            // ignore: deprecated_member_use
            color: Theme.of(context).primaryColor.withOpacity(0.8),
          ),
          SizedBox(height: 12),
          Text(
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
