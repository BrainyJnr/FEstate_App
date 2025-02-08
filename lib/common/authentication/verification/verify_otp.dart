import 'package:email_otp/email_otp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:iconsax/iconsax.dart';

import '../../../features/navigation/bottom_navigation.dart';
import '../../../features/screens/home_screen.dart';
import '../../model/user_model.dart';
import '../../utilis/sizes.dart';
import '../../utilis/texts.dart';
import '../../widgets/loader/floader.dart';
import '../repostries/auth_repository.dart';
import '../repostries/user_repostry.dart';

class VerifyOTP extends StatefulWidget {
  const VerifyOTP({super.key, required this.email, required this.user});

  final String email;
  final UserModel user; // Accept user data

  @override
  State<VerifyOTP> createState() => _VerifyOTPState();
}

class _VerifyOTPState extends State<VerifyOTP> {
  /// Variables
  final TextEditingController _otpController = TextEditingController();
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    // Add a listener to the OTP controller
    _otpController.addListener(() {
      setState(() {}); // Update the UI when the text changes
    });
  }

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  Future<void> verifyOTP() async {
    if (_otpController.text.trim().isNotEmpty) {
      setState(() {
        _isLoading = true; // Show the loader
      });

      bool isVerified = await EmailOTP.verifyOTP(otp: _otpController.text.trim());

      setState(() {
        _isLoading = false; // Hide the loader
      });

      if (isVerified) {
        try {
          await UserRepository.instance.saveUserRecord(widget.user);
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('OTP verified successfully')),
          );
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => BottomNavigation()),
          );
        } catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Error saving user: $e')),
          );
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Invalid OTP. Please try again.')),
        );
      }
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Type the OTP that was sent to your email",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .apply(color: Colors.white),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _otpController,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                prefixIcon: const Icon(Iconsax.direct_right, color: Colors.white),
                labelText: "OTP",
                labelStyle: const TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
             SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: _otpController.text.trim().isNotEmpty && !_isLoading
                    ? verifyOTP
                    : null, // Disable the button while loading or if the field is empty
                child: _isLoading
                    ? const CircularProgressIndicator(
                  color: Colors.white,
                  strokeWidth: 2.0,
                )
                    : const Text(
                  'Verify OTP',
                  style: TextStyle(color: Colors.white),
                ),
                ),
              ),
            ]))



    );
  }
}


