import 'package:flutter/material.dart';
import 'package:flutter_3_oy_imtixon/view_model/user_viewmodel.dart';
import 'package:flutter_3_oy_imtixon/view_model/validator_view_model.dart';
import 'package:flutter_3_oy_imtixon/views/sign_in_screen/screen/sign_in_screen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController loginController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final userViewModel = UserViewmodel();
  String message = '';
  bool isTrue = false;

  Future<bool> resetPassword() async {
    final login = loginController.text.trim();
    final newPassword = newPasswordController.text;
    setState(() {
      isTrue = true;
    });
    if (login.isEmpty || newPassword.isEmpty) {
      setState(() {
        isTrue = false;
        message = 'Barcha ma`lumotlarni to`ldiring';
      });
      return false;
    }
    if (_formKey.currentState!.validate()) {
      try {
        final email = Validators.validateEmail(login) == null ? login : null;
        final phone =
            Validators.validatePhoneNumber(login) == null ? login : null;
        print(
            "+========================================================+========================================================");

        print(email);
        print(phone);
        print(
            "+========================================================+========================================================");
        if (email != null) {
          await userViewModel.updateEmailPassword(email, newPassword);
        } else if (phone != null) {
          await userViewModel.updatePhonePassword(phone, newPassword);
        }
        setState(() {
          isTrue = false;
          message = 'Parol muvaffaqiyatli yangilandi!';
        });

        loginController.clear();
        newPasswordController.clear();
        return true;
      } catch (e) {
        setState(() {
          isTrue = false;
          message = 'Login topilmadi yoki xatolik yuz berdi.';
        });
        return false;
      }
    }
    setState(() {
      isTrue = false;
    });
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Forgot Password',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: loginController,
                validator: Validators.validateUser,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelText: 'Email or Phone number',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextFormField(
                validator: Validators.validatePassword,
                controller: newPasswordController,
                decoration: InputDecoration(
                  labelText: 'New Password',
                  labelStyle: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  minimumSize: Size(300, 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () async {
                  final res = await resetPassword();
                  if (res) {
                    if (context.mounted) {
                      Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                          builder: (context) => SignInScreen(),
                        ),
                        (route) => false,
                      );
                    }
                  }
                },
                child: isTrue
                    ? Center(
                        child: CircularProgressIndicator(
                          color: Colors.white,
                        ),
                      )
                    : Text(
                        'Parolni yangilash',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
              ),
              const SizedBox(height: 20),
              Text(
                message,
                style: TextStyle(
                  color: message.contains('muvaffaqiyatli')
                      ? Colors.green
                      : Colors.red,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
