import 'package:fitnest_app/common/constants/global_variable.dart';
import 'package:fitnest_app/src/themes/color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: Get.width * 0.01,vertical: Get.height * 0.1),
        child: Center(
          child: Flex(
            direction: Axis.vertical,
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("Hey there,",style:textTheme(context).titleSmall?.copyWith(color: Colors.black)),
            Text("Create an Account,",style:textTheme(context).bodySmall?.copyWith(color: lightColorScheme.onSecondary)),
            Form(
              key: formKey,
                child:
              Column(
                children: [

                ],
              )
            )

          ],
          ),
        ),
      ),
    );
  }
}
