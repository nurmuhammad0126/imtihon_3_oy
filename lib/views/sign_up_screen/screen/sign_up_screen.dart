import 'package:flutter/material.dart';
import 'package:flutter_3_oy_imtixon/models/user_model.dart';
import 'package:flutter_3_oy_imtixon/models/user_profile_model.dart';
import 'package:flutter_3_oy_imtixon/repository/user_repository.dart';
import 'package:flutter_3_oy_imtixon/views/sign_in_screen/screen/sign_in_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../view_model/validator_view_model.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final repo = UserRepository();
  final userPhoneController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isRegister = false;

  bool isObscore = true;
  bool checkBox = true;

  Future<void> register() async {
    if (_formKey.currentState!.validate()) {
      final userProfileModel = UserProfileModel(
        address: "",
        name: "",
      );
      final userModel = UserModel(
        id: "",
        email: emailController.text,
        phone: userPhoneController.text,
        profile: userProfileModel,
        password: passwordController.text,
      );
      setState(() {
        isRegister = true;
      });
      if (await repo.register(userModel)) {
        if (mounted) {
          Navigator.push(
              context, MaterialPageRoute(builder: (ctx) => SignInScreen()));
        }
        setState(() {
          isRegister = false;
        });
      } else {
        if (mounted) {
          setState(() {
            isRegister = false;
          });

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Bunday Foydalanuvchi oldin royhatdan otgan !")));
        }
      }
    }
  }

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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 35.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 48.h),
              Text(
                "Getting Started",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                "Create an account to continue!",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 14.sp,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(height: 40.h),
              Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Email",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.email_outlined),
                        hintText: "hello.carrotlabs@gmail.com",
                      ),
                      validator: Validators.validateEmail,
                    ),
                    SizedBox(height: 40.h),
                    Text(
                      "Phone number",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    TextFormField(
                      controller: userPhoneController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.person_2_outlined),
                        hintText: "+999 90 000 00 00",
                      ),
                      validator: Validators.validatePhoneNumber,
                    ),
                    SizedBox(height: 40.h),
                    Text(
                      "Password",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    SizedBox(height: 8.h),
                    TextFormField(
                      obscureText: isObscore,
                      controller: passwordController,
                      validator: Validators.validatePassword,
                      decoration: InputDecoration(
                        hintText: "• • • • • • • •",
                        prefixIcon: Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                          onPressed: () {
                            isObscore = !isObscore;
                            setState(() {});
                          },
                          icon: isObscore
                              ? Icon(Icons.visibility_off)
                              : Icon(Icons.visibility),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 16.h),
              SizedBox(
                width: 305.w,
                height: 40.h,
                child: Row(
                  children: [
                    Checkbox(
                      value: checkBox,
                      onChanged: (value) {
                        setState(() {
                          checkBox = !checkBox;
                        });
                      },
                    ),
                    RichText(
                      text: TextSpan(
                        text: "By creating an account, you agree to our\n",
                        style: TextStyle(
                          color: Colors.black.withOpacity(0.4),
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                        ),
                        children: [
                          TextSpan(
                            text: " Term & Conditions",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 13.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 36.h),
              InkWell(
                onTap: isRegister
                    ? () {}
                    : () async {
                        await register();
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
                      isRegister
                          ? Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : Text(
                              "Sign Up",
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
                        text: " Sign in",
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
              Divider(),
              SizedBox(height: 24.h),
              Ink(
                width: 305.w,
                height: 44.h,
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6.r),
                  color: const Color.fromARGB(255, 48, 28, 228),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Icon(Icons.facebook, color: Colors.white, size: 26.w),
                    Text(
                      "Connect with Facebook",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: 12.sp,
                      ),
                    ),
                    const SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
