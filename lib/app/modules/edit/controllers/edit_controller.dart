import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_app_getx/app/modules/home/controllers/home_controller.dart';

class EditController extends GetxController {
  late TextEditingController listViewController = TextEditingController();

  @override
  void onInit() {
    listViewController;
    super.onInit();
  }

  @override
  void onClose() {
    listViewController.dispose();
    super.onClose();
  }
}
