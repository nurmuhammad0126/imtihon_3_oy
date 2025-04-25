import 'package:flutter_3_oy_imtixon/data/remote_datasource/category_remote_datasource.dart';
import 'package:flutter_3_oy_imtixon/models/category_model.dart';

class CategoryViewModel {
  final CategoryRemoteDatasource _repo = CategoryRemoteDatasource();

  //! Get all categories
  Future<List<CategoryModel>?> getCategories() async {
    return await _repo.getCategories();
  }

  //! Add a new category
  Future<bool> addCategory(CategoryModel category) async {
    return await _repo.addCategory(category);
  }

  //! Delete a category by ID
  Future<bool> deleteCategory(String categoryId) async {
    return await _repo.deleteCategory(categoryId);
  }

  //! Update a category by ID
  Future<bool> updateCategory(String categoryId, CategoryModel category) async {
    return await _repo.updateCategory(categoryId, category);
  }
}
