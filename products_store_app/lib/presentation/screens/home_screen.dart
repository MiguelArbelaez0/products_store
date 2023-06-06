import 'package:flutter/material.dart';
import 'package:products_store_app/presentation/screens/widgets/categories.widget.dart';
import 'package:products_store_app/presentation/screens/widgets/product_widget.dart';
import 'package:products_store_app/presentation/view_model/products_view_model.dart';

import '../../domain/entitis/products_entiti.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ProductsViewModel productsViewModel = ProductsViewModel();

  @override
  void initState() {
    productsViewModel.invokeProducts();
    productsViewModel.invokeCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista de productos'),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 200,
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
                    return CategoriesWidget(
                      text: categories[index],
                    );
                  },
                );
              },
            ),
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
                    mainAxisSpacing: 20,
                  ),
                  padding: const EdgeInsets.only(top: 20),
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
}
