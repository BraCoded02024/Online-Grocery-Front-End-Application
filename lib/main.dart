import 'package:flutter/material.dart';
import 'screens/splashscreen.dart';
import 'screens/number_entry.dart';
import 'screens/login.dart';
import 'screens/signup.dart';
import 'screens/home.dart';
import 'screens/product_detail.dart';
import 'screens/explore.dart';
import 'screens/beverages.dart';
import 'screens/search.dart';
import 'screens/filters.dart';
import 'screens/mycart.dart';
import 'screens/favourite.dart';
import 'screens/orderaccepted.dart';
import 'screens/error.dart';
import 'screens/account.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SplashScreen(),
      routes: {
        '/number_entry': (context) => const NumberEntryScreen(),
        '/login': (context) => const LoginScreen(),
        '/signup': (context) => const SignUpScreen(),
        '/home': (context) => const HomeScreen(),
        '/explore': (context) => const ExploreScreen(),
        '/beverages': (context) => const BeveragesScreen(),
        '/search': (context) => const SearchScreen(),
        '/filters': (context) => const FiltersScreen(),
        '/mycart': (context) => const MyCartScreen(),
        '/favourite': (context) => const FavouriteScreen(),
        '/orderaccepted': (context) => const OrderAcceptedScreen(),
        '/error': (context) => const ErrorScreen(),
        '/account': (context) => const AccountScreen(),
      },
    );
  }
}
