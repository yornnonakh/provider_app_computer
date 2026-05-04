import 'package:computer_app_provider/app/modules/providers/search_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmptySearchView extends StatelessWidget {
  const EmptySearchView({super.key});

  @override
  Widget build(BuildContext context) {
    context.watch<SearchProvider>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Recent Searches",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),

        Wrap(
          spacing: 8,
          children: [
            _chip(context, "Laptop"),
            _chip(context, "iPhone"),
            _chip(context, "Gaming PC"),
          ],
        ),
      ],
    );
  }

  Widget _chip(BuildContext context, String text) {
    return ActionChip(
      label: Text(text),
      onPressed: () {
        context.read<SearchProvider>().setQuery(text);
      },
    );
  }
}