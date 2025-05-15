import 'package:flutter/material.dart';
import 'package:tree/dashboard/dashboard_screen.dart';
import 'package:tree/favorite/favorite_model.dart';
import 'add_item/item_model.dart';
import 'dashboard/nav_bar.dart';
import 'profile/user_model.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => UserModel(), // ChangeNotifierProvider
        ),
        ChangeNotifierProvider(
          create: (context) => ItemModel(), // ChangeNotifierProvider
        ),
        ChangeNotifierProvider(
          create: (context) => FavoriteModel(), // ChangeNotifierProvider
        ),
      ],
      child: const MyApp(),
    ), // MultiProvider
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      home: NavBar(),
    );
  }
}
