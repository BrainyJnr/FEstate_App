import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../model/user_model.dart';
import '../../utilis/images.dart';
import '../../utilis/sizes.dart';
import '../../widgets/loader/ffullscreen_loader.dart';
import '../../widgets/loader/floader.dart';
import '../../widgets/manager/network_manager.dart';
import '../login/login_screen.dart';
import '../repostries/auth_repository.dart';
import '../repostries/user_repostry.dart';



class UserController extends GetxController {
  static UserController get instance => Get.find();

  final profileLoading = false.obs;
  Rx<UserModel> user = UserModel.empty().obs;


  final userRepository = Get.put(UserRepository());
  final imageUploading = false.obs;
  final hidePassword = false.obs;
  final verifyPassword = TextEditingController();
  final verifyEmail = TextEditingController();
  GlobalKey<FormState> reAuthFormKey = GlobalKey<FormState>();


  @override
  void onInit() {
    super.onInit();
    fetchUserRecord();
  }

  /// Fetch user Record
  Future<void> fetchUserRecord() async {
    try {
      profileLoading.value = true;
      final user = await userRepository.fetchUserDetails();
      this.user(user);
    } catch (e) {
      user(UserModel.empty());
    } finally {
      profileLoading.value = false;
    }
  }

  /// Save user Record from any Registration provider
  Future<void> saveUserRecord(UserCredential? userCredentials) async {
    try {
      // First Update Rx User and then check if user data is already stored. if not store new data.
      await fetchUserRecord();

      // if no record already stored.
      if (user.value.id.isEmpty) {
        if (userCredentials != null) {
          // Convert Name to First and Last Name
          final nameParts =
          UserModel.nameParts(userCredentials.user!.displayName ?? "");
          final username =
          UserModel.generateUsername(userCredentials.user!.displayName ?? "");

          // Map Data
          final user = UserModel(
            id: userCredentials.user!.uid,
            firstName: nameParts[0],
            lastName: nameParts[0],
            username: username,
            email: userCredentials.user!.email ?? "",
            phoneNumber: userCredentials.user!.phoneNumber ?? "",
            profilePicture: userCredentials.user!.photoURL ?? "",
            password: "",
          );

          // Save user data
          await userRepository.saveUserRecord(user);
        }
      }
    } catch (e) {
      fLoaders.warningSnackBar(
        title: "Data not Saved",
        message:
        "Something went wrong while saving your information. You can re-save your data in your Profile",
      );
    }
  }

  /// Delete Account Warning
  void deleteAccountWarningPopup() {
    Get.defaultDialog(
        contentPadding: EdgeInsets.all(fSizes.md),
        title: "Delete Account",
        middleText: "Are you sure you want to delete your account permanently? This action is not reversible and all of your data will be removed permanently",
        confirm: ElevatedButton(onPressed: () async => deleteUserAccount(),
          style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red, side: BorderSide(color: Colors.red)),
          child: Padding(padding: EdgeInsets.symmetric(horizontal: fSizes.lg),
            child: Text("Delete"),),
        ),
        cancel: OutlinedButton(
            child: Text("Cancel"),
            onPressed: () => Navigator.of(Get.overlayContext!).pop())
    );
  }

  /// Delete User Account
  void deleteUserAccount() async {
    try {
      fFullScreenLoader.openLoadingDialog("Processing", fImages.Animation1);

      /// First re-authenticate user
      final auth = AuthenticationRepository.instance;
      final provider = auth.authUser!
          .providerData
          .map((e) => e.providerId)
          .first;
      if (provider.isNotEmpty) {
        // Re verify Auth Email
        if (provider == "google.com") {
          await auth.signInWithGoogle();
         // await auth.deleteAccount();
          fFullScreenLoader.stopLoading();
          Get.offAll(() => LoginScreen());
        } else if (provider == "password") {
          fFullScreenLoader.stopLoading();
        //  Get.to(() => ReAuthLoginForm());
        }
      }
    } catch (e) {
      fFullScreenLoader.stopLoading();
      fLoaders.warningSnackBar(title: "Oh Snap!!!!!!!!!!!!!!!!", message: e.toString());
    }
  }

  /// -- RE-AUTHENTICATE before deleting
  Future<void> reAuthenticateEmailAndPasswordUser() async {
      fFullScreenLoader.openLoadingDialog("Processing", fImages.Animation1);

      // Check Internet
      final isConnected = await NetworkManager.instance.isConnected();
      if (!isConnected) {
        fFullScreenLoader.stopLoading();
        return;
      }
  }
  /// Upload Profile Image
  uploadUserProfilePicture() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery,
          imageQuality: 70,
          maxHeight: 512,
          maxWidth: 512);
      if (image != null) {
        imageUploading.value = true;
        // Upload Image
        final imageUrl = await userRepository.uploadImage("Estate/Images/Profile/", image);

        // update User Image Record
        Map<String, dynamic> json = {"ProfilePicture": imageUrl};
        await userRepository.updateSingleField(json);

        user.value.profilePicture = imageUrl;
        user.refresh();

        fLoaders.successSnackBar(title: "Congratulations",
            message: "Your Profile Image has been updated!");

      }
    } catch (e) {
      fLoaders.errorSnackBar(
          title: "Oh Snap", message: "Something went wrong: $e");
    }
    finally{

      imageUploading.value = false;
    }
  }}
