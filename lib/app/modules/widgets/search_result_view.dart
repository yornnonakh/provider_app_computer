import 'package:flutter/material.dart';

class SearchResultView extends StatelessWidget {
  final String query;

  const SearchResultView({super.key, required this.query});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10, // later connect API/filter
      itemBuilder: (_, index) {
        return Card(
          margin:  EdgeInsets.only(bottom: 10),
          child: ListTile(
            leading:  Icon(Icons.shopping_bag),
            title: Text("$query result $index"),
            subtitle:  Text("Product description"),
            trailing:  Icon(Icons.arrow_forward_ios, size: 16),
          ),
        );
      },
    );
  }
}