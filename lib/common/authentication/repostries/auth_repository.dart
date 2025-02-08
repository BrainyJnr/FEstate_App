import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_sign_in/google_sign_in.dart';
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
      // Trigger the authentication flow
      final GoogleSignInAccount? userAccount = await GoogleSignIn().signIn();

      // Obtain the authentication flow
      final GoogleSignInAuthentication? googleAuth =
      await userAccount?.authentication;

      // Create the auth details from the request
      final credentials = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken, idToken: googleAuth?.idToken);

      // Once signed in, return the UserCredential
      return await _auth.signInWithCredential(credentials);
    } on FirebaseAuthException catch (e) {
      throw "";
    } on FirebaseException catch (e) {
      throw "";
    } on FormatException catch (_) {
      throw "";
    } on PlatformException catch (e) {
      throw "";
    } catch (e) {
      if (kDebugMode) print("Something went wrong: $e");
      return null;
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
