abstract class ProductsEvent {}

class GetProductsEvent extends ProductsEvent {}

class GetCategoriesEvent extends ProductsEvent {}

class GetProductsByCategoryEvent extends ProductsEvent {}

class SetCategoryEvent extends ProductsEvent {}

class SelectIndex extends ProductsEvent {}

class LoadInitialProductsEvent extends ProductsEvent {}
