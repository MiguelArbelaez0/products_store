import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:products_store_app/presentation/screens/home_screen.dart';
import 'package:products_store_app/presentation/screens/widgets/product_widget.dart';

// void main() {
//   testWidgets('Test de botón "add" en ProductWidget',
//       (WidgetTester tester) async {
//     // final CartViewModel cartViewModel = CartViewModel();
//     await tester.pumpWidget(
//       MaterialApp(home: HomeScreen()),
//     );

//     await tester.pumpAndSettle();

//     final addButton = find.byIcon(Icons.add);

//     expect(addButton, findsOneWidget);

//     await tester.tap(addButton);

//     await tester.pumpAndSettle();
//   });
// }
void main() {
  testWidgets(
    'Test button tap in ProductWidget',
    (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(
        home: HomeScreen(),
      ));

      await tester.pump();

      final productWidgetFinder = find.byType(ProductWidget);
      final productWidgetInstances = tester.widgetList(productWidgetFinder);

      for (var productWidgetInstance in productWidgetInstances) {
        await tester.tap(find.byWidget(productWidgetInstance));
        await tester.pump();

        expect(find.text('Button tapped'), findsOneWidget);
      }
    },
  );
}
