import 'package:flutter/material.dart';
import 'package:products_store_app/presentation/screens/cart_screen.dart';
import 'package:products_store_app/presentation/screens/home_screen.dart';
import 'package:products_store_app/presentation/screens/widgets/detail_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => const HomeScreen());

      case "/home":
        return MaterialPageRoute(builder: (_) => const HomeScreen());
      case "/cart":
        return MaterialPageRoute(builder: (_) => const CartScreen());
      case "/detail_screen":
        return MaterialPageRoute(builder: (_) => const DetailScreen());
    }

    return MaterialPageRoute(builder: (_) => const HomeScreen());
  }
}
