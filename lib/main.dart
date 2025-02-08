import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app.dart';
import 'package:email_otp/email_otp.dart';
import 'common/authentication/repostries/auth_repository.dart';
import 'firebase_options.dart';


Future<void> main() async {
  final WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then(
        (FirebaseApp value) => Get.put(AuthenticationRepository()),
  );
  EmailOTP.config(
    appName: 'MyApp',
    otpLength: 6,
   // expiry : 30000,
    otpType: OTPType.numeric,
    emailTheme: EmailTheme.v6,
  );
  runApp(const App());
}



