import '../../data/repository_impl/category_impl_repository.dart';
import '../repository/category_repository.dart';

class GetCategoriesUseCase {
  final CategoryRepository _categoryRepository;

  GetCategoriesUseCase({CategoryRepository? categoryRepository})
      : _categoryRepository = categoryRepository ?? CategoryRepositoryImpl();

  Future<List<String>> invokeGetCategories() async {
    return _categoryRepository.onGetCategories();
  }
}
