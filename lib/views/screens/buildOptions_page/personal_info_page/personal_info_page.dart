import 'package:resume_app/header_file.dart';

class PersonalInfoPage extends StatefulWidget {
  const PersonalInfoPage({super.key});

  @override
  State<PersonalInfoPage> createState() => _PersonalInfoPageState();
}

class _PersonalInfoPageState extends State<PersonalInfoPage> {
  bool hide = true;
  GlobalKey<FormState> personalInfoKey = GlobalKey<FormState>();
  List<DateTime> dateTime = [];
  @override
  Widget build(BuildContext context) {
    Size s = MediaQuery.sizeOf(context);
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text("Personal Info "),
        actions: [
          const SizedBox(
            width: 10,
          ),
          elevatedButtonWidget(
            onPressed: () {
              if (personalInfoKey.currentState!.validate()) {
                personalInfoKey.currentState!.save();
                setState(
                  () {
                    personalList.add(
                      Global(
                        name: PersonalGlobal.name,
                        lastname: PersonalGlobal.lastname,
                        phone: PersonalGlobal.phone,
                        profession: PersonalGlobal.profession,
                        address: PersonalGlobal.address,
                        emailAddress: PersonalGlobal.emailAddress,
                        aboutBe: PersonalGlobal.aboutBe,
                        image: PersonalGlobal.image,
                        gender: PersonalGlobal.gender,
                      ),
                    );
                  },
                );
              }
              if (personalInfoKey.currentState!.validate()) {
                personalInfoKey.currentState!.save();

                SnackBar snackBar = SnackBar(
                  content: Text(
                    "${PersonalGlobal.name} ${PersonalGlobal.lastname} has been added",
                  ),
                  backgroundColor: Colors.green,
                  behavior: SnackBarBehavior.floating,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              } else {
                SnackBar snackBar = const SnackBar(
                  content: Text(
                    "Please fill all the fields",
                  ),
                  backgroundColor: Colors.red,
                  behavior: SnackBarBehavior.floating,
                );
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
              }
            },
            text: "SAVE",
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: personalInfoKey,
          autovalidateMode: AutovalidateMode.always,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    CircleAvatar(
                      radius: s.height * 0.08,
                      foregroundImage: PersonalGlobal.image != null
                          ? FileImage(PersonalGlobal.image!) as ImageProvider
                          : const NetworkImage(
                              "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png",
                            ),
                    ),
                    // image
                    FloatingActionButton.small(
                      onPressed: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (context) {
                            return Container(
                              height: s.height * 0.15,
                              padding: const EdgeInsets.all(16),
                              width: double.infinity,
                              child: Column(
                                children: [
                                  iconButton(
                                    onPressed: () async {
                                      ImagePicker picker = ImagePicker();

                                      XFile? xFile = await picker.pickImage(
                                          source: ImageSource.camera);

                                      PersonalGlobal.image = File(xFile!.path);
                                      setState(() {});
                                      Navigator.pop(context);
                                    },
                                    icon: Icons.camera_alt,
                                    text: "Take a Picture",
                                  ),
                                  iconButton(
                                    onPressed: () async {
                                      ImagePicker picker = ImagePicker();
                                      XFile? xFile = await picker.pickImage(
                                          source: ImageSource.gallery);

                                      PersonalGlobal.image = File(xFile!.path);
                                      setState(() {});
                                      Navigator.pop(context);
                                    },
                                    icon: Icons.image,
                                    text: "Choose Picture From Gallery",
                                  ),
                                ],
                              ),
                            );
                          },
                        );
                      },
                      backgroundColor: const Color(0xFF0277BD),
                      child: const Icon(
                        Icons.camera_alt,
                        weight: 20,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: s.height * 0.02),
                Visibility(
                  visible: PersonalGlobal.image == null,
                  child: const Text(
                    "Add Profile Picture",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Visibility(
                      visible: PersonalGlobal.image != null,
                      child: iconButton(
                        text: "Change",
                        icon: Icons.edit,
                        onPressed: () {
                          showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Container(
                                height: s.height * 0.15,
                                padding: const EdgeInsets.all(16),
                                width: double.infinity,
                                child: Column(
                                  children: [
                                    iconButton(
                                      onPressed: () async {
                                        ImagePicker picker = ImagePicker();

                                        XFile? xFile = await picker.pickImage(
                                            source: ImageSource.camera);

                                        PersonalGlobal.image =
                                            File(xFile!.path);
                                        setState(() {});
                                        Navigator.pop(context);
                                      },
                                      icon: Icons.camera_alt,
                                      text: "Take a Picture",
                                    ),
                                    iconButton(
                                      onPressed: () async {
                                        ImagePicker picker = ImagePicker();
                                        XFile? xFile = await picker.pickImage(
                                            source: ImageSource.gallery);

                                        PersonalGlobal.image =
                                            File(xFile!.path);
                                        setState(() {});
                                        Navigator.pop(context);
                                      },
                                      icon: Icons.image,
                                      text: "Choose Picture From Gallery",
                                    ),
                                  ],
                                ),
                              );
                            },
                          );
                        },
                      ),
                    ),
                    Visibility(
                      visible: PersonalGlobal.image != null,
                      child: iconButton(
                        onPressed: () {
                          PersonalGlobal.image != null
                              ? PersonalGlobal.image = null
                              : null;
                          setState(() {});
                        },
                        icon: Icons.delete_rounded,
                        text: "Delete",
                      ),
                    ),
                  ],
                ),
                form(
                  hide: hide,
                  size: s,
                  context: context,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
