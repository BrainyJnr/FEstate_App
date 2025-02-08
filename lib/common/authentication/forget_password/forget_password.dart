import 'package:email_otp/email_otp.dart';
import 'package:estateapp1/common/authentication/forget_password/password_submit.dart';
import 'package:estateapp1/common/authentication/signup/signup_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../../data/fValidator.dart';
import '../../utilis/sizes.dart';
import '../../utilis/texts.dart';
import '../controller/forget_password_controller.dart';

class forgetPassword extends StatelessWidget {
  const forgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ForgetPasswordController());
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.all(fSizes.defaultSpace),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Headings
            Text(
              fTexts.forgetPasswordTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(
              height: fSizes.spaceBtwItems,
            ),
            Text(
              fTexts.forgetPasswordSubTitle,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            const SizedBox(
              height: 19,
            ),

            /// Text Field
            Form(
              key: controller.forgetPasswordFormKey,
              child: TextFormField(
                controller: controller.email,
                validator: fValidator.validateEmail,
                decoration: const InputDecoration(
                    labelText: fTexts.email,
                    prefixIcon: Icon(Iconsax.direct_right)),
              ),
            ),
            SizedBox(
              height: fSizes.spaceBtwSections,
            ),

            /// Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () =>  controller.sendPasswordResetEmail(),
                  child: const Text(fTexts.submit)),
            )
          ],
        ),
      ),
    );
  }
}

