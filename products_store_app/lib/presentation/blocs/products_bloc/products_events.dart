abstract class ProductsEvent {}

class GetProductsEvent extends ProductsEvent {}

class GetCategoriesEvent extends ProductsEvent {
  final List<String>? categories;
  GetCategoriesEvent({
    this.categories,
  });
}

class GetProductsByCategoryEvent extends ProductsEvent {
  final String category;
  GetProductsByCategoryEvent({
    required this.category,
  });
}

class SetCategoryEvent extends ProductsEvent {}

class SelectIndexEvent extends ProductsEvent {
  final int index;
  SelectIndexEvent({
    required this.index,
  });
}
