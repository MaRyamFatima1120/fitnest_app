import 'package:fitnest_app/common/constants/global_variable.dart';
import 'package:fitnest_app/common/widgets/custom_text_field.dart';
import 'package:fitnest_app/src/themes/color_scheme.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../common/constants/app_icon.dart';
import '../../../common/constants/validation.dart';
import '../../../common/widgets/custom_button.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  final _firstName = TextEditingController();
  final _lastName = TextEditingController();
  final _email = TextEditingController();
  final _password = TextEditingController();
  bool obscureText = true;

  bool _isAccepted = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Get.width * 0.1, vertical: Get.height * 0.1),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Text("Hey there,",
                  style: textTheme(context)
                      .titleSmall
                      ?.copyWith(color: Colors.black)),
              Text("Create an Account,",
                  style: textTheme(context)
                      .bodySmall
                      ?.copyWith(color: lightColorScheme.onSecondary)),
              SizedBox(
                height: Get.height * 0.02,
              ),
              CustomTextField(
                icon: SvgPicture.asset(
                  AppIcon.profile,
                  fit: BoxFit.cover,
                ),
                hintText: "First Name",
                controller: _firstName,
                validator: validateField,
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              CustomTextField(
                icon: SvgPicture.asset(
                  AppIcon.profile,
                  fit: BoxFit.cover,
                ),
                hintText: "Last Name",
                controller: _lastName,
                validator: validateField,
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              CustomTextField(
                icon: SvgPicture.asset(
                  AppIcon.message,
                  fit: BoxFit.contain,
                ),
                hintText: "Email",
                controller: _email,
                validator: validateEmail,
              ),
              SizedBox(
                height: Get.height * 0.01,
              ),
              CustomTextField(
                icon: SvgPicture.asset(
                  AppIcon.lock,
                  fit: BoxFit.contain,
                ),
                hintText: "Password",
                controller: _password,
                validator: validatePassword,
                suffixIcon: SvgPicture.asset(
                  AppIcon.password,
                  fit: BoxFit.contain,
                ),
              ),
              Row(
                children: [
                  Transform.scale(
                    scale: 1.3,
                    child: Checkbox(
                        value: _isAccepted,
                        side: BorderSide(
                          color: colorScheme(context)
                              .onSecondary
                              .withOpacity(0.4),
                        ),
                        onChanged: (bool? value) {
                          setState(() {
                            _isAccepted = value ?? false;
                          });
                        }),
                  ),
                  Expanded(
                    child: RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        text: "By continuing you accept our ",
                        style: textTheme(context).titleSmall?.copyWith(
                              fontSize: 10,
                              fontWeight: FontWeight.w400,
                            ),
                        children: [
                          TextSpan(
                              text: "Privacy Policy",
                              style: textTheme(context).titleSmall?.copyWith(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.underline,
                                  decorationColor: colorScheme(context)
                                      .onSecondary
                                      .withOpacity(0.4)),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {}),
                          const TextSpan(text: " and "),
                          TextSpan(
                              text: "Terms of Use",
                              style: textTheme(context).titleSmall?.copyWith(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w400,
                                  decoration: TextDecoration.underline,
                                  decorationColor: colorScheme(context)
                                      .onSecondary
                                      .withOpacity(0.4)),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {}),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              /*if(!_isAccepted)
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text("You must accept the Terms & Conditions.",
                  style: textTheme(context).titleSmall?.copyWith(
                    color: colorScheme(context).error
                  ),
                  ),
                )*/

              SizedBox(height: Get.height* 0.11,),
              CustomButton(
                pressed: () {

                },
                text: "Register",
                width: Get.width * 0.7,
                height: Get.height * 0.064,
                gradient: LinearGradient(colors: [
                  colorScheme(context).primary,
                  colorScheme(context).secondary
                ]),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
