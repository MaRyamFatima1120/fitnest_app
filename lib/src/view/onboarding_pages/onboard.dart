import 'package:fitnest_app/src/models/onboard_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/constants/global_variable.dart';
import '../../view_model/on_board_page/animated_controller.dart';

class OnboardViewPage extends StatefulWidget {
  const OnboardViewPage({super.key});

  @override
  State<OnboardViewPage> createState() => _OnboardViewPageState();
}

class _OnboardViewPageState extends State<OnboardViewPage> {
  final controller = OnboardingItems();
  final AnimatedController animatedController=Get.find();
  final PageController pageController = PageController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
          itemCount: controller.items.length,
          controller: pageController,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  controller.items[index].image,
                  fit: BoxFit.cover,
                  width: Get.width,
                  height: Get.height * 0.55,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 35.0, top: 45, bottom: 10),
                  child: Text(controller.items[index].title),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 35.0,
                  ),
                  child: Text(controller.items[index].descriptions,
                      style: textTheme(context).titleSmall),
                ),
                SizedBox(height: Get.height*0.15,),
                Padding(
                  padding:const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Stack(
                        clipBehavior: Clip.none,
                        alignment: Alignment.center,
                        children: [

                             SizedBox(
                              width: 70,
                              height: 70,
                              child: CircularProgressIndicator(
                                value:animatedController.animationValue.value,
                                valueColor:  AlwaysStoppedAnimation<Color>(
                                    colorScheme(context).primary),
                                backgroundColor: Colors.white, // Background color
                                strokeWidth: 3,
                              ),
                            ),

                          GestureDetector(
                            onTap: (){
                              animatedController.animatetoNextPage(
                                pageController,
                                index,

                              );
                            },
                            child: Container(
                              width: 60,
                              height: 60,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                gradient: LinearGradient(
                                  colors: [colorScheme(context).primary, colorScheme(context).secondary],
                                  begin: Alignment.topLeft,
                                  end: Alignment.bottomRight,
                                ),
                              ),
                              child: const Center(
                                child: Icon(
                                  Icons.arrow_forward_ios,
                                  size: 16,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            );
          }),

    );
  }
}
