import 'package:flutter/material.dart';

class HomeScreen3 extends StatelessWidget {
  const HomeScreen3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios),
        title: Text(
          'Home Screen'
        ),
        actions: [
          Icon(Icons.abc)
        ],
      ),
      body: SafeArea(child: 
      Column(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            color: Theme.of(context).primaryColor,
          )
        ],
      )),
    );
  }
}
