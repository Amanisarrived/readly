import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:provider/provider.dart';
import 'package:readly/View/auth/presentation/sign_in.dart';
import 'package:readly/View/auth/widgets/divider_widget.dart';
import 'package:readly/View/auth/widgets/login_text.dart';
import 'package:readly/View/auth/widgets/onbording_btn.dart';
import 'package:readly/View/auth/widgets/socialicons.dart';
import 'package:readly/View/auth/widgets/text_feild.dart';
import 'package:readly/View/screen_navigation.dart';
import 'package:readly/provider/auth_provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final passController = TextEditingController();

  bool isPasswordhidden = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void isPasswordVisible() {
    setState(() {
      isPasswordhidden = !isPasswordhidden;
    });
  }

  void _handleLogin() async {
    final authProvider = Provider.of<AuthProvider>(context, listen: false);
    final email = emailController.text.trim();
    final password = passController.text.trim();

    await authProvider.login(email, password);

    if (authProvider.errorMessage != null) {
      if (mounted) {
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
    } else {
      if (mounted) {
        await authProvider.loadUserName();
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (_) => const ScreenNavigation()),
        );
      }
    }
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 60.h),
          child: Form(
            key: _formKey,
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
                    "Welcome Back!",
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge!.copyWith(fontSize: 30.sp),
                  ),
                  Gap(1.h),
                  Text(
                    textAlign: TextAlign.center,
                    "Hello! Welcome back to readly",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      fontSize: 12.sp,
                      height: 1.5.sp,
                      color: const Color(0xFF595959),
                    ),
                  ),
                  Gap(30.h),

                  TextFeild(
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
                    hinttext: "Enter Your Email",
                    controller: emailController,
                  ),
                  Gap(15.h),
                  TextFeild(
                    obsureText: isPasswordhidden,
                    icon: IconButton(
                      onPressed: isPasswordVisible,
                      icon: isPasswordhidden
                          ? const Icon(Iconsax.eye)
                          : const Icon(Iconsax.password_check),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Password is required';
                      }
                      if (value.length < 8) {
                        return "Password must be 8 character long";
                      }
                      return null;
                    },

                    feildtitle: "Password",

                    hinttext: "Enter Your Password",
                    controller: passController,
                  ),

                  Gap(20.h),
                  OnbordingBtn(
                    isloading: authProvider.isLoading,
                    textcolor: Colors.white,
                    btntext: "Log In",
                    onTap: () {
                      if (_formKey.currentState!.validate()) {
                        _handleLogin();
                      }
                    },
                  ),
                  Gap(10.h),
                  LoginText(
                    text: "Don't have an account?  ",
                    subText: "Sigin Up",
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (_) => const SignIn()),
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
