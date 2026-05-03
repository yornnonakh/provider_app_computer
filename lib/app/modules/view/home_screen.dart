import 'package:computer_app_provider/app/modules/providers/favorite_porvider.dart';
import 'package:computer_app_provider/app/modules/services/api_services.dart';
import 'package:computer_app_provider/app/modules/view/detail_screen.dart';
import 'package:computer_app_provider/app/modules/view/favorite_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final favoriteProvider = context.read<FavoriteProvider>();

    return Scaffold(
      backgroundColor: Color(0xFFF7F8FA),

      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: _buildSearchBar(),
        actions: [
          Consumer<FavoriteProvider>(
            builder: (context, fav, _) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => FavoriteScreen()),
                  );
                },
                child: Container(
                  margin: EdgeInsets.only(right: 8),
                  width: 45,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                      ),
                    ],
                  ),
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Center(
                        child: Icon(Icons.favorite_border, color: Colors.black),
                      ),

                      if (fav.favorites.isNotEmpty)
                        Positioned(
                          right: 6,
                          top: 6,
                          child: AnimatedContainer(
                            duration: Duration(milliseconds: 200),
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                            child: Text(
                              fav.favorites.length.toString(),
                              style: TextStyle(
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
            },
          ),

          Container(
            margin: EdgeInsets.only(right: 12),
            width: 45,
            height: 45,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Icon(Icons.person),
          ),
        ],
      ),
      body: FutureBuilder(
        future: ApiService.getProduct(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }

          if (!snapshot.hasData || snapshot.data == null) {
            return Center(child: Text("No data"));
          }

          final products = snapshot.data!;

          return SingleChildScrollView(
            padding: EdgeInsets.all(16),
            child: Column(
              children: [
                ClipRRect(
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
                ),

                SizedBox(height: 20),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Popular Products",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text("View All"),
                  ],
                ),

                SizedBox(height: 10),

                GridView.builder(
                  itemCount: products.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.72,
                    crossAxisSpacing: 16,
                    mainAxisSpacing: 16,
                  ),
                  itemBuilder: (context, index) {
                    final product = products[index];
                    favoriteProvider.isFavorite(product);

                    return Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(22),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.06),
                            blurRadius: 20,
                            offset: Offset(0, 10),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Stack(
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.vertical(
                                  top: Radius.circular(22),
                                ),
                                child: Image.network(
                                  product.image,
                                  height: 140,
                                  width: double.infinity,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Center(
                                      child: Icon(
                                        Icons.broken_image,
                                        size: 140,
                                      ),
                                    );
                                  },
                                  // fit: BoxFit.cover,
                                ),
                              ),

                              Positioned(
                                right: 10,
                                top: 10,
                                child: Consumer<FavoriteProvider>(
                                  builder: (context, fav, _) {
                                    final isFav = fav.isFavorite(product);

                                    return GestureDetector(
                                      onTap: () => fav.toggleFavorite(product),
                                      child: AnimatedContainer(
                                        duration: Duration(milliseconds: 200),
                                        width: 40,
                                        height: 40,
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.95),
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                            BoxShadow(
                                              color: Colors.black.withOpacity(
                                                0.1,
                                              ),
                                              blurRadius: 10,
                                            ),
                                          ],
                                        ),
                                        child: Icon(
                                          isFav
                                              ? Icons.favorite
                                              : Icons.favorite_border,
                                          color: isFav
                                              ? Colors.red
                                              : Colors.black54,
                                          size: 20,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ],
                          ),

                          Padding(
                            padding: EdgeInsets.all(12),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  product.name,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),

                                SizedBox(height: 6),

                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 10,
                                    vertical: 5,
                                  ),
                                  decoration: BoxDecoration(
                                    color: Colors.blue.withOpacity(0.08),
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  child: Text(
                                    "\$${product.price}",
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 10),

                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "In stock",
                                      style: TextStyle(
                                        color: Colors.grey.shade500,
                                        fontSize: 12,
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: () => Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) =>
                                              ProductDetailScreen(pro: product),
                                        ),
                                      ),
                                      child: Container(
                                        width: 34,
                                        height: 34,
                                        decoration: BoxDecoration(
                                          color: Theme.of(context).primaryColor,
                                          borderRadius: BorderRadius.circular(
                                            10,
                                          ),
                                          boxShadow: [
                                            BoxShadow(
                                              color: Theme.of(
                                                context,
                                              ).primaryColor.withOpacity(0.3),
                                              blurRadius: 10,
                                            ),
                                          ],
                                        ),
                                        child: Icon(
                                          Icons.add,
                                          color: Colors.white,
                                          size: 18,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildSearchBar() {
    return Container(
      height: 45,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
      ),
      child: TextField(
        decoration: InputDecoration(
          hintText: "Search products...",
          border: InputBorder.none,
          prefixIcon: Icon(Icons.search),
        ),
      ),
    );
  }
}
