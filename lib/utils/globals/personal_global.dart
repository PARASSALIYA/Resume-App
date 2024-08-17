import 'package:resume_app/header_file.dart';

class PersonalGlobal {
  static String name = '';
  static String lastname = '';
  static String phone = '';
  static String profession = '';
  static String address = '';
  static String emailAddress = '';
  static String aboutBe = '';
  static File? image;
  static String? gender;
}

class Global {
  final String name;
  final String lastname;
  final String phone;
  final String profession;
  final String address;
  final String emailAddress;
  final String aboutBe;
  final File? image;
  final String? gender;

  Global({
    required this.name,
    required this.lastname,
    required this.phone,
    required this.profession,
    required this.address,
    required this.emailAddress,
    required this.aboutBe,
    required this.image,
    required this.gender,
  });
}

List<Global> personalList = [];

class EducationGlobal {
  static String? schoolname;
  static String? degree;
  static String? startdate;
  static String? enddate;
  static String? schoolStartdate;
  static String? schoolEnddate;
  static GlobalKey<FormState> educationFormKey = GlobalKey<FormState>();
}

class ExperienceGlobal {
  static String? jobtitle;
  static String? companyname;
  static String? compstartdate;
  static String? compenddate;
  static GlobalKey<FormState> experienceFormKey = GlobalKey<FormState>();
}

class ProjectGlobal {
  static List<String> project = ["", ""];
  static List<TextEditingController> controller = [
    TextEditingController(),
    TextEditingController(),
  ];
}

class TechnicalSkillGlobal {
  static List<String> skill = ["", ""];
  static List<String> skillLevel = ["", ""];
  static List<TextEditingController> controller = [
    TextEditingController(),
    TextEditingController(),
  ];
}

Widget textFormField({
  onSaved,
  controller,
  required validator,
  required text,
  icon,
  keyboardType,
  textInputAction,
  maxLength,
}) {
  return TextFormField(
    onSaved: onSaved,
    validator: validator,
    maxLength: maxLength,
    decoration: InputDecoration(
      label: Text(text),
      icon: Icon(
        icon,
        color: const Color(0xFF0277BD),
      ),
    ),
    keyboardType: keyboardType,
    textInputAction: textInputAction,
  );
}
