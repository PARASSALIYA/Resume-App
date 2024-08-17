import 'package:resume_app/header_file.dart';

Widget form({
  required bool hide,
  required size,
  required context,
}) {
  String pattern = r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
  RegExp regExp = RegExp(pattern);
  return Padding(
    padding: const EdgeInsets.all(16),
    child: SingleChildScrollView(
      child: Column(
        children: [
          //Name
          textFormField(
            onSaved: (val) {
              PersonalGlobal.name = val;
            },
            validator: (val) => (val!.isEmpty) ? "Enter your name" : null,
            text: "First Name",
            icon: Icons.person,
            keyboardType: TextInputType.name,
            textInputAction: TextInputAction.next,
          ),

          // Last Name
          textFormField(
            onSaved: (val) {
              PersonalGlobal.lastname = val;
            },
            validator: (val) => (val!.isEmpty) ? "Enter Your Last Name" : null,
            text: "Last Name",
            textInputAction: TextInputAction.next,
          ),
          // Phone
          textFormField(
            onSaved: (val) {
              PersonalGlobal.phone = val;
            },
            validator: (val) =>
                (val!.isEmpty) ? "Enter Your Phone Number" : null,
            maxLength: 10,
            text: "Phone",
            icon: Icons.phone,
            keyboardType: TextInputType.phone,
            textInputAction: TextInputAction.next,
          ),
          // //Email
          textFormField(
            onSaved: (val) {
              PersonalGlobal.emailAddress = val;
            },
            validator: (val) => (val!.isEmpty)
                ? "Enter Your Email Address"
                : (!regExp.hasMatch(val))
                    ? "Enter valid email"
                    : null,
            text: "Email Address",
            icon: Icons.email,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.next,
          ),
          // Profession
          textFormField(
            onSaved: (val) {
              PersonalGlobal.profession = val;
            },
            validator: (val) => (val!.isEmpty) ? "Enter your Profession" : null,
            text: "Profession",
            icon: Icons.work,
          ),

          // Address
          textFormField(
            onSaved: (val) {
              PersonalGlobal.address = val;
            },
            validator: (val) => (val!.isEmpty) ? "Enter Address" : null,
            text: "Address",
            icon: Icons.flag,
          ),
          // About be
          textFormField(
            onSaved: (val) {
              PersonalGlobal.aboutBe = val;
            },
            validator: (val) => (val!.isEmpty) ? "Enter Your About be" : null,
            text: "Profile",
            icon: Icons.info_outline,
          ),
        ],
      ),
    ),
  );
}
