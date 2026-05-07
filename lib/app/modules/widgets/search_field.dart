import 'package:computer_app_provider/app/modules/providers/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchField extends StatelessWidget {
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    final search = context.watch<SearchProvider>();

    return AnimatedContainer(
      duration:  Duration(milliseconds: 250),
      padding:  EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.9),
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 20,
            offset:  Offset(0, 10),
          ),
        ],
        // ignore: deprecated_member_use
        border: Border.all(color: Colors.grey.withOpacity(0.2)),
      ),
      child: Row(
        children: [
           Icon(Icons.search, color: Colors.grey),

           SizedBox(width: 10),

          /// 🔍 Text Field
          Expanded(
            child: TextField(
              autofocus: true,
              onChanged: (value) {
                context.read<SearchProvider>().setQuery(value);
              },
              style:  TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
              decoration:  InputDecoration(
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
                padding:  EdgeInsets.all(6),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child:  Icon(Icons.close, size: 18, color: Colors.black54),
              ),
            ),
        ],
      ),
    );
  }
}
