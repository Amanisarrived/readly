import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readly/View/auth/presentation/sign_in.dart';
import 'package:readly/View/auth/widgets/onboard_tagline.dart';
import 'package:readly/View/auth/widgets/onbording_btn.dart';

class OnbordingScreen extends StatelessWidget {
  const OnbordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 70.h, left: 10.h, right: 10.h),
        child: Center(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Image.asset(
                  "assets/images/readly_logo.png",
                  height: 180,
                  width: 100,
                ),
              ),
              Gap(20.h),
              Text(
                "Welcome To Readly",
                style: Theme.of(
                  context,
                ).textTheme.bodyLarge!.copyWith(fontSize: 16.sp),
              ),
              Gap(5.h),
              Text(
                textAlign: TextAlign.center,
                "Your cozy digital library where every page tells a story and every story finds a home",
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  fontSize: 12.sp,
                  height: 1.5.sp,
                  color: const Color(0xFF595959),
                ),
              ),
              Gap(30.h),
              const OnboardTagline(
                subtitle: "Access thousands of books across all genres",
                title: "Endless Library",
                icon: Icon(Iconsax.book_1),
              ),
              Gap(20.h),
              const OnboardTagline(
                subtitle: "Discover trending titles and hidden gems",
                title: "Curated Discoveries",
                icon: Icon(Iconsax.search_normal_1),
              ),
              Gap(20.h),
              const OnboardTagline(
                subtitle: "Save favorites and build your personal collection",
                title: "Your Private Bookshelf",
                icon: Icon(Iconsax.bookmark),
              ),
              Gap(40.h),
              OnbordingBtn(
                btntext: "Start Reading Today",
                textcolor: Colors.white,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (_) => const SignIn()),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
