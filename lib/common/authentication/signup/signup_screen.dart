import 'package:estateapp1/common/authentication/controller/login_controller.dart';
import 'package:estateapp1/common/authentication/signup/signup_form.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../utilis/sizes.dart';
import '../../utilis/texts.dart';
import '../login/flogin_divider.dart';
import '../login/fsocial_buttons.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(icon: Icon(Icons.arrow_back,color: Colors.white,),
          onPressed: () => Get.back(),
        ),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.all(fSizes.defaultSpace),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Title
                    Text(
                      fTexts.signUpTitle,
                      style: Theme.of(context).textTheme.headlineSmall!.apply(color: Colors.white),
                    ),
                    const SizedBox(
                      height: fSizes.spaceBtwSections,
                    ),

                    ///Form
                    fsignupform(),
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
                  ]))),
    );
  }
}
