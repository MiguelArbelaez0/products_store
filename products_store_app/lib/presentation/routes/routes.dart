import 'package:flutter/material.dart';
import 'package:products_store_app/presentation/screens/cart_screen.dart';

import '../../domain/entitis/products_entiti.dart';
import '../screens/detail_screen.dart';
import '../screens/home_screen.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case "/":
        return MaterialPageRoute(builder: (_) => HomeScreen());

      case "/cart":
        return MaterialPageRoute(builder: (_) => const CartScreen());
      case "/detail_screen":
        return MaterialPageRoute(
          builder: (_) {
            return DetailScreen(
              product: settings.arguments as Product,
            );
          },
        );
    }

    return MaterialPageRoute(builder: (_) => HomeScreen());
  }
}
