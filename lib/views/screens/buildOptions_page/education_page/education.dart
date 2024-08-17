import 'package:resume_app/header_file.dart';

class EducationPage extends StatefulWidget {
  const EducationPage({super.key});

  @override
  State<EducationPage> createState() => _EducationPageState();
}

class _EducationPageState extends State<EducationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(Icons.arrow_back_ios),
        ),
        title: const Text("Education"),
        actions: [
          elevatedButtonWidget(
            onPressed: () {
              Navigator.pushNamed(
                context,
                Routes.buildoption[2]['route'],
              );
            },
            text: "Next",
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(
            height: 40,
          ),
          Center(
            child: elevatedButtonWidget(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    content: SingleChildScrollView(
                      child: Form(
                        key: EducationGlobal.educationFormKey,
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // degree
                            textFormField(
                              onSaved: (val) => EducationGlobal.degree = val,
                              validator: (val) =>
                                  (val!.isEmpty) ? "Enter your degree" : null,
                              text: "Degree",
                              icon: Icons.featured_play_list,
                            ),
                            // start date
                            textFormField(
                              onSaved: (val) => EducationGlobal.startdate = val,
                              validator: (val) => (val!.isEmpty)
                                  ? "Enter your start date"
                                  : null,
                              text: "Start Date",
                              icon: Icons.date_range,
                              keyboardType: TextInputType.number,
                            ),
                            // end date
                            textFormField(
                              onSaved: (val) => EducationGlobal.enddate = val,
                              validator: (val) =>
                                  (val!.isEmpty) ? "Enter your end date" : null,
                              text: "End Date",
                              icon: Icons.date_range,
                              keyboardType: TextInputType.number,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                elevatedButtonWidget(
                                  onPressed: () {
                                    if (EducationGlobal
                                        .educationFormKey.currentState!
                                        .validate()) {
                                      EducationGlobal
                                          .educationFormKey.currentState!
                                          .save();
                                    }
                                    if (EducationGlobal
                                        .educationFormKey.currentState!
                                        .validate()) {
                                      EducationGlobal
                                          .educationFormKey.currentState!
                                          .save();

                                      SnackBar snackBar = SnackBar(
                                        content: Text(
                                          "${PersonalGlobal.name} ${PersonalGlobal.lastname} has been added",
                                        ),
                                        backgroundColor: Colors.green,
                                        behavior: SnackBarBehavior.floating,
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    } else {
                                      SnackBar snackBar = const SnackBar(
                                        content: Text(
                                          "Please fill all the fields",
                                        ),
                                        backgroundColor: Colors.red,
                                        behavior: SnackBarBehavior.floating,
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    }
                                    Navigator.pop(context);
                                  },
                                  text: "Save",
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
              text: "  + Add Education ",
            ),
          ),
        ],
      ),
    );
  }
}
