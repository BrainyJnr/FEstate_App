import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get_storage/get_storage.dart';
import 'package:iconsax/iconsax.dart';

import '../../../data/fValidator.dart';
import '../../model/user_model.dart';
import '../../utilis/sizes.dart';
import '../../utilis/texts.dart';
import '../controller/signup_controller.dart';
import '../terms/terms&conditon_checkbox.dart';

class fsignupform extends StatefulWidget {
  const fsignupform({
    super.key,
  });

  @override
  State<fsignupform> createState() => _fsignupformState();
}

class _fsignupformState extends State<fsignupform> {

  @override
  Widget build(BuildContext context) {
   final controller = Get.put(SignupController());
    return Form(
        key: controller.signupFormKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: TextFormField(
                        controller: controller.firstName,
                        style: TextStyle(color: Colors.white),
                        /// controller: controller.firstName,
                        validator: (value) =>
                            fValidator.validateEmptyText("First name", value),
                        expands: false,
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.white)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.white)),
                            labelText: "First Name",
                            labelStyle: TextStyle(
                              color: Colors
                                  .white, // Make the label text color white
                            ),
                            prefixIcon: Icon(Iconsax.user,color: Colors.white,)))),
                const SizedBox(
                  width: fSizes.spaceBtwInputFields,
                ),
                Expanded(
                    child: TextFormField(
                      style: TextStyle(color: Colors.white),
                      controller: controller.lastName,
                      validator: (value) =>
                          fValidator.validateEmptyText("Last name", value),
                      expands: false,
                      decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.white)),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.white)),
                          labelText: fTexts.lastName,
                          labelStyle: TextStyle(
                            color: Colors
                                .white, // Make the label text color white
                          ),
                          prefixIcon: Icon(Iconsax.user,color: Colors.white,)),
                    ))
              ],
            ),
            const SizedBox(
              height: fSizes.spaceBtwInputFields,
            ),

            /// Username
            TextFormField(
              style: TextStyle(color: Colors.white),
              validator: (value) =>
                  fValidator.validateEmptyText("Username", value),
              controller: controller.userName,
              expands: false,
              decoration:  InputDecoration(
                  labelStyle: TextStyle(
                    color: Colors
                        .white, // Make the label text color white
                  ),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white)),
                  labelText: fTexts.username,
                  prefixIcon: Icon(Iconsax.user_edit,color: Colors.white,)),
            ),
            SizedBox(
              height: fSizes.spaceBtwInputFields,
            ),

            /// Email
            TextFormField(
              style: TextStyle(color: Colors.white),
                validator: (value) => fValidator.validateEmail(value),
              controller: controller.email,
              decoration:  InputDecoration(
                labelStyle: TextStyle(
                  color: Colors
                      .white, // Make the label text color white
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white)),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.white)),
                labelText: fTexts.email,
                prefixIcon: Icon(Iconsax.direct,color: Colors.white,),
              ),
            ),
            SizedBox(
              height: fSizes.spaceBtwInputFields,
            ),

            /// Phone Number
            TextFormField(
              style: TextStyle(color: Colors.white),
               validator: (value) => fValidator.validatePhoneNumber(value),
                controller: controller.phoneNumber,
                decoration: InputDecoration(
                    labelStyle: TextStyle(
                      color: Colors
                          .white, // Make the label text color white
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: const BorderSide(color: Colors.white)),
                  enabledBorder:  OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide(color: Colors.white)),
                  labelText: fTexts.phoneNo,
                    focusColor: Colors.white,

                    prefixIcon: const Icon(Iconsax.call,color: Colors.white,)),
                ),
            const SizedBox(
              height: fSizes.spaceBtwInputFields,
            ),

            /// Password
            TextFormField(
              style: TextStyle(color: Colors.white),
               validator: (value) => fValidator.validatePassword(value),
                controller: controller.password,
                obscureText: controller.hidePassword.value,
                decoration: InputDecoration(
                    labelStyle: TextStyle(
                      color: Colors
                          .white, // Make the label text color white
                    ),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide(color: Colors.white)),
                    labelText: fTexts.password,
                    prefixIcon: Icon(Iconsax.password_check,color: Colors.white,),
                    suffixIcon: IconButton(
                      onPressed: () => controller.hidePassword.value =
                      !controller.hidePassword.value,
                      icon:  Icon(controller.hidePassword.value ? Iconsax.eye_slash : Iconsax.eye),
                    )),
              ),
            const SizedBox(
              height: fSizes.spaceBtwInputFields,
            ),

            const SizedBox(height: 18),

            /// Sign Up Button'
            SizedBox(width: double.infinity,child: ElevatedButton(
                style: ElevatedButton.styleFrom(side: BorderSide(color: Colors.blue),
                    backgroundColor: Colors.black,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))
                ),
                onPressed: () async {
                  try {
                    // Sign-up logic


                    // Ensure FirebaseAuth.currentUser is not null
                    final currentUser = FirebaseAuth.instance.currentUser;

                    if (currentUser != null) {
                      // After successful sign-up, pass the user details to the next step
                      await controller.sendOTP(
                        UserModel(
                          id: currentUser.uid, // Use the uid of the currently logged-in user
                          firstName: controller.firstName.text.trim(),
                          lastName: controller.lastName.text.trim(),
                          email: controller.email.text.trim(),
                          username: controller.userName.text.trim(),
                          phoneNumber: controller.phoneNumber.text.trim(),
                          profilePicture: '',
                          password: controller.password.text.trim(),
                        ),
                      );

                      // Show success message or navigate
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Sign-up successful')),
                      );
                    } else {
                      // If currentUser is null, show error
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Error: User is not authenticated')),
                      );
                    }
                  } catch (e) {
                    // Handle error during sign-up
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Error: $e')),
                    );
                  }
                },
                child: Text("Sign Up",style: TextStyle(color: Colors.blue),)),),
    ]));
  }
}
