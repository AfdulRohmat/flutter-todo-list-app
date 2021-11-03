import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:todo_app_getx/app/modules/home/controllers/home_controller.dart';
import 'package:todo_app_getx/app/routes/app_pages.dart';

class ItemView extends GetView<HomeController> {
  final listProductIndex;

  ItemView(this.listProductIndex);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(),
      title: Text(listProductIndex.name!),
      subtitle: Text(listProductIndex.createdAt!),
      trailing: IconButton(
        icon: Icon(Icons.delete_forever),
        onPressed: () {
          controller.delete(listProductIndex.id);
        },
      ),
      onTap: () {
        Get.toNamed(
          Routes.EDIT,
          arguments: listProductIndex.id,
        );
      },
    );
  }
}
