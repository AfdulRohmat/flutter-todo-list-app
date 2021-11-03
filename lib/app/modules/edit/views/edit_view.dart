import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todo_app_getx/app/modules/home/controllers/home_controller.dart';

import '../controllers/edit_controller.dart';

class EditView extends GetView<EditController> {
  @override
  Widget build(BuildContext context) {
    final dataFromCurrentId =
        Get.find<HomeController>().findById(Get.arguments);
    controller.listViewController.text = dataFromCurrentId.name!;

    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: ListView(
          children: [
            TextField(
              controller: controller.listViewController,
              autocorrect: false,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Prodct Name',
                hintText: 'Edit Nama Produk',
              ),
              onEditingComplete: () => Get.find<HomeController>()
                  .edit(Get.arguments, controller.listViewController.text),
            ),
            SizedBox(height: 16),
            ElevatedButton(
                onPressed: () {
                  Get.find<HomeController>()
                      .edit(Get.arguments, controller.listViewController.text);
                },
                child: Text('Edit Product'))
          ],
        ),
      ),
    );
  }
}
