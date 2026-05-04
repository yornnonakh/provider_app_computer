import 'package:computer_app_provider/app/core/constants/app_colors.dart';
import 'package:computer_app_provider/app/modules/providers/address_proivder.dart';
import 'package:computer_app_provider/app/modules/providers/cart_provider.dart';
import 'package:computer_app_provider/app/modules/providers/favorite_porvider.dart';
import 'package:computer_app_provider/app/modules/providers/payment_provider.dart';
import 'package:computer_app_provider/app/modules/providers/search_provider.dart';
import 'package:computer_app_provider/app/modules/widgets/bottom_nav.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CartProvider()),
        ChangeNotifierProvider(create: (context) => AddressProvider()),
        ChangeNotifierProvider(create: (context) => PaymentProvider()),
        ChangeNotifierProvider(create: (context) => FavoriteProvider()),
         ChangeNotifierProvider(create: (_) => SearchProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(primaryColor: AppColors.primary),
        home: BottomNav(),
      ),
    );
  }
}
