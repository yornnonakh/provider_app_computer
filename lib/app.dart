import 'package:computer_app_provider/app/core/constants/app_colors.dart';
import 'package:computer_app_provider/app/modules/providers/cart_provider.dart';
import 'package:computer_app_provider/app/modules/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartProvider(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(primaryColor: AppColors.success),
        home: BottomNav(),
      ),
    );
  }
}
