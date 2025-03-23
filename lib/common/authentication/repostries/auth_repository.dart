import 'package:estateapp1/common/authentication/signup/signup_screen.dart';
import 'package:estateapp1/features/navigation/bottom_navigation.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../data/flocal_storage.dart';
import '../login/login_screen.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// Variables
  final deviceStorage = GetStorage();
  final _auth = FirebaseAuth.instance;

  /// Get Authentication User Data
  User get authUser => _auth.currentUser!;


  /// Called from main.dart on app launch
  @override
  void onReady() {
    FlutterNativeSplash.remove();
    screenRedirect();
  }

  void screenRedirect() async {
    final user = _auth.currentUser;

    if (user != null) {
      if (user.emailVerified) {

        await fLocalStorage.init(user.uid);

        Get.offAll(() => const BottomNavigation());
      } else {
        Get.offAll(() => SignupScreen());
      }
    } else {
      // Local Storage
      //if (kDebugMode) {
      //  print("===================== GET STORAGE =====================");
      //  print(deviceStorage.read("IsFirstTime"));
      // }
      deviceStorage.writeIfNull("IsFirstTime", true);
      // Check if it´s the first time launching the app
      deviceStorage.read("IsFirstTime") != true
          ? Get.offAll(() => LoginScreen())
          : Get.offAll(LoginScreen());
    }
  }


  /// Function to Show Relevant Screen

    /* -------------------------- Email & Password sign in -----------------------------------*/

    /// [EmailAuthentication] - LOGIN
    Future<UserCredential> loginWithEmailAndPassword(String email,
        String password) async {
      try {
        return await _auth.signInWithEmailAndPassword(
            email: email, password: password);
      } on FirebaseAuthException catch (e) {
        throw "";
      } on FirebaseException catch (e) {
        throw "";
      } on FormatException catch (_) {
        throw "";
      } on PlatformException catch (_) {
        throw "";
      } catch (e) {
        throw "Something went wrong. Please try again";

    }}

    /// [EmailAuthentication] - REGISTER
    Future<UserCredential> registerWithEmailAndPassword(String email,
        String password) async {
      try {
        return await _auth.createUserWithEmailAndPassword(
            email: email, password: password);
      } on FirebaseAuthException catch (e) {
        throw "";
      } on FirebaseException catch (e) {
        throw "";
      } on FormatException catch (_) {
        throw "";
      } on PlatformException catch (e) {
        throw "";
      } catch (e) {
        throw "Something went wrong. Please try again";
      }
    }

  /// [EmailVerification] - MAIL VERIFICATION

  /// [ReAuthenticate] - ReAuthenticate User
  Future<void> reAuthenticateWithEmailAndPassword(String email,
      String password) async {
    try {
      // Create a credentials
      AuthCredential credential = EmailAuthProvider.credential(
          email: email, password: password);

      // ReAuthenticate
      await _auth.currentUser!.reauthenticateWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      throw "";
    } on FirebaseException catch (e) {
      throw "";
    } on FormatException catch (_) {
      throw "";
    } on PlatformException catch (e) {
      throw "";
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

  /// [EmailAuthentication] - FORGET PASSWORD
  Future<void> sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } on FirebaseAuthException catch (e) {
      throw "";
    } on FirebaseException catch (e) {
      throw "";
    } on FormatException catch (_) {
      throw "";
    } on PlatformException catch (e) {
      throw "";
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }

/* ---------------------------- Federated identity & social sign-in -----------------------*/

  /// [GoogleAuthentication] - GOOGLE
  Future<UserCredential?> signInWithGoogle() async {
    try {
      print("Starting Google Sign-In...");

      // Trigger Google Sign-In
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();
      if (userAccount == null) {
        print("Google sign-in was canceled by the user.");
        return null; // User canceled sign-in
      }

      print("User selected: ${userAccount.email}");

      // Get authentication details
      final GoogleSignInAuthentication googleAuth =
      await userAccount.authentication;

      if (googleAuth.accessToken == null || googleAuth.idToken == null) {
        print("Google authentication tokens are null.");
        throw FirebaseAuthException(
          code: "MISSING_GOOGLE_AUTH_TOKEN",
          message: "Failed to retrieve Google authentication token.",
        );
      }

      // Generate credential
      final credentials = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken, idToken: googleAuth.idToken);

      // Sign in with Firebase
      final userCredential = await _auth.signInWithCredential(credentials);
      print("Google sign-in successful: ${userCredential.user?.email}");

      return userCredential;
    } on FirebaseAuthException catch (e) {
      print("FirebaseAuthException: ${e.code} - ${e.message}");
      throw FirebaseAuthException(code: e.code, message: e.message);
    } on FirebaseException catch (e) {
      print("FirebaseException: ${e.plugin} - ${e.message}");
      throw FirebaseException(plugin: e.plugin, message: e.message);
    } on PlatformException catch (e) {
      print("PlatformException: ${e.code} - ${e.message}");
      throw PlatformException(code: e.code, message: e.message);
    } catch (e) {
      print("Unexpected error: $e");
      throw Exception("Something went wrong: $e");
    }
  }
  /// [FacebookAuthentication] - FACEBOOK

/* ---------------------------- ./end Federated identity & social sign-in -----------------------*/

  /// [LogoutUser] - Valid for any authentication.
  Future<void> logout() async {
    try {
      await GoogleSignIn().signOut();
      await FirebaseAuth.instance.signOut();
      Get.offAll(() => LoginScreen());
    } on FirebaseAuthException catch (e) {
      throw "";
    } on FirebaseException catch (e) {
      throw "";
    } on FormatException catch (_) {
      throw "";
    } on PlatformException catch (e) {
      throw "";
    } catch (e) {
      throw "Something went wrong. Please try again";
    }
  }}


  /// [DeleteUser] - Remove user Auth and FireStore Account
