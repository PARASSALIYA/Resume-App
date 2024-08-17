import 'dart:developer';

import 'package:resume_app/header_file.dart';

class TechnicalSkillPage extends StatefulWidget {
  const TechnicalSkillPage({super.key});

  @override
  State<TechnicalSkillPage> createState() => _TechnicalSkillPageState();
}

class _TechnicalSkillPageState extends State<TechnicalSkillPage> {
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
        title: const Text(
          "Skills",
        ),
        actions: [
          elevatedButtonWidget(
            onPressed: () {
              Navigator.pushNamed(
                context,
                Routes.buildoption[4]['route'],
              );

              setState(() {});
            },
            text: "Next",
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            children: [
              elevatedButtonWidget(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) => StatefulBuilder(
                      builder: (context, setState) {
                        return AlertDialog(
                          content: SingleChildScrollView(
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                const Text("Skills"),
                                ...List.generate(
                                  TechnicalSkillGlobal.skill.length,
                                  (index) => Row(
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          controller: TechnicalSkillGlobal
                                              .controller[index],
                                          onChanged: (val) {
                                            TechnicalSkillGlobal.skill[index] =
                                                val;
                                          },
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          if (TechnicalSkillGlobal
                                                  .skill.length >
                                              2) {
                                            TechnicalSkillGlobal.controller
                                                .removeAt(index);
                                            TechnicalSkillGlobal.skill
                                                .removeAt(index);
                                          }
                                          setState(() {});
                                        },
                                        icon: const Icon(Icons.delete),
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: TextButton(
                                    style: ButtonStyle(
                                      foregroundColor: WidgetStateProperty.all(
                                        const Color(0xFF0277BD),
                                      ),
                                    ),
                                    onPressed: () {
                                      TechnicalSkillGlobal.skill.add("");
                                      TechnicalSkillGlobal.controller.add(
                                        TextEditingController(),
                                      );
                                      setState(() {});
                                    },
                                    child: const Text(
                                      "Add Skill",
                                    ),
                                  ),
                                ),
                                elevatedButtonWidget(
                                  onPressed: () {
                                    setState(() {
                                      TechnicalSkillGlobal.controller
                                          .add(TextEditingController());
                                      log("${TechnicalSkillGlobal.skill}");
                                    });
                                    // Navigator.pop(context);
                                  },
                                  text: " Save ",
                                ),
                                ...TechnicalSkillGlobal.skillLevel.map(
                                  (e) => Text(e),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ).then(
                    (value) => setState(() {}),
                  );
                  setState(() {});
                },
                text: "  + Add Skill  ",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
