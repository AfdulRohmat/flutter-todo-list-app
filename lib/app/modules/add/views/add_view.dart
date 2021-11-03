import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todo_app_getx/app/modules/home/controllers/home_controller.dart';

import '../controllers/add_controller.dart';

class AddView extends GetView<AddController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Product'),
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
                hintText: 'Masukkan Nama Produk',
              ),
              onEditingComplete: () => Get.find<HomeController>()
                  .add(controller.listViewController.text),
            ),
            SizedBox(height: 16),
            ElevatedButton(
                onPressed: () {
                  Get.find<HomeController>()
                      .add(controller.listViewController.text);
                },
                child: Text('Add Produt'))
          ],
        ),
      ),
    );
  }
}
