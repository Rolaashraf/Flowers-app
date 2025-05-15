import 'package:flutter/material.dart';
import 'package:tree/New/New.dart';
import 'package:tree/dashboard/dashboard_screen.dart';
import 'package:tree/favorite/favorite_screen.dart';
import 'package:tree/profile/profile_page/profile_page.dart';
import 'package:tree/quote/quote_screen.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key}); // Fixed: Added curly braces for named parameter

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: [
          DashboardScreen(),
          QuoteScreen(),
          FavoriteScreen(),
          New(),
          const ProfilePage(),
        ][_selectedIndex],
        bottomNavigationBar: NavigationBar(
          onDestinationSelected: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
          destinations: [
            NavigationDestination(
                icon: Icon(Icons.dashboard), label: "Dashboard"),
            NavigationDestination(
                icon: Icon(Icons.format_quote), label: "Quote"),
            NavigationDestination(
                icon: Icon(Icons.favorite), label: "Favorite"),
            NavigationDestination(icon: Icon(Icons.info), label: "About us"),
            NavigationDestination(icon: Icon(Icons.person), label: "Profile"),
          ],
        ));
  }
}
