import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:products_store_app/domain/entitis/products_entiti.dart';

import 'package:products_store_app/domain/use_cases/get_category_use_case.dart';
import 'package:products_store_app/domain/use_cases/get_product_by_category_use_case.dart';
import 'package:products_store_app/domain/use_cases/get_product_use_case.dart';
import 'package:products_store_app/presentation/screens/home_screen.dart';
import 'package:products_store_app/presentation/view_model/products_view_model.dart';

class GetCategoriesUseCaseMock extends Mock implements GetCategoriesUseCase {}

class GetProductsUseCaseMock extends Mock implements GetProductsUseCase {}

class GetProductByCategoryUseCaseMock extends Mock
    implements GetProductByCategoryUseCase {}

void main() {
  final GetProductsUseCaseMock _getProductUseCaseMock =
      GetProductsUseCaseMock();
  final GetCategoriesUseCaseMock _getCategoriesUseCaseMock =
      GetCategoriesUseCaseMock();
  final GetProductByCategoryUseCase _getProductByCategoryMock =
      GetProductByCategoryUseCaseMock();

  final ArgsProductVieModel argsProductVieModel = ArgsProductVieModel(
      getCategoriesUseCaseTest: _getCategoriesUseCaseMock,
      getProductsUseCaseTest: _getProductUseCaseMock,
      getProductByCategoryUseCaseTest: _getProductByCategoryMock);
  testWidgets('Test de botón "add" en ProductWidget',
      (WidgetTester tester) async {
    when(() => _getProductUseCaseMock.invokeGetProducts()).thenAnswer(
        (_) async => <Product>[
              Product(
                  quantity: 1,
                  id: 1,
                  title: "",
                  price: 12,
                  description: "",
                  image: "")
            ]);
    when(() => _getCategoriesUseCaseMock.invokeGetCategories())
        .thenAnswer((_) async => <String>["electronics"]);

    await tester.pumpWidget(
      MaterialApp(home: HomeScreen(argsViewModelTest: argsProductVieModel)),
    );

    await tester.pumpAndSettle();

    final addButton = find.byKey(const Key("product-widget"));

    expect(addButton, findsOneWidget);

    await tester.pumpAndSettle();
  });
}
