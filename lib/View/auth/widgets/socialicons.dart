import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:provider/provider.dart';
import 'package:readly/View/screen_navigation.dart';
import 'package:readly/provider/auth_provider.dart';

class Socialicons extends StatelessWidget {
  const Socialicons({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        GestureDetector(
          onTap: () async {
            final success = await authProvider.signInWithGoogle();
            if (success) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const ScreenNavigation()),
              );
            }
          },
          child: authProvider.isgoogleloginLoading
              ? LoadingAnimationWidget.threeArchedCircle(
                  color: Theme.of(context).primaryColor,
                  size: 40.sp,
                )
              : Container(
                  height: 70,
                  width: 110,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    border: BoxBorder.all(color: Colors.grey),
                  ),
                  child: Image.asset("assets/images/google.png"),
                ),
        ),
        GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: Colors.blue.shade700,
                content: const Text(
                  '📢 Facebook login is on our radar stay tuned for the big launch!',
                  style: TextStyle(color: Colors.white, fontSize: 15),
                ),
                duration: const Duration(seconds: 2),
                behavior: SnackBarBehavior.floating,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12)),
                ),
              ),
            );
          },
          child: Container(
            height: 70,
            width: 110,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              border: BoxBorder.all(color: Colors.grey),
            ),
            child: Image.asset("assets/images/facebook.png"),
          ),
        ),
      ],
    );
  }
}
