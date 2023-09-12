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
      final addProduct = find.byKey(const Key("product-widget"));
      await tester.pumpAndSettle();
      expect(addProduct, findsOneWidget);
    });
    testWidgets("increment-product", (tester) async {
      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      final incrementProduct = find.byKey(
        const Key("increment-product"),
      );
      await tester.pumpAndSettle();
      expect(incrementProduct, findsOneWidget);
    });
  });
}
