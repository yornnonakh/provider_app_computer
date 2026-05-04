import 'package:computer_app_provider/app/modules/view/detail_screen.dart';
import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  final dynamic product;

  const AddButton({super.key,  required this.product});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => ProductDetailScreen(pro: product),
          ),
        );
      },
      child: Container(
        width: 34,
        height: 34,
        decoration: BoxDecoration(
          color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: const Icon(Icons.add, color: Colors.white, size: 18),
      ),
    );
  }
}