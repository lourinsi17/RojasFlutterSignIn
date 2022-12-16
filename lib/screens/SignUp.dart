import 'package:demo_screens/screens/LoginScreen.dart';
import 'package:demo_screens/widget/CustomTextField.dart';
import 'package:demo_screens/widget/PasswordField.dart';
import 'package:demo_screens/widget/PrimaryButton.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  static String routeName = "/signup";

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController =
      TextEditingController();
  bool obscurePassword = true;
  bool obscureconfirmPassword = true;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: Container(
        child: Center(
          child: SingleChildScrollView(
            child: Center(
              child: Container(
                width: width * .9,
                child: Column(
                  children: [
                    CustomTextField(
                        labelText: "First Name",
                        hintText: "Input First Name Here",
                        controller: firstnameController,
                        textInputType: TextInputType.name),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomTextField(
                        labelText: "Last Name",
                        hintText: "Input Last Name Here",
                        controller: lastnameController,
                        textInputType: TextInputType.name),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomTextField(
                        labelText: "Address",
                        hintText: "Input Address",
                        controller: addressController,
                        textInputType: TextInputType.streetAddress),
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
                    PasswordField(
                        obscureText: obscureconfirmPassword,
                        onTap: handleObscureconfirmPassword,
                        labelText: "Password",
                        hintText: "Enter your password",
                        controller: confirmpasswordController),
                    const SizedBox(
                      height: 20.0,
                    ),
                    PrimaryButton(
                      text: "Signup",
                      iconData: Icons.thumb_up,
                      onPress: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          LoginScreen.routeName,
                          (Route<dynamic> route) => false,
                        );
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
                          "Already have an account?",
                          style: TextStyle(
                            fontSize: 16.0,
                          ),
                        ),
                      )),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    PrimaryButton(
                      text: "Login",
                      iconData: Icons.login,
                      onPress: () {
                        Navigator.of(context).pushNamedAndRemoveUntil(
                          LoginScreen.routeName,
                          (Route<dynamic> route) => false,
                        );
                      },
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

  handleObscureconfirmPassword() {
    setState(() {
      obscureconfirmPassword = !obscureconfirmPassword;
    });
  }
}
