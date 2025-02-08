import 'package:email_otp/email_otp.dart';
import 'package:estateapp1/common/authentication/verification/verify_otp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../model/user_model.dart';
import '../../utilis/images.dart';
import '../../widgets/loader/ffullscreen_loader.dart';
import '../../widgets/loader/floader.dart';
import '../../widgets/manager/network_manager.dart';
import '../repostries/auth_repository.dart';
import '../repostries/user_repostry.dart';



class SignupController extends GetxController {
  static SignupController get instance => Get.find();

  /// Variables
  final hidePassword = true.obs;
  final privacyPolicy = true.obs;
  final isOTPSent = false.obs;
  final isLoading = false.obs;

  final email = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final firstName = TextEditingController();
  final phoneNumber = TextEditingController();

  GlobalKey<FormState> signupFormKey = GlobalKey<FormState>();

  /// -- Send OTP
  /// -- Send OTP
  /// -- Send OTP
  Future<void> sendOTP(UserModel user) async {
    try {
      if (email.text.trim().isNotEmpty) {
        isLoading.value = true;

        final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(
            email.text.trim(), password.text.trim());

        // Simulate OTP sending logic (replace with actual service call)
        bool isSent = await EmailOTP.sendOTP(email: email.text.trim());

        isLoading.value = false;

        if (isSent) {
          isOTPSent.value = true;
          fLoaders.successSnackBar(
            title: "OTP Sent",
            message: "OTP has been sent to your email. Please verify.",
          );

          // Navigate to OTP verification screen and pass user data
          Get.to(() => VerifyOTP(
            email: email.text.trim(),
            user: user,
          ));
        } else {
          fLoaders.errorSnackBar(
            title: "Error",
            message: "Failed to send OTP. Please try again.",
          );
        }
      }
    } catch (e) {
      isLoading.value = false;
      fLoaders.errorSnackBar(title: "Error", message: e.toString());
    }
  }

  /// -- Signup
  /// -- Signup
  void signup() async {
    try {
      // Start Loading
      fFullScreenLoader.openLoadingDialog(
        "We are processing your information...",
        fImages.Animation1,
      );

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        fFullScreenLoader.stopLoading();
        return;
      }

      // Form Validation
      if (!signupFormKey.currentState!.validate()) {
        fFullScreenLoader.stopLoading();
        return;
      }

      // Register user in Firebase Authentication
      final userCredential = await AuthenticationRepository.instance.registerWithEmailAndPassword(
        email.text.trim(),
        password.text.trim(),
      );

      // Create a new user object
      final newUser = UserModel(
        id: userCredential.user!.uid,
        firstName: firstName.text.trim(),
        lastName: lastName.text.trim(),
        username: userName.text.trim(),
        email: email.text.trim(),
        password: password.text.trim(),
        phoneNumber: phoneNumber.text.trim(),
        profilePicture: "", // Profile picture can be updated later
      );

      // Send OTP and pass user data
      await sendOTP(newUser);

      // Remove Loader
      fFullScreenLoader.stopLoading();
    } catch (e) {
      fFullScreenLoader.stopLoading();
      fLoaders.errorSnackBar(
        title: "Oh Snap!",
        message: e.toString(),
      );
    }
  }
}
