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

  final ProductBloc _productBloc = ProductBloc(_argsProductVieModel);

  @override
  void initState() {
    super.initState();
    _productBloc.add();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<ProductsEvent, ProductsStates>(
          bloc: _productBloc, builder: (context, state) {}),
    );
  }
}
