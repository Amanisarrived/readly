import 'package:readly/View/auth/presentation/login_screen.dart';
import 'package:readly/provider/auth_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:readly/View/auth/presentation/account_created.dart';
import 'package:readly/View/auth/widgets/divider_widget.dart';
import 'package:readly/View/auth/widgets/login_text.dart';
import 'package:readly/View/auth/widgets/onbording_btn.dart';
import 'package:readly/View/auth/widgets/socialicons.dart';
import 'package:readly/View/auth/widgets/text_feild.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isPasswordhidden = true;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final nameController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String? emailError;
  String? passwordError;

  //Sign in handler
  void _handleSignin() async {
    try {
      final authProvider = Provider.of<AuthProvider>(context, listen: false);
      final email = emailController.text.trim();
      final password = passwordController.text.trim();
      final name = nameController.text.trim();

      setState(() {
        emailError = null;
        passwordError = null;
      });

      await authProvider.signIn(email, password, name); // ✅ Use signUp

      if (authProvider.errorMessage != null) {
        final error = authProvider.errorMessage!.toLowerCase();

        setState(() {
          if (error.contains("email")) {
            emailError = "Email already registered.";
          } else if (error.contains("password")) {
            passwordError = "Incorrect password.";
          } else {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  authProvider.errorMessage!,
                  style: const TextStyle(color: Colors.white),
                ),
                behavior: SnackBarBehavior.floating,
                backgroundColor: Colors.red,
              ),
            );
          }
        });

        return;
      }

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (_) => const AccountCreated()),
      );
    } catch (e) {
      throw ("Error $e");
    }
  }

  void isPasswordVisible() {
    setState(() {
      isPasswordhidden = !isPasswordhidden;
    });
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Padding(
            padding: EdgeInsets.only(top: 60.h),
            child: Center(
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Image.asset(
                      "assets/images/readly_logo.png",
                      height: 100,
                      width: 180,
                    ),
                  ),
                  Gap(10.h),
                  Text(
                    "Create Your Account",
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge!.copyWith(fontSize: 30.sp),
                  ),
                  Gap(1.h),
                  Text(
                    textAlign: TextAlign.center,
                    "Start your journey with readly",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 12.sp,
                      height: 1.5.sp,
                      color: const Color(0xFF595959),
                    ),
                  ),
                  Gap(10.h),

                  TextFeild(
                    obsureText: false,
                    feildtitle: "Name",
                    hinttext: "Enter Your name",
                    controller: nameController,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Name is required";
                      }
                      return null;
                    },
                  ),
                  Gap(10.h),

                  TextFeild(
                    errorText: emailError,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Email is required';
                      }
                      final emailRegex = RegExp(
                        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',
                      );
                      if (!emailRegex.hasMatch(value)) {
                        return "Enter a valid email";
                      }

                      return null;
                    },
                    feildtitle: "Email",
                    obsureText: false,
                    hinttext: "Example@gmail.com",
                    keyboardtype: TextInputType.emailAddress,
                    controller: emailController,
                  ),
                  Gap(10.h),
                  TextFeild(
                    errorText: passwordError,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      }
                      if (value.length < 8) {
                        return "Password must be 8 character long";
                      }
                      if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)').hasMatch(value)) {
                        return "Password must contain letters and numbers";
                      }
                      return null;
                    },
                    controller: passwordController,
                    feildtitle: "Password",
                    obsureText: isPasswordhidden,
                    icon: IconButton(
                      onPressed: isPasswordVisible,
                      icon: isPasswordhidden
                          ? const Icon(Iconsax.eye)
                          : const Icon(Iconsax.password_check),
                    ),
                    hinttext: "Enter Password",
                  ),

                  Gap(20.h),
                  OnbordingBtn(
                    textcolor: Colors.white,
                    btntext: "Continue",
                    isloading: authProvider.isLoading,
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        _handleSignin();
                      }
                    },
                  ),
                  Gap(10.h),
                  LoginText(
                    text: "Already have an account?  ",
                    subText: "Log In",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginScreen()),
                      );
                    },
                  ),
                  Gap(10.h),
                  const DividerWidget(),
                  Gap(10.h),
                  const Socialicons(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
