import 'dart:developer';
import 'package:computer_app_provider/app/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:computer_app_provider/app/modules/model/products.dart';
import 'package:computer_app_provider/app/modules/providers/cart_provider.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product pro;
  const ProductDetailScreen({super.key, required this.pro});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),

      /// 🔥 APP BAR (FLOATING STYLE)
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: _iconBtn(context, Icons.arrow_back_ios, () {
          Navigator.pop(context);
        }),
        actions: [
          _iconBtn(context, Icons.favorite_border, () {}),
          const SizedBox(width: 8),
        ],
      ),
      body: Column(
        children: [
          /// 🖼 IMAGE SECTION (MODERN HERO)
          Expanded(
            flex: 4,
            child: Center(
              child: Hero(
                tag: pro.id,
                child: Image.network(pro.image, fit: BoxFit.cover),
              ),
            ),
          ),

          /// 📦 CONTENT CARD
          Expanded(
            flex: 6,
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(30),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 15,
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// NAME + PRICE
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          pro.name,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.1),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          "\$${pro.price}",
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),

                  /// RATING
                  Row(
                    children: const [
                      Icon(Icons.star, color: Colors.amber, size: 18),
                      SizedBox(width: 4),
                      Text(
                        "4.5",
                        style: TextStyle(fontWeight: FontWeight.w600),
                      ),
                      SizedBox(width: 10),
                      Text("125 Reviews", style: TextStyle(color: Colors.grey)),
                    ],
                  ),
                  const SizedBox(height: 16),

                  /// DESCRIPTION
                  Text(
                    pro.description,
                    style: const TextStyle(color: Colors.grey, height: 1.5),
                  ),
                  const SizedBox(height: 18),

                  /// TITLE
                  const Text(
                    "Specifications",
                    style: TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
                  ),
                  const SizedBox(height: 10),

                  /// FEATURES LIST
                  Expanded(
                    child: ListView(
                      children: [
                        _feature("Display", pro.specs.display),
                        _feature("CPU", pro.specs.cpu),
                        _feature("RAM", pro.specs.ram),
                        _feature("Storage", pro.specs.storage),
                        _feature("GPU", pro.specs.gpu),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),

      /// 🔥 MODERN BOTTOM BUTTON
      bottomNavigationBar: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 20),
          ],
        ),
        child: SafeArea(
          child: SizedBox(
            height: 55,
            child: ElevatedButton(
              onPressed: () {
                context.read<CartProvider>().addToCart(
                  Product(
                    id: pro.id,
                    name: pro.name,
                    price: pro.price,
                    image: pro.image,
                    description: pro.description,
                    category: pro.category,
                    stock: 1,
                    specs: pro.specs,
                  ),
                );

                log("Added to cart");

                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    behavior: SnackBarBehavior.floating,
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    duration: const Duration(seconds: 2),
                    content: Container(
                      padding: const EdgeInsets.all(14),
                      decoration: BoxDecoration(
                        color: Colors.green.shade600,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.15),
                            blurRadius: 15,
                            offset: const Offset(0, 8),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          const Icon(Icons.check_circle, color: Colors.white),
                          const SizedBox(width: 12),

                          /// TEXT
                          Expanded(
                            child: Text(
                              "${pro.name} added successfully",
                              style: const TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),

                          /// CLOSE ICON (optional UI feel)
                          const Icon(
                            Icons.close,
                            color: Colors.white,
                            size: 18,
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Theme.of(context).primaryColor,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              child: Text(
                "Add to Cart",
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  color: AppColors.scaffold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// 🔹 ICON BUTTON
  Widget _iconBtn(BuildContext context, IconData icon, VoidCallback onTap) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(12),
        child: Container(
          width: 42,
          height: 42,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.05), blurRadius: 10),
            ],
          ),
          child: Icon(icon, size: 20),
        ),
      ),
    );
  }

  /// 🔹 FEATURE ROW
  Widget _feature(String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        children: [
          Expanded(
            child: Text(title, style: const TextStyle(color: Colors.grey)),
          ),
          Text(value, style: const TextStyle(fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }
}
