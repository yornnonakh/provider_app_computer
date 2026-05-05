import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15, bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "Popular Products",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Text("View All", style: TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
