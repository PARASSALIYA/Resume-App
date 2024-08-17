import 'package:resume_app/header_file.dart';

class ExperiencePage extends StatefulWidget {
  const ExperiencePage({super.key});

  @override
  State<ExperiencePage> createState() => _ExperiencePageState();
}

class _ExperiencePageState extends State<ExperiencePage> {
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
        title: const Text("Experience"),
        actions: [
          elevatedButtonWidget(
            onPressed: () {
              Navigator.pushNamed(
                context,
                Routes.buildoption[3]['route'],
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
                    content: Form(
                      key: ExperienceGlobal.experienceFormKey,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            // job title
                            textFormField(
                              onSaved: (val) => ExperienceGlobal.jobtitle = val,
                              validator: (val) => (val!.isEmpty)
                                  ? "Enter Your job title"
                                  : null,
                              text: "Job Title",
                              icon: Icons.work,
                            ),
                            // company name
                            textFormField(
                              onSaved: (val) =>
                                  ExperienceGlobal.companyname = val,
                              validator: (val) => (val!.isEmpty)
                                  ? "Enter your company name"
                                  : null,
                              text: "Company Name",
                              icon: Icons.badge,
                            ),
                            // start date
                            textFormField(
                              onSaved: (val) =>
                                  ExperienceGlobal.compstartdate = val,
                              validator: (val) => (val!.isEmpty)
                                  ? "Enter your start date"
                                  : null,
                              text: "Start Date",
                              icon: Icons.date_range,
                              keyboardType: TextInputType.datetime,
                            ),
                            // end date
                            textFormField(
                              onSaved: (val) =>
                                  ExperienceGlobal.compenddate = val,
                              validator: (val) =>
                                  (val!.isEmpty) ? "Enter your end date" : null,
                              text: "End Date",
                              icon: Icons.date_range,
                              keyboardType: TextInputType.datetime,
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                elevatedButtonWidget(
                                  onPressed: () {
                                    if (ExperienceGlobal
                                        .experienceFormKey.currentState!
                                        .validate()) {
                                      ExperienceGlobal
                                          .experienceFormKey.currentState!
                                          .save();
                                    }
                                    if (ExperienceGlobal
                                        .experienceFormKey.currentState!
                                        .validate()) {
                                      ExperienceGlobal
                                          .experienceFormKey.currentState!
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
              text: "  + Add Experience ",
            ),
          ),
        ],
      ),
    );
  }
}
