import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AnimatedController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  var animationValue = 0.25.obs;
  final int totalPages = 4;

  @override
  void onInit() {
    super.onInit();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));

    animationController.addListener(() {
      animationValue.value = animationController.value;
    });
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    animationController.forward(from: 0.0).then((_) {
      animationValue.value = 0.25;
    });
  }

  void animatetoNextPage(PageController pageController,int currentIndex, ) {
    if (currentIndex + 1 < totalPages) {
      if (currentIndex == 0) {
        animationValue.value = 0.25;
        pageController.nextPage(duration: const Duration(milliseconds: 3),
            curve: Curves.easeInOut
        );
        animationController.forward(from: animationValue.value).then((_) {
          animationValue.value = (currentIndex + 1) / totalPages;
        });
      }
      double increment = (currentIndex + 1) / totalPages;
      animationController.forward(from: increment).then((_) {
        animationValue.value = increment;
      });
      pageController.nextPage(
        duration: const Duration(milliseconds: 3),
        curve: Curves.easeInOut,
      );
    } else {
      animationController.forward(from: 1.0).then((_) {
        animationValue.value = 1.0;
      });
      print("Last page reached");
    }
  }


  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

}
