import 'package:flutter_test/flutter_test.dart';
import 'package:products_store_app/domain/entitis/products_entiti.dart';
import 'package:products_store_app/presentation/view_model/cart_view_model.dart';

void main() {
  group('CartViewModel Tests', () {
    final product = Product(
      id: 1,
      title: 'Product 1',
      price: 10.0,
      description: 'Description ',
      image: 'image',
      quantity: 1,
    );
    test('addToCart ', () {
      cartViewModel.addToCart(product);

      expect(cartViewModel.products.length, 1);
      expect(cartViewModel.products[0].id, product.id);
    });

    test('incrementQuantity ', () {
      cartViewModel.addToCart(product);

      cartViewModel.incrementQuantity(product);

      expect(cartViewModel.products[0].quantity, 3);
    });

    test('decrementQuantity', () {
      cartViewModel.addToCart(product);

      cartViewModel.decrementQuantity(product);

      expect(cartViewModel.products[0].quantity, 3);
    });
  });
}
