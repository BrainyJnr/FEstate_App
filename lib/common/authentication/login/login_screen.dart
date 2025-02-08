import 'package:estateapp1/common/utilis/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../utilis/images.dart';
import '../../utilis/texts.dart';
import '../controller/login_controller.dart';
import 'flogin_divider.dart';
import 'floginform.dart';
import 'fsocial_buttons.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
        backgroundColor: Colors.black,
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(fSizes.defaultSpace),
                child: Column(children: [
                  Column(children: [
                    const Image(
                        width: 210,
                        height: 170,
                        image: AssetImage(fImages.AppLogo)),
                    Text(fTexts.loginTitle,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .apply(color: Colors.white)),
                    const SizedBox(
                      height: fSizes.md,
                    ),
                    Text(fTexts.loginSubTitle,
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .apply(color: Colors.white)),
                  ]),
                  SizedBox(
                    height: 30,
                  ),

                  ///Form
                  flogin_form(controller: controller),
                  const SizedBox(height: 15,),

                  fFormDivider(
                    dividerText: "Or Sign In With",
                    textStyle: TextStyle(
                      color: Colors.white, // Ensures the text is white
                      fontSize: 14, // Adjust the size if needed
                    ),
                  ),
                  const SizedBox(height: 10,),
                  /// Footer
                  fSocialButtons()
                ]))));
  }
}

