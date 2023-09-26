import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_store_app/presentation/blocs/products_bloc/products_bloc.dart';
import 'package:products_store_app/presentation/blocs/products_bloc/products_events.dart';
import 'package:products_store_app/presentation/blocs/products_bloc/products_states.dart';

class HomeScreen2 extends StatefulWidget {
  const HomeScreen2({super.key});

  @override
  State<HomeScreen2> createState() => _HomeScreen2State();
}

class _HomeScreen2State extends State<HomeScreen2> {
  late final ArgsProductVieModel _argsProductVieModel;

  late final ProductBloc _productBloc = ProductBloc(_argsProductVieModel);

  @override
  void initState() {
    super.initState();
    _productBloc.add(LoadInitialProductsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductBloc, ProductsStates>(
        bloc: _productBloc,
        builder: (context, state) {
          if (state is ShowLoadingState) {
            return const CircularProgressIndicator();
          }

          return Scaffold();
        },
      ),
    );
  }
}
