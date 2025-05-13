import 'package:apptours/core/controllers/commands.dart';
import 'package:apptours/core/controllers/controllers.dart';
import 'package:apptours/core/model/category.dart';
import 'package:apptours/core/services/api_service.dart';
import 'package:apptours/main.dart';

class LoadCategoriesCommand implements AsyncListCommand<void, Category> {
  @override
  Future<List<Category>> execute(_) {
    return di.get<ApiService>().fetchCategories();
  }
}

class CategoriesListStore extends ListStore<void, Category> {
  CategoriesListStore() : super(LoadCategoriesCommand());
}
