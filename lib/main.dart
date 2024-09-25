import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fresh_fish_app/Screens/splash_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, _) => const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "Fresh Fish APP",
        home: SplashScreen(),
      ),
      designSize: const Size(412, 732),
    );
  }
}
