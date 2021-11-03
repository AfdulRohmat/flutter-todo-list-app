import 'package:get/get.dart';

import '../models/product_model_model.dart';

class ProductModelProvider extends GetConnect {
  final url =
      "https://todo-app-getx-190cb-default-rtdb.asia-southeast1.firebasedatabase.app/";

  // Get Product
  Future<dynamic> getAllProductModel() async {
    await get('$url' + 'products.json');
  }

  // Post Product
  Future<dynamic> postProductModel(String paramNama, String date) async {
    final response = await post(
      '$url' + 'products.json',
      {"name": paramNama, "createdAt": date},
    );

    return response.body;
  }

  // Delete Product
  Future<dynamic> deleteProductModel(String id) async =>
      await delete('$url' + 'products/$id.json');

  // Patch Product
  Future<dynamic> editProductModel(paramId, paramNama) async =>
      await patch('$url' + 'products/$paramId.json', {
        "name": paramNama,
      });
}
