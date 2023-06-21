import 'package:flutter/material.dart';
import 'package:products_store_app/presentation/interfaces/home_interface.dart';
import 'package:products_store_app/presentation/screens/widgets/categories.widget.dart';

import 'package:products_store_app/presentation/screens/widgets/product_widget.dart';
import 'package:products_store_app/presentation/view_model/cart_view_model.dart';
import 'package:products_store_app/presentation/view_model/products_view_model.dart';

import '../../domain/entitis/products_entiti.dart';
import 'widgets/loading_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with HomeInterface {
  // ProductsViewModel productsViewModel = ProductsViewModel();
  late final ProductsViewModel productsViewModel;

  @override
  void initState() {
    super.initState();
    productsViewModel = ProductsViewModel(this);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      productsViewModel.invokeProducts();
      productsViewModel.invokeCategories();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white24,
        actions: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/cart");
              },
              child: const Icon(
                Icons.shopping_cart,
                color: Colors.orange,
                size: 30,
              ),
            ),
          ),
        ],
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
                    return GestureDetector(
                      onTap: () {},
                      child: ProductWidget(
                        product: products[index],
                        tap: () {
                          cartViewModel.addToCart(products[index]);
                        },
                      ),
                    );
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
  void hideLoading() {
    Navigator.of(context).pop();

    setState(() {});
  }

  @override
  void showLoading() {
    AlertDialog alert = const AlertDialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: LoadingWidget(),
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
