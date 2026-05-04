import 'package:computer_app_provider/app/modules/services/api_services.dart';
import 'package:computer_app_provider/app/modules/widgets/home_content.dart';
import 'package:computer_app_provider/app/modules/widgets/loading_view.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: ApiService.getProduct(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return  LoadingView();
        }

        if (snapshot.hasError) {
          return ErrorView(error: snapshot.error.toString());
        }

        final products = snapshot.data ?? [];

        return HomeContent(products: products);
      },
    );
  }
}