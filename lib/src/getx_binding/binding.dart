
import 'package:get/get.dart';

import '../view_model/on_board_page/animated_controller.dart';



class BoardBinding implements Bindings{

  @override
  void dependencies(){
    Get.lazyPut(()=>AnimatedController());
  }
}