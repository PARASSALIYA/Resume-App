import 'package:resume_app/header_file.dart';

class Routes {
  static String splashScreenPage = '/';
  static String homepage = 'HomePage';
  static String buildoptionspage = 'BuildOptionsPage';
  static String pdfpage = 'PdfPage';

  static String iconlocation = "lib/assets/icons";

  static List buildoption = [
    {
      'name': 'Personal Details',
      'route': 'Personal Details',
      'icon': '$iconlocation/details.png',
    },
    {
      'name': 'Education',
      'route': 'Education',
      'icon': '$iconlocation/educations.png',
    },
    {
      'name': 'Experience',
      'route': 'Experience',
      'icon': '$iconlocation/experiences.png',
    },
    {
      'name': 'Technical skills',
      'route': 'Technical skills',
      'icon': '$iconlocation/technical skills.png',
    },
    {
      'name': 'Projects',
      'route': 'Projects',
      'icon': '$iconlocation/projects.png',
    },
    {
      'name': 'About Us',
      'route': 'About Us',
      'icon': '$iconlocation/abouts.png',
    },
    {
      'name': 'Certified courses',
      'route': 'Certified courses',
      'icon': '$iconlocation/certified courses.png',
    },
    {
      'name': 'Achievements',
      'route': 'Achievements',
      'icon': '$iconlocation/achievements.png',
    },
    {
      'name': 'Hobbies',
      'route': 'Hobbies',
      'icon': '$iconlocation/hobbies.png',
    },
    {
      'name': 'Add More Section',
      'route': 'Add More Section',
      'icon': '$iconlocation/add.png',
    },
    {
      'name': 'Help',
      'route': 'Help',
      'icon': '$iconlocation/helps.png',
    },
    {
      'name': 'Setting',
      'route': 'Setting',
      'icon': '$iconlocation/setting.png',
    },
  ];

  static Map<String, Widget Function(BuildContext)> routes = {
    Routes.splashScreenPage: (context) => const SplashScreenPage(),
    Routes.homepage: (context) => const HomePage(),
    Routes.buildoptionspage: (context) => const BuildOptionsPage(),
    Routes.pdfpage: (context) => const PdfPage(),
    Routes.buildoption[0]['route']: (context) => const PersonalInfoPage(),
    Routes.buildoption[1]['route']: (context) => const EducationPage(),
    Routes.buildoption[2]['route']: (context) => const ExperiencePage(),
    Routes.buildoption[3]['route']: (context) => const TechnicalSkillPage(),
    Routes.buildoption[4]['route']: (context) => const ProjectPage(),
  };
}
