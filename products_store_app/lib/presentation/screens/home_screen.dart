import 'package:flutter/material.dart';
import 'package:products_store_app/presentation/interfaces/home_interface.dart';
import 'package:products_store_app/presentation/screens/widgets/categories.widget.dart';

import 'package:products_store_app/presentation/screens/widgets/product_widget.dart';
import 'package:products_store_app/presentation/view_model/products_view_model.dart';

import '../../domain/entitis/products_entiti.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> implements HomeInterface {
  final ProductsViewModel productsViewModel = ProductsViewModel();

  @override
  void initState() {
    productsViewModel.invokeProducts();
    productsViewModel.invokeCategories();

    super.initState();
  }

  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Lista de productos'),
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 50,
          ),
          SizedBox(
            height: 70,
            child: StreamBuilder<List<String>>(
              stream: productsViewModel.categoryStrem,
              initialData: const [],
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                final List<String> categories = snapshot.data;
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(top: 20),
                  itemCount: categories.length,
                  itemBuilder: (BuildContext context, int index) {
                    return StreamBuilder<int>(
                      stream: productsViewModel.indexStream,
                      builder: (BuildContext context,
                          AsyncSnapshot<int> indexSnapshot) {
                        return CategoriesWidget(
                          text: categories[index],
                          isSelected: indexSnapshot.data == index,
                          action: () async {
                            await productsViewModel.selectIndex(index);
                            await productsViewModel
                                .invokeGetProductsByCategory(categories[index]);
                          },
                        );
                      },
                    );
                  },
                );
              },
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          Expanded(
            child: StreamBuilder<List<Product>>(
              stream: productsViewModel.productsStream,
              initialData: const [],
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                final List<Product> products = snapshot.data;
                return GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                  itemCount: products.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ProductWidget(product: products[index]);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  void hideLoading() {}
  @override
  void showLoading() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(width: 20),
                Text('Cargando...'),
              ],
            ),
          ),
        );
      },
    );
  }
}
