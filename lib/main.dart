import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app.dart';
import 'package:email_otp/email_otp.dart';
import 'common/authentication/repostries/auth_repository.dart';
import 'firebase_options.dart';



Future<void> main() async {

  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // -- GetX Local Storage
  await GetStorage.init();

  // -- Await Native Splash until other items Load
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Initialize Firebase & Authentication Repository
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
        (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );
  // Todo: Initialize Authentication
  EmailOTP.config(
    appName: 'MyApp',
    otpLength: 6,
    otpType: OTPType.numeric,
    emailTheme: EmailTheme.v6,
  );

  runApp(const App());
}



