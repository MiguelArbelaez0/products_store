import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:products_store_app/domain/entitis/products_entiti.dart';
import 'package:products_store_app/presentation/screens/cart_screen.dart';
import 'package:products_store_app/presentation/view_model/cart_view_model.dart';

void main() {
  group("cart screen", () {
    final List<Product> productTest = [
      Product(
          quantity: 1,
          id: 2,
          title: "prducto 1",
          price: 10.0,
          description: "",
          image: ""),
    ];
    testWidgets('Prueba de botón añadir un producto ',
        (WidgetTester tester) async {
      cartViewModel.addToCart(productTest[0]);
      await tester.pumpWidget(const MaterialApp(
        home: CartScreen(),
      ));
      await tester.pumpAndSettle();

      final product = find.text("prducto 1");
      expect(product, findsOneWidget);
    });

    testWidgets('Prueba de botón incrementar producto',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: CartScreen(),
        ),
      );

      await tester.pumpAndSettle();

      final incrementButton = find.byKey(const Key("increment-product"));
      expect(incrementButton, findsOneWidget);
      await tester.tap(incrementButton);
      await tester.pumpAndSettle();

      final updatedQuantity = find.text("2");
      expect(updatedQuantity, findsOneWidget);
    });
  });
}
