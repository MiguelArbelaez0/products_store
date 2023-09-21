import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:products_store_app/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group("end-to-end test", () {
    testWidgets("add-product", (tester) async {
      await tester.pumpWidget(const MyApp());

      await tester.pumpAndSettle();

      final iconButtonAdd = find.byKey(const Key("product-widget"));

      expect(iconButtonAdd, findsWidgets);
    });
  });

  testWidgets("increment-product", (tester) async {
    await tester.pumpWidget(const MyApp());

    await tester.pumpAndSettle();

    final incrementButton = find.byKey(const Key("increment-product"));
    expect(incrementButton, findsOneWidget);
    await tester.pumpAndSettle();
    expect(incrementButton, findsOneWidget);
  });
  testWidgets("decrement-product", (tester) async {
    await tester.pumpWidget(const MyApp());
    await tester.pumpAndSettle();
    final decrementButton = find.byKey(const Key("decrement-product"));
    await tester.pumpAndSettle();
    expect(decrementButton, findsOneWidget);
  });
}
