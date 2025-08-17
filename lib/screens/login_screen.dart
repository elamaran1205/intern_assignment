// ignore_for_file: deprecated_member_use, sort_child_properties_last, library_private_types_in_public_api

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intern_selection/widgets/mycolors.dart';
import '../routes/app_routes.dart';
import 'package:flutter/services.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController otpController = TextEditingController();
  String generatedOtp = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/logo.png'),
                ),
                SizedBox(height: 20),
                Text(
                  'Welcome Back!',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimary),
                ),
                SizedBox(height: 10),
                Text(
                  'Enter your phone number to login',
                  style: TextStyle(
                      fontSize: 16, color: AppColors.textSecondary),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),

               
                TextField(
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                  ],
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    prefixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: AppColors.white,
                  ),
                ),
                SizedBox(height: 15),

               
                ElevatedButton(
                  onPressed: sendOtp,
                  child: Text('Send OTP'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50), backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),

                SizedBox(height: 20),

              
                TextField(
                  controller: otpController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(6),
                  ],
                  decoration: InputDecoration(
                    labelText: 'Enter OTP',
                    prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    filled: true,
                    fillColor: AppColors.white,
                  ),
                ),
                SizedBox(height: 15),

              
                ElevatedButton(
                  onPressed: verifyOtp,
                  child: Text('Login'),
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size(double.infinity, 50), backgroundColor: AppColors.primary,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


  void sendOtp() {
    String phone = phoneController.text.trim();
    if (phone.length != 10) {
      Get.snackbar("Error", "Phone number must be 10 digits",
          backgroundColor: AppColors.error.withOpacity(0.2));
      return;
    }

   
    generatedOtp =
        (100000 + (999999 - 100000) * (DateTime.now().millisecondsSinceEpoch % 1000) / 1000)
            .toInt()
            .toString();

    Get.snackbar("OTP Sent", "Your OTP is: $generatedOtp (mock)",
        backgroundColor: AppColors.primary.withOpacity(0.2));
  }

  
  void verifyOtp() {
    String otp = otpController.text.trim();

    if (otp.length != 6) {
      Get.snackbar("Error", "OTP must be 6 digits",
          backgroundColor: AppColors.error.withOpacity(0.2));
      return;
    }

    if (otp == generatedOtp) {
      Get.offNamed(AppPages.DASHBOARD);
    } else {
      Get.snackbar("Error", "Invalid OTP",
          backgroundColor: AppColors.error.withOpacity(0.2));
    }
  }
}
