import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:readly/Theme/app_theme.dart';
import 'package:readly/View/screen_navigation.dart';
import 'package:readly/firebase_options.dart';
import 'package:readly/provider/genre_provider.dart';
import 'package:readly/provider/state_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AllStateProvider()),
        ChangeNotifierProvider(create: (_) => GenreProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          home: const ScreenNavigation(),
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
        );
      },
    );
  }
}
