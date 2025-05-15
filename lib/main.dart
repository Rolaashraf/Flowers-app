import 'package:flutter/material.dart';
<<<<<<< HEAD
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
=======
import 'package:myapp/FirstScreen.dart';
import 'package:myapp/profile/user_model.dart';
import 'package:provider/provider.dart';

 

void main() {
  runApp( 
    
    ChangeNotifierProvider(create: (context)=> userModel()
    ,child: MyApp(),));
>>>>>>> ab7297007726b123278549910bd453a47f0598a5
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
<<<<<<< HEAD
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.purple),
        useMaterial3: true,
      ),
      home: NavBar(),
=======
      debugShowCheckedModeBanner: false,
      title: 'Flutter Web Demo',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home:  Firstscreen(),
>>>>>>> ab7297007726b123278549910bd453a47f0598a5
    );
  }
}
