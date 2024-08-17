import 'dart:async';
import 'package:resume_app/header_file.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    Timer.periodic(
      const Duration(seconds: 3),
      (timer) {
        Navigator.pushReplacementNamed(context, Routes.homepage);
        timer.cancel();
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Image.asset('lib/assets/gif/splash.gif'),
      ),
    );
  }
}
