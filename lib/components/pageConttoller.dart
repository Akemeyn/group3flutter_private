import 'package:get/get.dart';
import 'package:flutter/material.dart';

class PageControllerManager extends GetxController {
  var pageController = PageController();
  var selectedIndex = 0.obs;

  void changePage(int index) {
    selectedIndex.value = index;
    pageController.jumpToPage(index);
  }
}
