import 'package:flutter/material.dart';
import 'package:flutter_3_oy_imtixon/view_model/user_viewmodel.dart';
import 'package:flutter_3_oy_imtixon/views/sign_up_screen/screen/sign_up_screen.dart';
import 'package:flutter_3_oy_imtixon/views/sms_screen/screen/sms_screen.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../forget_password/screen/forget_password.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final viewModel = UserViewmodel();

  bool isObscore = true;
  bool isLogin = false;

  Future<void> login() async {
    setState(() {
      isLogin = true;
    });
    final user = await viewModel.login(
        email: emailController.text, password: passwordController.text);
    if (user) {
      setState(() {
        isLogin = false;
      });
      if (mounted) {
        Navigator.push(
            context, MaterialPageRoute(builder: (ctx) => SmsScreen()));
      }
    } else {
      if (mounted) {
        emailController.text = "";
        passwordController.text = "";
        setState(() {
          isLogin = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              "Bunday Foydalanuvchi Topilmadi!",
              style: TextStyle(fontSize: 22),
            ),
          ),
        );
        setState(() {});
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 35.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 48.h),
              Text(
                "Let's Sign You In",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 8.h),
              Text(
                "Welcome back, you've been missed!",
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
                      "Username or Email",
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
                        prefixIcon: Icon(Icons.person_2_outlined),
                        hintText: "UserName",
                      ),
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
              SizedBox(height: 176.h),
              InkWell(
                onTap: isLogin
                    ? () {}
                    : () async {
                        //! Login
                        await login();
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
                      isLogin
                          ? Center(
                              child: CircularProgressIndicator(
                                color: Colors.white,
                              ),
                            )
                          : Text(
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
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (ctx) => SignUpScreen()));
                  },
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
              SizedBox(
                height: 20.h,
              ),
              Center(
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ForgotPasswordScreen(),
                          ));
                    },
                    child: Text(
                      "Forget Password",
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    )),
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
