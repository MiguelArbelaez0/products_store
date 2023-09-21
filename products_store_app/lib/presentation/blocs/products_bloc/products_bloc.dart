import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:products_store_app/domain/entitis/products_entiti.dart';
import 'package:products_store_app/presentation/blocs/products_bloc/products_events.dart';
import 'package:products_store_app/presentation/blocs/products_bloc/products_states.dart';

import '../../../domain/use_cases/get_category_use_case.dart';
import '../../../domain/use_cases/get_product_by_category_use_case.dart';
import '../../../domain/use_cases/get_product_use_case.dart';

class ArgsProductVieModel {
  final GetProductsUseCase _getProductsUseCase;
  final GetCategoriesUseCase _getCategoriesUseCase;
  final GetProductByCategoryUseCase _getProductByCategoryUseCase;
  ArgsProductVieModel(
      {GetCategoriesUseCase? getCategoriesUseCaseTest,
      GetProductsUseCase? getProductsUseCaseTest,
      GetProductByCategoryUseCase? getProductByCategoryUseCaseTest,
      GetCategoriesUseCase? getCategoriesUseCase})
      : _getCategoriesUseCase =
            getCategoriesUseCaseTest ?? GetCategoriesUseCase(),
        _getProductsUseCase = getProductsUseCaseTest ?? GetProductsUseCase(),
        _getProductByCategoryUseCase =
            getProductByCategoryUseCaseTest = GetProductByCategoryUseCase();
}

class ProductBloc extends Bloc<ProductsEvent, ProductsStates> {
  final ArgsProductVieModel _argsProductVieModel;
  ProductBloc(this._argsProductVieModel) : super(initialState) {
    on<GetProductsEvent>((event, emit) => invokeProducts(event, emit));
  }

  invokeProducts(GetProductsEvent event, Emitter<ProductsStates> emit) async {
    emit(ShowLoadingState(state.modelData));
    final List<Product> products =
        await _argsProductVieModel._getProductsUseCase.invokeGetProducts();
    emit(HideLoadingState(state.modelData.copyWith(products: products)));
  }

  static HideLoadingState get initialState => HideLoadingState(ModelData());
}
