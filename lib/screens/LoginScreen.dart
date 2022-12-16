import 'package:demo_screens/screens/Dashboard.dart';
import 'package:demo_screens/services/AuthService.dart';
import 'package:demo_screens/services/StorageService.dart';
import 'package:demo_screens/widget/CustomTextField.dart';
import 'package:demo_screens/widget/PasswordField.dart';
import 'package:demo_screens/widget/PrimaryButton.dart';
import 'package:demo_screens/models/StorageItem.dart';

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class LoginScreen extends StatefulWidget {
  static String routeName = "/login";
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  StorageService _storageService = StorageService();
  AuthService _authService = AuthService();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscurePassword = true;
  bool isLogginIn = false;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Center(
        child: ModalProgressHUD(
          inAsyncCall: isLogginIn,
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                width: width * .9,
                child: Column(
                  children: [
                    CustomTextField(
                        labelText: "Email Address",
                        hintText: "Enter your email address",
                        controller: emailController,
                        textInputType: TextInputType.emailAddress),
                    const SizedBox(
                      height: 20.0,
                    ),
                    PasswordField(
                        obscureText: obscurePassword,
                        onTap: handleObscurePassword,
                        labelText: "Password",
                        hintText: "Enter your password",
                        controller: passwordController),
                    const SizedBox(
                      height: 20.0,
                    ),
                    PrimaryButton(
                      text: "Login",
                      iconData: Icons.login,
                      onPress: () {
                        loginWithProvider();
                        // Navigator.pushReplacementNamed(
                        //     context, Dashboard.routeName);
                      },
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    Container(
                      child: Center(
                          child: GestureDetector(
                        onTap: () {},
                        child: const Text(
                          "Don't have an account? Sign up here",
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      )),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  handleObscurePassword() {
    setState(() {
      obscurePassword = !obscurePassword;
    });
  }

  loginWithProvider() async {
    try {
      setState(() {
        isLogginIn = true;
      });

      var user = await _authService.signInWithGoogle();
      var accessToken =
          StorageItem("accessToken", user.credential?.accessToken as String);

      await _storageService.saveData(accessToken);

      // ignore: use_build_context_synchronously
      Navigator.pushReplacementNamed(context, Dashboard.routeName);
    } catch (e) {
      print(e.toString());
    }

    setState(() {
      isLogginIn = false;
    });
  }
}
