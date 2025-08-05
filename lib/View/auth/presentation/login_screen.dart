import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:readly/View/auth/widgets/divider_widget.dart';
import 'package:readly/View/auth/widgets/login_text.dart';
import 'package:readly/View/auth/widgets/onbording_btn.dart';
import 'package:readly/View/auth/widgets/socialicons.dart';
import 'package:readly/View/auth/widgets/text_feild.dart';
import 'package:readly/View/screen_navigation.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
                  hinttext: "Enter Your Email",
                ),
                Gap(15.h),
                const TextFeild(
                  feildtitle: "Password",
                  obsureText: true,
                  hinttext: "Enter Your Password",
                ),

                Gap(20.h),
                OnbordingBtn(
                  textcolor: Colors.white,
                  btntext: "Log In",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ScreenNavigation(),
                      ),
                    );
                  },
                ),
                Gap(10.h),
                const LoginText(
                  text: "Don't have an account?  ",
                  subText: "Sigin Up",
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
