import '../../domain/repository/category_repository.dart';
import '../remote_data_source/category_data_source.dart';

class CategoryRepositoryImpl extends CategoryRepository {
  final CategoryDataSource _categoryDataSource;

  CategoryRepositoryImpl({CategoryDataSource? categoryDataSource})
      : _categoryDataSource = categoryDataSource ?? CategoryDataSource();

  @override
  Future<List<String>> onGetCategories() {
    // TODO: implement onGetCategories
    throw UnimplementedError();
  }
}
