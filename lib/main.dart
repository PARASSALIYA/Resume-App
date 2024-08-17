import 'package:resume_app/header_file.dart';

void main() {
  runApp(
    const ResumeApp(),
  );
}

class ResumeApp extends StatelessWidget {
  const ResumeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: Routes.routes,
    );
  }
}
