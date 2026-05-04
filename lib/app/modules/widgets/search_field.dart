import 'package:computer_app_provider/app/modules/providers/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    final search = context.watch<SearchProvider>();

    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
      ),
      child: Row(
        children: [
          const Icon(Icons.search, color: Colors.grey),

          const SizedBox(width: 10),

          /// 🔍 Text Field
          Expanded(
            child: TextField(
              autofocus: true,
              onChanged: (value) {
                context.read<SearchProvider>().setQuery(value);
              },
              style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              decoration: const InputDecoration(
                hintText: "Search products...",
                border: InputBorder.none,
                isDense: true,
              ),
            ),
          ),

          /// ❌ Clear button
          if (search.query.isNotEmpty)
            GestureDetector(
              onTap: () {
                context.read<SearchProvider>().clear();
              },
              child: Container(
                padding: const EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(Icons.close, size: 18, color: Colors.black54),
              ),
            ),
        ],
      ),
    );
  }
}
