import 'package:estateapp1/common/authentication/login/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'data/general_binding.dart';
import 'features/navigation/bottom_navigation.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        initialBinding: GeneralBindings(),
      home: FirebaseAuth.instance.currentUser == null ?
        LoginScreen()
          : BottomNavigation(),
    );
  }
}