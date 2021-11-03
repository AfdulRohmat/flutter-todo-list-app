import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todo_app_getx/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';
import 'item_view.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('All Product'),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed(Routes.ADD);
              },
              icon: Icon(Icons.add),
            )
          ],
        ),
        body: Obx(
          () => controller.listProducts.isEmpty
              ? Center(
                  child: Text("Belum ada list produk"),
                )
              : ListView.builder(
                  itemCount: controller.listProducts.length,
                  itemBuilder: (context, index) {
                    return ItemView(controller.listProducts[index]);
                  },
                ),
        ));
  }
}
