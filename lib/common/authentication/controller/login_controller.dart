import 'package:estateapp1/common/authentication/controller/user_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../features/navigation/bottom_navigation.dart';
import '../../../features/screens/home_screen.dart';
import '../../utilis/images.dart';
import '../../widgets/loader/ffullscreen_loader.dart';
import '../../widgets/loader/floader.dart';
import '../../widgets/manager/network_manager.dart';
import '../repostries/auth_repository.dart';

class LoginController extends GetxController {

  /// Variables
  final rememberMe = false.obs;
  final hidePassword = true.obs;
  final localStorage = GetStorage();
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final userController = Get.put(UserController());


  @override
  void onInit() {
    email.text = localStorage.read("REMEMBER_ME_EMAIL") ?? "";
    password.text = localStorage.read("REMEMBER_ME_PASSWORD") ?? "";
    super.onInit();

  }

  /// -- Email and PassConnectivity
  Future<void> emailAndPasswordSignIn() async {
    try {
      // Start Loading
      fFullScreenLoader.openLoadingDialog(
          "Logging You In...", fImages.Animation1);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        fFullScreenLoader.stopLoading();
        fLoaders.errorSnackBar(title: "No Internet", message: "Check your connection and try again.");
        return;
      }

      // Form Validation
      if (!loginFormKey.currentState!.validate()) {
        fFullScreenLoader.stopLoading();
        return;
      }

      // Save Data if Remember Me is Selected
      if (rememberMe.value) {
        localStorage.write("REMEMBER_ME_EMAIL", email.text.trim());
        localStorage.write("REMEMBER_ME_PASSWORD", password.text.trim());
      }

      // Login user using Email & Password Authentication
      final userCredentials = await AuthenticationRepository.instance
          .loginWithEmailAndPassword(email.text.trim(), password.text.trim());

      // Remove Loader
      fFullScreenLoader.stopLoading();

      // ✅ Navigate to Home Screen after successful login
      Get.offAll(() => BottomNavigation());

    } catch (e) {
      fFullScreenLoader.stopLoading();
      fLoaders.errorSnackBar(title: "Oh Snap", message: e.toString());
    }
  }

  /// -- Google SignIn Authentication
  Future<void> googleSignIn() async {
    try {
      // Start Loading
      fFullScreenLoader.openLoadingDialog("Logging You In", fImages.Animation1);

      // Check Internet Connectivity
      final isConnected = await NetworkManager.instance.isConnected();
      if(!isConnected) {
        fFullScreenLoader.stopLoading();
        return;
      }

      // Google Authentication
      final userCredentials = await AuthenticationRepository.instance.signInWithGoogle();

      // Save User Record
      await userController.saveUserRecord(userCredentials);

      // Remove Loader
      fFullScreenLoader.stopLoading();

      // Redirect
      //AuthenticationRepository.instance.screenRedirect();
    }catch (e) {
      // Remove Loader
      fFullScreenLoader.stopLoading();
      fLoaders.errorSnackBar(title: "Oh Snap", message: e.toString());
    }
  }



}