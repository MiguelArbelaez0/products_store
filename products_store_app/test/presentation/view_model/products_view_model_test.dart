import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:products_store_app/domain/entitis/products_entiti.dart';
import 'package:products_store_app/domain/use_cases/get_category_use_case.dart';
import 'package:products_store_app/domain/use_cases/get_product_use_case.dart';
import 'package:products_store_app/domain/use_cases/get_product_by_category_use_case.dart';
import 'package:products_store_app/presentation/interfaces/home_interface.dart';
import 'package:products_store_app/presentation/view_model/products_view_model.dart';

class GetCategoriesUseCaseMock extends Mock implements GetCategoriesUseCase {}

class GetProductsUseCaseMock extends Mock implements GetProductsUseCase {}

class GetProductByCategoryUseCaseMock extends Mock
    implements GetProductByCategoryUseCase {}

class HomeInterfaceMock extends Mock implements HomeInterface {}

void main() {
  final GetCategoriesUseCaseMock _getCategoriesUseCaseMock =
      GetCategoriesUseCaseMock();
  final GetProductByCategoryUseCaseMock _getProductByCategotyUseCaseMock =
      GetProductByCategoryUseCaseMock();
  final GetProductsUseCaseMock _getProductsUseCaseMock =
      GetProductsUseCaseMock();
  ArgsProductVieModel argsProductVieModel = ArgsProductVieModel(
      getCategoriesUseCaseTest: _getCategoriesUseCaseMock,
      getProductsUseCaseTest: _getProductsUseCaseMock,
      getCategoriesUseCase: _getCategoriesUseCaseMock,
      getProductByCategoryUseCaseTest: _getProductByCategotyUseCaseMock);
  late ProductsViewModel productsViewModel;

  final HomeInterfaceMock _homeInterfaceMock = HomeInterfaceMock();

  setUpAll(() {
    productsViewModel =
        ProductsViewModel(_homeInterfaceMock, argsProductVieModel);
  });
  group("Test vieModel cuando", () {
    test("invocando productos", () async {
      when(() => _getProductsUseCaseMock.invokeGetProducts()).thenAnswer(
          (invocation) async => <Product>[
                Product(
                    quantity: 1,
                    id: 00,
                    title: "",
                    price: 5,
                    description: "",
                    image: "")
              ]);
      when(() => _homeInterfaceMock.showLoading())
          .thenReturn((invocation) => null);

      when(() => _homeInterfaceMock.hideLoading())
          .thenReturn((invocation) => null);

      await productsViewModel.invokeProducts();

      expect(productsViewModel.products.length, 1);
      verify(() => _getProductsUseCaseMock.invokeGetProducts());
      verify(() => _homeInterfaceMock.showLoading());
      verify(() => _homeInterfaceMock.hideLoading());
    });
  });
  test("invocando categorias", () async {
    final List<String> mockCategories = ['electronics', 'jewelery'];
    when(() => _getCategoriesUseCaseMock.invokeGetCategories())
        .thenAnswer((_) async => mockCategories);

    await productsViewModel.invokeCategories();

    productsViewModel.categoryStrem.listen((event) {
      expect(event.length, mockCategories.length);
    });
  });

  test("invocando por categorias", () async {
    const String mockCategory = "category";
    final List<Product> productTest = [
      Product(
          quantity: 1, id: 2, title: "", price: 12, description: "", image: "")
    ];
    when(() => _getProductByCategotyUseCaseMock
        .invokeGetProductsByCategory(mockCategory));

    await productsViewModel.invokeGetProductsByCategory(mockCategory);

    productsViewModel.productsStream.listen((event) {
      expect(event, productTest);
    });
  });
}
