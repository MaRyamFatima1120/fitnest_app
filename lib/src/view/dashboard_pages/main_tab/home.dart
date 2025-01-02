
import 'package:fitnest_app/common/constants/app_icon.dart';
import 'package:fitnest_app/common/constants/app_image.dart';
import 'package:fitnest_app/common/constants/global_variable.dart';
import 'package:fitnest_app/src/themes/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SafeArea(
        child: SingleChildScrollView(
          padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: Flex(
            direction: Axis.vertical,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Welcome Back,",
                          style: textTheme(context)
                              .titleSmall?.copyWith(
                            fontSize: 12
                          ),

                              ),
                      Text("Stefani Wong",
                          style: textTheme(context)
                              .bodySmall
                              ?.copyWith(color: lightColorScheme.onSecondary,fontSize: 20)),
                    ],
                  ),
                  IconButton(onPressed:(){} , icon:SvgPicture.asset(AppIcon.notificationIcon,width: 25,height: 25,)

                  ),
                ],
              ),
              SizedBox(height: Get.height * 0.02,),
              Container(
                width: Get.width,
                height: Get.height * 0.25,
                padding:const EdgeInsets.symmetric(horizontal: 20.0,vertical: 30.0),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    colorScheme(context).primary,
                    colorScheme(context).secondary
                  ]),
                  image:const DecorationImage(image:  AssetImage(
                    AppImage.dotsImage,

                  ),
                    fit: BoxFit.contain,),
                  borderRadius: BorderRadius.circular(20)
                ),
                child: Row(
                  children:  [
                      Column(

                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text("BMI (Body Mass Index)",
                              style: textTheme(context)
                                  .bodyLarge?.copyWith(fontSize:16)
                                  ),

                          Text("You have a normal weight",
                              style: textTheme(context)
                                  .bodyLarge?.copyWith(fontSize:11,fontWeight: FontWeight.normal)
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: ElevatedButton(onPressed: (){}, child:  Padding(
                              padding: const EdgeInsets.all(16.0),
                              child: Text("View More",
                                  style: textTheme(context)
                                      .bodyLarge?.copyWith(fontSize:14)
                              ),
                            ),),
                          ),


                        ],
                      )
                  ],
                )
              ),
              SizedBox(height: Get.height * 0.02,),
            ],
            
          ),
        ),
      )
    );
  }
}
