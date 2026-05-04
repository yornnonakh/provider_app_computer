import 'package:computer_app_provider/app/modules/widgets/add_button.dart';
import 'package:flutter/material.dart';

class ProductInfo extends StatelessWidget {
  final dynamic product;

  const ProductInfo({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            product.name,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 6),
          Text(
            "\$${product.price}",
            style: TextStyle(
              color: Theme.of(context).primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.amber.withOpacity(0.2)
                ),
                child:  Padding(
                  padding: const EdgeInsets.all(10),
                  child: Text("In stock", style: TextStyle(fontSize: 12)),
                )),
              AddButton(product: product),
            ],
          ),
        ],
      ),
    );
  }
}