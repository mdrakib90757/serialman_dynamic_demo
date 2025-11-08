import 'package:auth_buttons/auth_buttons.dart';
import 'package:flutter/material.dart';
import 'package:serialman/core/color/color.dart';
import 'package:serialman/core/shared_widget/custom_app_text.dart';
import 'package:serialman/core/shared_widget/custom_background.dart';
import 'package:serialman/core/shared_widget/custom_bottom_nav_bar/custom_bottom_nav_bar.dart';
import 'package:serialman/core/shared_widget/custom_text_field.dart';

import '../auth_widget/custom_toggle_switch.dart' show CustomToggleSwitch;

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _isDoctor = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFF1A4E8D), Color(0xFFA3C1C8)],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
          CustomPaint(painter: WavePainter(), child: Container()),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, top: 50),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/image/s.1.png", fit: BoxFit.cover),
                  const SizedBox(height: 10),
                  CustomAppText(
                    text: "Welcome to SerialMan",
                    color: AppColor.white,
                    fontSize: 30,
                  ),
                  const SizedBox(height: 10),
                  CustomAppText(
                    text: "Join or login to your account",
                    color: AppColor.white,
                    fontSize: 30,
                  ),

                  const SizedBox(height: 20),
                  CustomToggleSwitch(
                    text: "I'm a Doctor",
                    value: _isDoctor,
                    onChanged: (bool newValue) {
                      setState(() {
                        _isDoctor = newValue;
                      });
                      print("User is a doctor: $_isDoctor");
                    },
                  ),
                  const SizedBox(height: 20),
                  // email filed
                  CustomTextField(
                    controller: _emailController,
                    //labelText: 'Email Address',
                    hintText: 'Enter your email',
                    prefixIcon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter an email';
                      }
                      if (!value.contains('@')) {
                        return 'Please enter a valid email';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),

                  // password filed
                  CustomTextField(
                    controller: _passwordController,
                    //labelText: 'Password',
                    hintText: 'Enter your password',
                    prefixIcon: Icons.lock_outline,
                    isPassword: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter a password';
                      }
                      if (value.length < 6) {
                        return 'Password must be at least 6 characters';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 10),
                  Align(
                    alignment: Alignment.centerRight,
                    child: CustomAppText(
                      text: "Forget Password?",
                      color: AppColor.white,
                    ),
                  ),
                  const SizedBox(height: 20),
                  // login button
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => CustomBottomNavBar(),));
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: AppColor.primaryBlue,
                      foregroundColor: AppColor.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text('Login', style: TextStyle(fontSize: 18)),
                  ),

                  const SizedBox(height: 20),
                  // login button
                  ElevatedButton(
                    onPressed: () {
                    },
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(double.infinity, 50),
                      backgroundColor: Colors.transparent,
                      foregroundColor: AppColor.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(color: AppColor.primaryBlue, width: 2),
                      ),
                    ),
                    child: const Text(
                      'Create New Account',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GoogleAuthButton(
                        onPressed: () {},
                        style: AuthButtonStyle(
                          buttonType: AuthButtonType.icon,
                          iconType: AuthIconType.outlined,
                        ),
                      ),
                      const SizedBox(width: 10),
                      FacebookAuthButton(
                        onPressed: () {},
                        style: AuthButtonStyle(
                          buttonType: AuthButtonType.icon,
                          iconType: AuthIconType.outlined,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
