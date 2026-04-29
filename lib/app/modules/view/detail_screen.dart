import 'dart:developer';

import 'package:computer_app_provider/app/modules/model/products.dart';
import 'package:computer_app_provider/app/modules/providers/cart_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductDetailScreen extends StatelessWidget {
  final Product pro;
  const ProductDetailScreen({super.key, required this.pro});

  static const Color primaryColor = Color(0xFF22245F);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(8),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(28),
            ),
            child: Column(
              children: [
                // Header
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 12,
                  ),
                  child: Row(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(Icons.arrow_back_ios),
                      ),
                      Expanded(
                        child: Center(
                          child: Text(
                            pro.name,
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w700,
                              color: Color(0xFF33334D),
                            ),
                          ),
                        ),
                      ),
                      Icon(
                        Icons.favorite,
                        size: 24,
                        color: Colors.grey.shade300,
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 40),
                // Product Image
                Image.network(pro.image, height: 240, fit: BoxFit.contain),
                SizedBox(height: 30),
                // Dots
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [dot(false), dot(false), dot(true), dot(false)],
                ),
                SizedBox(height: 28),
                // Details
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 22),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Name and Price
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              pro.name,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Color(0xFF33334D),
                              ),
                            ),
                            Text(
                              "${pro.price}\$",
                              style: TextStyle(
                                fontSize: 26,
                                fontWeight: FontWeight.w800,
                                color: Color(0xFF22223B),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 12),
                        // Rating
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.grey.shade200),
                              ),
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.star,
                                    color: Colors.amber,
                                    size: 16,
                                  ),
                                  SizedBox(width: 4),
                                  Text(
                                    "4.5",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(width: 12),
                            Text(
                              "125+ Review",
                              style: TextStyle(
                                color: Color(0xFF77778A),
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 18),
                        featureText(
                          "Experience a ${pro.specs.display} display with Low Blue Light Technology, Featuring Alienware Cryo-Tech™ cooling and ${pro.specs.cpu}",
                        ),
                        featureText(pro.specs.cpu),
                        featureText("RAM : ${pro.specs.ram}"),
                        featureText("Storage : ${pro.specs.storage}"),
                        featureText("GPU : ${pro.specs.gpu}"),
                        Spacer(),
                        // Buy Button
                        SizedBox(
                          width: double.infinity,
                          height: 58,
                          child: ElevatedButton(
                            onPressed: () {
                              // call function for add to cart from provider
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
                              log("Button Clicked");
                              //  Alert message
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "${pro.name} Add to cart successfully",
                                  ),
                                  backgroundColor: Theme.of(
                                    context,
                                  ).primaryColor,
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              elevation: 0,
                            ),
                            child: Text(
                              "ADD TO CART",
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 18),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  static Widget dot(bool active) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 5),
      width: active ? 10 : 6,
      height: active ? 10 : 6,
      decoration: BoxDecoration(
        color: active ? primaryColor : Colors.grey.shade200,
        shape: BoxShape.circle,
      ),
    );
  }

  static Widget featureText(String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 7),
            child: Icon(Icons.circle, size: 8, color: primaryColor),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(
                fontSize: 13.5,
                height: 1.45,
                color: Color(0xFF8A8A9E),
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
