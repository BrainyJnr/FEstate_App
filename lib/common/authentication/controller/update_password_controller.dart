import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class UpdatePasswordController extends GetxController {
  final GlobalKey<FormState> updatePasswordFormKey = GlobalKey<FormState>();
  final TextEditingController newPassword = TextEditingController();
  final TextEditingController confirmPassword = TextEditingController();
  final TextEditingController currentPassword = TextEditingController();

  // Method to reset password with reauthentication
  Future<void> resetPasswordWithOTP(String email, String currentPassword, String newPassword) async {
    try {
      // Get the current user
      User? user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        // User is not authenticated
        Get.snackbar('Error', 'Please log in first.');
        return;
      }

      if (newPassword != confirmPassword.text) {
        Get.snackbar('Error', 'Passwords do not match.');
        return;
      }

      // Re-authenticate the user with their current credentials
      AuthCredential credential = EmailAuthProvider.credential(email: email, password: currentPassword);
      await user.reauthenticateWithCredential(credential);

      // Now update the password
      await user.updatePassword(newPassword);

      // Notify user of success
      Get.snackbar('Success', 'Your password has been updated.');
    } catch (e) {
      // Handle errors such as sensitive issues or incorrect OTP
      Get.snackbar('Error', 'Failed to reset password: $e');
    }
  }
}
