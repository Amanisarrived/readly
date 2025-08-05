import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
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
  bool isConfirmPasswordhidden = true;

  void isPasswordVisible() {
    setState(() {
      isPasswordhidden = !isPasswordhidden;
    });
  }

  void isConfirmPasswordVisible() {
    setState(() {
      isConfirmPasswordhidden = !isConfirmPasswordhidden;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(top: 40.h),
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
                  style: Theme.of(context).textTheme.bodyLarge,
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
                Gap(30.h),
                const TextFeild(
                  feildtitle: "Email",
                  obsureText: false,
                  hinttext: "Example@gmail.com",
                  keyboardtype: TextInputType.emailAddress,
                ),
                Gap(15.h),
                TextFeild(
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
                Gap(15.h),
                TextFeild(
                  feildtitle: "Confirm Password",
                  obsureText: isConfirmPasswordhidden,
                  hinttext: "Confirm Passsword",
                  icon: IconButton(
                    onPressed: isConfirmPasswordVisible,
                    icon: isConfirmPasswordhidden
                        ? const Icon(Iconsax.eye)
                        : const Icon(Iconsax.password_check),
                  ),
                ),
                Gap(20.h),
                OnbordingBtn(
                  textcolor: Colors.white,
                  btntext: "Continue",
                  onTap: () {},
                ),
                Gap(10.h),
                const LoginText(
                  text: "Already have an account?  ",
                  subText: "Log In",
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
    );
  }
}
