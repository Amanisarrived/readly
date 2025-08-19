import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:readly/View/auth/presentation/login_screen.dart';
import 'package:readly/View/auth/widgets/check_badge.dart';
import 'package:readly/View/auth/widgets/onbording_btn.dart';

class AccountCreated extends StatelessWidget {
  const AccountCreated({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.only(top: 50.h),
            child: Center(
              child: Column(
                children: [
                  Image.asset("assets/images/readlymockup.png"),
                  Text(
                    "Account Created! ",
                    style: Theme.of(
                      context,
                    ).textTheme.bodyLarge!.copyWith(fontSize: 25.sp),
                  ),

                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 15.w),
                    child: Text(
                      textAlign: TextAlign.center,
                      "Your password has been reset successfully! You may now Log In",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        fontSize: 14.sp,
                        color: const Color.fromARGB(255, 138, 138, 138),
                      ),
                    ),
                  ),
                  Gap(30.h),
                  OnbordingBtn(
                    textcolor: Colors.white,
                    btntext: "Log In",
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => const LoginScreen()),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
          Positioned(top: 50.h, right: 30.h, child: const CheckBadge()),
        ],
      ),
    );
  }
}
