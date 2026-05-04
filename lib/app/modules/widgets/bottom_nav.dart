import 'package:computer_app_provider/app/modules/services/api_services.dart';
import 'package:computer_app_provider/app/modules/view/cart_screen.dart';
import 'package:computer_app_provider/app/modules/view/favorite_screen.dart';
import 'package:computer_app_provider/app/modules/view/home_screen.dart';
import 'package:computer_app_provider/app/modules/view/profile_screen.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  const BottomNav({super.key});

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  int selectedIndex = 0;

  final List<Widget> screens = [
    const HomeScreen(),
    const CartScreen(),
    const FavoriteScreen(),
    const ProfileScreen(),
  ];

  @override
  void initState() {
    super.initState();
    ApiService.getProduct();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F8FA),

      body: screens[selectedIndex],

      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: Container(
          height: 70,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(25),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.08), blurRadius: 20),
            ],
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _navItem(Icons.home, 0),
              _navItem(Icons.shopping_bag, 1),
              _navItem(Icons.favorite, 2),
              _navItem(Icons.person, 3),
            ],
          ),
        ),
      ),
    );
  }
  Widget _navItem(IconData icon, int index) {
    final isSelected = selectedIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: isSelected
              ? Theme.of(context).primaryColor.withOpacity(0.15)
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          children: [
            Icon(
              icon,
              color: isSelected ? Theme.of(context).primaryColor : Colors.grey,
            ),

            if (isSelected) ...[
              const SizedBox(width: 6),
              Text(
                _label(index),
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }

  String _label(int index) {
    switch (index) {
      case 0:
        return "Home";
      case 1:
        return "Cart";
      case 2:
        return "Favorite";
      case 3:
        return "Profile";
      default:
        return "";
    }
  }
}
