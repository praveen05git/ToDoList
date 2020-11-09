import 'package:flutter_plugin/models/category.dart';
import 'package:flutter_plugin/repositories/repository.dart';

class CategoryService {
  Repository _repository;

  CategoryService() {
    _repository = Repository();
  }

  saveCategory(Category category) async {
    return await _repository.insertData('CATEGORIES', category.categoryMap());
  }

  readCategories() async {
    return await _repository.readData('CATEGORIES');
  }
}
