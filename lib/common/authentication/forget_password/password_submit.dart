import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../function/fhelper_function.dart';
import '../../utilis/images.dart';
import '../../utilis/sizes.dart';
import '../../utilis/texts.dart';
import '../controller/forget_password_controller.dart';
import '../login/login_screen.dart';

class ResetPasswordScreen extends StatelessWidget {
  const ResetPasswordScreen({super.key, required this.email});

  final String email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(onPressed: () => Get.back(), icon: const Icon(CupertinoIcons.clear))
        ],
      ),
      body:  SingleChildScrollView(
        child: Padding(padding: EdgeInsets.all(fSizes.defaultSpace),
          child: Column(
            children: [
              /// Image
              Image(image: const AssetImage(fImages.AppLogo),width: fHelperFunctions.screenWidth() * 6,),
              const SizedBox(height: fSizes.spaceBtwSections,),

              /// Title & SubTitle
              Text(email, style: Theme.of(context).textTheme.titleLarge, textAlign: TextAlign.center,),
              const SizedBox(height: fSizes.spaceBtwItems,),
              Text(fTexts.changeYourPasswordSubTitle, style: Theme.of(context).textTheme.labelMedium, textAlign: TextAlign.center,),
              const SizedBox(height: fSizes.spaceBtwItems,),

              /// Buttons
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(onPressed: () => Get.offAll(() => const LoginScreen()),child: const Text(fTexts.done),),
              ),
              const SizedBox(height: fSizes.spaceBtwItems,),
              SizedBox(
                width: double.infinity,
                child: TextButton(onPressed: () => ForgetPasswordController.instance.resendPasswordResetEmail(email),child: const Text(fTexts.resendEmail),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
