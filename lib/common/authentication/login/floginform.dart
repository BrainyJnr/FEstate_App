import 'package:estateapp1/common/authentication/forget_password/forget_password.dart';
import 'package:estateapp1/common/authentication/signup/signup_screen.dart';
import 'package:estateapp1/data/fValidator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:iconsax/iconsax.dart';

import '../../utilis/sizes.dart';
import '../../utilis/texts.dart';
import '../controller/login_controller.dart';

class flogin_form extends StatelessWidget {
  const flogin_form({
    super.key,
    required this.controller,
  });

  final LoginController controller;

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Form(
      key: controller.loginFormKey,
        child: Column(
          children: [
            ///Email
            TextFormField(
              controller: controller.email,
                validator: (value) => fValidator.validateEmail(value),
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white)),
                  focusColor: Colors.white,
                  prefixIcon: Icon(
                    Iconsax.direct_right,
                    color: Colors.white,
                  ),
                  labelText: "E-mail",
                  // Label text
                  labelStyle: TextStyle(
                    color: Colors
                        .white, // Make the label text color white
                  ),
                )),
            const SizedBox(
              height: fSizes.spaceBtwSections,
            ),

            ///Password
            Obx(
              () => TextFormField(
                controller: controller.password,
                validator: (value) => fValidator.validatePassword(value),
                style: TextStyle(color: Colors.white),
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white)),
                    focusColor: Colors.white,
                    labelText: "Password",
                    // Label text
                    labelStyle: TextStyle(
                      color: Colors
                          .white, // Make the label text color white
                    ),
                    prefixIcon: Icon(Iconsax.password_check,color: Colors.white,),
                    suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value =
                      !controller.hidePassword.value,
                      icon: Icon(controller.hidePassword.value
                          ? Iconsax.eye_slash
                          : Iconsax.eye,color: Colors.white,),
                    )),
              ),
            ),
            const SizedBox(
              height: fSizes.spaceBtwInputFields / 2,
            ),

            ///Remember Me & Forget Password
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Remember Me
                Row(
                  children: [
                    Obx(() => Checkbox(checkColor: Colors.blue,
                        focusColor: Colors.white,activeColor: Colors.white,
                        value: controller.rememberMe.value,
                        onChanged: (value) => controller.rememberMe.value =
                        !controller.rememberMe.value)),
                    const Text("Remember Me",style: TextStyle(color: Colors.white),),
                    SizedBox(
                      height: 5,
                    )
                  ],
                ),
                /// Forget Password
                TextButton(
                    onPressed: ()  => Get.to(forgetPassword()),
                    child: const Text(
                      fTexts.forgetpassword,
                      style: TextStyle(color: Colors.blue),
                    )),
              ],
            ),
            const SizedBox(
              height: fSizes.spaceBtwSections,
            ),

            SizedBox(width: double.infinity,child: ElevatedButton(
                style: ElevatedButton.styleFrom(side: BorderSide(color: Colors.blue),
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                ),
                onPressed: () => controller.emailAndPasswordSignIn(), child: Text("Sign In",style: TextStyle(color: Colors.blue),)),),

            SizedBox(height: 20,),

            SizedBox(width: double.infinity,child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    side: BorderSide(color: Colors.blue),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                ),
                onPressed: () => Get.to(SignupScreen()), child: Text("Create Account",style: TextStyle(color: Colors.blue),)),),


          ],
        ));
  }
}
