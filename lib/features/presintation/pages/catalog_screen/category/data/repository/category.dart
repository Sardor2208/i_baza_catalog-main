


import '../data_source/mock_data.dart';
import '../model/category.dart';

class CategoryRepository {
  Future<List<CategoryModel>> getCategory()async {
    Future.delayed(const Duration(seconds: 3));

    return (categoryData['category']as List).map((e) => CategoryModel.fromJson(e)).toList();

  }

  Future<CategoryModel> createCategory({
    required String type,
    required String img,
  }) async {

    await Future.delayed(const Duration(seconds: 3),);

    if (type.isEmpty || type.length < 3) {
      throw Exception('Type is invalid');
    }
    final newCategory = CategoryModel(
      id: (categoryData['category'] as List).lastOrNull['id'] + 1 ?? 0,
      type: type,
      img: img,

    );

    categoryData['category'].add(
      {
        "id": newCategory.id,
        "type": newCategory.type,
        "img": newCategory.img,
      },

    );

    return newCategory;
  }


}