import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:readly/Theme/app_theme.dart';
import 'package:readly/View/auth/presentation/onbording_screen.dart';
import 'package:readly/View/screen_navigation.dart';
import 'package:readly/firebase_options.dart';
import 'package:readly/provider/auth_provider.dart';
import 'package:readly/provider/genre_provider.dart';
import 'package:readly/provider/state_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await uploadSinlgeBook(george);

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AllStateProvider()),
        ChangeNotifierProvider(create: (_) => GenreProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),
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
          home: const RootScreen(),
          debugShowCheckedModeBanner: false,
          theme: AppTheme.lightTheme,
          themeMode: ThemeMode.system,
        );
      },
    );
  }
}

class RootScreen extends StatelessWidget {
  const RootScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<AuthProvider>(context);

    //If user not logged  show on bording screen;
    if (!auth.isuserLoggedIn()) {
      return const OnbordingScreen();
    } else {
      return const ScreenNavigation();
    }
  }
}
