import 'package:flutter/material.dart';
import 'package:flutter_3_oy_imtixon/utils/app_colors.dart';
import 'package:flutter_3_oy_imtixon/views/cart_v1_screen/screen/cart_v1_screen.dart';
import 'package:flutter_3_oy_imtixon/views/home_screen/screen/home_screen%20.dart';
import 'package:flutter_3_oy_imtixon/views/search_screen/screen/search_screen.dart';
import 'package:flutter_3_oy_imtixon/views/user_profile_screen/screen/user_profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  Color color0 = AppColors.yellow;
  Color color1 = Colors.transparent;
  Color color2 = Colors.transparent;
  Color color3 = Colors.transparent;

  int selectedIndex = 0;

  static List<Widget> pages = <Widget>[
    HomeScreen(),
    SearchScreen(),
    CartV1Screen(),
    UserProfileScreen(),
  ];

  void onItemTapped(int index) {
    if (index == 0) {
      color0 = AppColors.yellow;
      color1 = color2 = color3 = Colors.transparent;
      setState(() {});
    } else if (index == 1) {
      color1 = AppColors.yellow;
      color0 = color2 = color3 = Colors.transparent;
      setState(() {});
    } else if (index == 2) {
      color2 = AppColors.yellow;
      color0 = color1 = color3 = Colors.transparent;
      setState(() {});
    } else if (index == 3) {
      color3 = AppColors.yellow;
      color0 = color2 = color1 = Colors.transparent;
      setState(() {});
    }
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Container(
              width: 80,
              height: 40,
              decoration: BoxDecoration(
                color: color0,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.home),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 80,
              height: 40,
              decoration: BoxDecoration(
                color: color1,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.search),
            ),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 80,
              height: 40,
              decoration: BoxDecoration(
                color: color2,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.shopping_bag),
            ),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Container(
              width: 80,
              height: 40,
              decoration: BoxDecoration(
                color: color3,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Icon(Icons.person),
            ),
            label: 'Profile',
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.black,
        onTap: onItemTapped,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
