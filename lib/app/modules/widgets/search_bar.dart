import 'package:computer_app_provider/app/modules/widgets/empty_search_view.dart';
import 'package:computer_app_provider/app/modules/widgets/search_field.dart';
import 'package:computer_app_provider/app/modules/widgets/search_result_view.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/search_provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final search = context.watch<SearchProvider>();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: SearchField(),
      ),
      body: Padding(
        padding:  EdgeInsets.all(16),
        child: search.query.isEmpty
            ? EmptySearchView()
            : SearchResultView(query: search.query),
      ),
    );
  }
}