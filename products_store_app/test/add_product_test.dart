import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:products_store_app/presentation/screens/home_screen.dart';
import 'package:products_store_app/presentation/view_model/cart_view_model.dart';

void main() {
  testWidgets('Test de botón "add" en ProductWidget',
      (WidgetTester tester) async {
    // final CartViewModel cartViewModel = CartViewModel();
    await tester.pumpWidget(
      MaterialApp(home: HomeScreen()),
    );

    await tester.pumpAndSettle();

    final addButton = find.byIcon(Icons.add);

    expect(addButton, findsOneWidget);

    await tester.tap(addButton);

    await tester.pumpAndSettle();
  });
}
