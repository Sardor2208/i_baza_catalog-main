import 'package:i_baza_catalog/features/presintation/pages/catalog_screen/another_category/data/katalog_model/model.dart';

import '../data_source/catalog_mock_data.dart';
class ProductRepository {
  Future<List<ProductModel>> getCategory()async {
    Future.delayed(const Duration(seconds: 3));

    return (productData['product']as List).map((e) => ProductModel.fromJson(e)).toList();

  }

  Future<ProductModel> createCategory({
    required String img,
    required String name,
    required String title,
    required String in_price,
    required String price,
  }) async {

    await Future.delayed(const Duration(seconds: 3),);

    if (name.isEmpty || name.length < 3) {
      throw Exception('Type is invalid');
    }
    final newProduct = ProductModel(
      id: (productData['product'] as List).lastOrNull['id'] + 1 ?? 0,
      name: '',
      img: img,
      title: '',
      in_price: '',
      price: '',

    );

    productData['product'].add(
      {
        "id": newProduct.id,
        "img": newProduct.img,
        "name": newProduct.name,
        "title": newProduct.title,
        "in_price": newProduct.in_price,
        "price": newProduct.price,
      },

    );

    return newProduct;
  }


}