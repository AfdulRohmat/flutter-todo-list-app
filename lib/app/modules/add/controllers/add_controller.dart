import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class AddController extends GetxController {
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
