import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_store_app/presentation/blocs/products_bloc/products_bloc.dart';
import 'package:products_store_app/presentation/blocs/products_bloc/products_events.dart';
import 'package:products_store_app/presentation/blocs/products_bloc/products_states.dart';

import 'package:products_store_app/presentation/screens/widgets/categories.widget.dart';

import 'package:products_store_app/presentation/screens/widgets/product_widget.dart';
import 'package:products_store_app/presentation/view_model/cart_view_model.dart';
import 'package:products_store_app/presentation/view_model/products_view_model.dart';

import 'loading_widget.dart';

class HomeScreen extends StatefulWidget {
  final ArgsProductVieModel _argsProductVieModel;
  HomeScreen({super.key, ArgsProductVieModel? argsViewModelTest})
      : _argsProductVieModel = argsViewModelTest ?? ArgsProductVieModel();

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final ProductBloc _productBloc;

  @override
  void initState() {
    super.initState();
    _productBloc = ProductBloc(ArgsProductVieModel2())
      ..add(GetProductsEvent())
      ..add(GetCategoriesEvent());
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
                color: Colors.black,
                size: 30,
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<ProductBloc, ProductsStates>(
        bloc: _productBloc,
        builder: (context, state) {
          final products = state.modelData.products ?? [];
          final categories = state.modelData.categories ?? [];
          final indexSnapshot = state.modelData.selectIndex ?? 0;

          return Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              SizedBox(
                height: 70,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.only(top: 20),
                  itemCount: categories.length,
                  itemBuilder: (BuildContext context, int index) {
                    return CategoriesWidget(
                      text: categories[index],
                      isSelected: indexSnapshot == index,
                      action: () async {
                        _productBloc.add(SelectIndex(index: index));
                        _productBloc.add(GetProductsByCategoryEvent(
                            category: categories[index]));
                      },
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Expanded(
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                  padding: const EdgeInsets.only(top: 20, left: 10, right: 10),
                  itemCount: products.length,
                  itemBuilder: (BuildContext context, int index) {
                    final product = state.modelData.products?[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(
                          context,
                          '/detail_screen',
                          arguments: product,
                        );
                      },
                      child: Hero(
                        tag: product!.id,
                        child: ProductWidget(
                          product: product,
                          iconButton: IconButton(
                            key: const Key("product-widget"),
                            onPressed: () {
                              cartViewModel.addToCart(product);
                            },
                            icon: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }

  @override
  void showLoading() {
    AlertDialog loadingDialog = const AlertDialog(
      elevation: 0,
      backgroundColor: Colors.transparent,
      content: LoadingWidget(),
    );

    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (BuildContext context) {
        return loadingDialog;
      },
    );
  }
}
