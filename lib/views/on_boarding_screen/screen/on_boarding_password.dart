// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import '../../sign_in_screen/screen/sign_in_screen.dart';

class OnBoardingPassword extends StatefulWidget {
  const OnBoardingPassword({super.key});

  @override
  State<OnBoardingPassword> createState() => _OnBoardingPasswordState();
}

class _OnBoardingPasswordState extends State<OnBoardingPassword> {
  final phoneNumberController = TextEditingController();

  bool isObscore = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: false,
        title: Row(
          spacing: 6.w,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(width: 10.w),
            Icon(Icons.location_on_outlined),
            Text(
              "Hanoi, Vietnam",
              style: TextStyle(
                fontSize: 12.sp,
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 35.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 48.h),
            Text(
              "Password Recovery",
              style: TextStyle(
                color: Colors.black,
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8.h),
            SizedBox(
              width: 235.w,
              child: Text(
                "Enter your Phone number to recover your password",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            SizedBox(height: 40.h),
            IntlPhoneField(
              decoration: InputDecoration(
                labelText: 'Telefon raqam',
                border: OutlineInputBorder(borderSide: BorderSide()),
              ),
              initialCountryCode: 'UZ',
              onChanged: (phone) {
                print(phone.completeNumber);
              },
            ),
            SizedBox(height: 176.h),
            InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (ctx) => SignInScreen()));
              },
              child: Ink(
                width: 305.w,
                height: 44.h,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  color: Colors.yellow,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const SizedBox(),
                    Text(
                      "Sign In",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                        fontSize: 12.sp,
                      ),
                    ),
                    Icon(Icons.login_outlined, size: 26.w),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Align(
              alignment: Alignment.center,
              child: RichText(
                text: TextSpan(
                  text: "Don't have an account?",
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.4),
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w600,
                  ),
                  children: [
                    TextSpan(
                      text: "Sign up",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 24.h),
          ],
        ),
      ),
    );
  }
}
