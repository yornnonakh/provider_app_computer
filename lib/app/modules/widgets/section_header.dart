import 'package:flutter/material.dart';

class SectionHeader extends StatelessWidget {
  const SectionHeader({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: const [
        Text("Popular Products",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
        Text("View All"),
      ],
    );
  }
}