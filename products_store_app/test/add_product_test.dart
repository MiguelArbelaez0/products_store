import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:products_store_app/presentation/screens/home_screen.dart';
import 'package:products_store_app/presentation/view_model/cart_view_model.dart';

void main() {
  testWidgets(
    "add-to-cart-tap",
    (tester) async {
      // final CartViewModel cartViewModelMock = CartViewModel();
      await tester.pumpWidget(
        MaterialApp(home: HomeScreen()),
      );
      await tester.pumpAndSettle();
      final productWidget = find.byKey(const Key("product-widget"));
      expect(productWidget, findsOneWidget);

      await tester.tap(productWidget);
      await tester.pumpAndSettle();
    },
  );
}
