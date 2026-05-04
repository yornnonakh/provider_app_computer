import 'package:computer_app_provider/app/modules/widgets/Home_app_bar.dart';
import 'package:computer_app_provider/app/modules/widgets/home_body.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: HomeAppBar(),
      body: HomeBody(),
    );
  }
}
