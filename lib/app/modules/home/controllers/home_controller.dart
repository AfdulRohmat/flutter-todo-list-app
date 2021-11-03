import 'package:flutter/cupertino.dart';
import 'package:todo_app_getx/app/data/providers/product_model_provider.dart';
import 'package:uuid/uuid.dart';
import 'package:get/get.dart';
import 'package:todo_app_getx/app/data/models/product_model_model.dart';

class HomeController extends GetxController {
  var listProducts = List<ProductModel>.empty().obs;

  @override
  void onInit() {
    // getAllProduct();
    super.onInit();
  }

  // method message error
  void messageError(String msg) {
    Get.defaultDialog(
        title: "Error",
        content: Text(
          msg,
          textAlign: TextAlign.center,
        ));
  }

  // Method get All Product
  // void getAllProduct() {
  //   ProductModelProvider().getAllProductModel().then((value) {
  //     listProducts = ProductModel(
  //           id: res['name'],
  //           name: paramNama,
  //           createdAt: date,
  //         );
  //   });
  // }

  // Method add Product
  void add(String paramNama) {
    if (paramNama == '') {
      messageError("Input harus diisi");
      //
    } else {
      final date = DateTime.now().toIso8601String();
      // var uuid = Uuid().toString();

      // Menghubungkan ke Firebase
      ProductModelProvider().postProductModel(paramNama, date).then(
        (res) {
          final dataProduct = ProductModel(
            id: res['name'],
            name: paramNama,
            createdAt: date,
          );

          listProducts.add(dataProduct);

          Get.back();
        },
      );
    }
  }

  // Method delete Product
  void delete(String paramId) {
    // Menghubungkan ke Firebase
    ProductModelProvider().deleteProductModel(paramId).then((_) {
      listProducts.removeWhere((element) => element.id == paramId);
    });
  }

  // Method untuk findById dari variable.obs
  ProductModel findById(String paramId) {
    return listProducts.firstWhere((element) => element.id == paramId);
  }

  // Method edit Product
  void edit(String paramId, String paramNama) {
    final tangkapId = findById(paramId);

    // Menghubungkan ke Firebase
    ProductModelProvider().editProductModel(paramId, paramNama).then((value) {
      tangkapId.name = paramNama;
      listProducts.refresh();

      Get.back();
    });
  }
}
