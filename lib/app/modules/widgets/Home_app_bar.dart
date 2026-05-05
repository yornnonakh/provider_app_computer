// ignore: file_names

import 'package:computer_app_provider/app/modules/view/favorite_screen.dart';
import 'package:computer_app_provider/app/modules/widgets/favorite_button.dart';
import 'package:computer_app_provider/app/modules/widgets/profile_button.dart';
import 'package:computer_app_provider/app/modules/widgets/searchg_text_field.dart';
import 'package:flutter/material.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  HomeAppBar({super.key});
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      title: SearchTextField(controller: searchController),
      actions: [
        FavoriteButton(
          // count: 0, // from provider/riverpod
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => FavoriteScreen()),
            );
          },
        ),
        NotificationButton(
          onTap: () {
            // go to profile
          },
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
