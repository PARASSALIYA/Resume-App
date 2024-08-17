import 'package:resume_app/header_file.dart';

class ProjectPage extends StatefulWidget {
  const ProjectPage({super.key});

  @override
  State<ProjectPage> createState() => _ProjectPageState();
}

class _ProjectPageState extends State<ProjectPage> {
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
        title: const Text("Project"),
        actions: [
          elevatedButtonWidget(
            onPressed: () {
              Navigator.pushNamed(
                context,
                Routes.pdfpage,
              );
              setState(() {});
            },
            text: "View",
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
                              children: [
                                const Text("Project"),
                                ...List.generate(
                                  ProjectGlobal.project.length,
                                  (index) => Row(
                                    children: [
                                      Expanded(
                                        child: TextField(
                                          controller:
                                              ProjectGlobal.controller[index],
                                          onChanged: (val) {
                                            ProjectGlobal.project[index] = val;
                                          },
                                        ),
                                      ),
                                      IconButton(
                                        onPressed: () {
                                          if (ProjectGlobal.project.length >
                                              2) {
                                            ProjectGlobal.controller
                                                .removeAt(index);
                                            ProjectGlobal.project
                                                .removeAt(index);
                                          }
                                          setState(() {});
                                        },
                                        icon: const Icon(Icons.delete),
                                      ),
                                    ],
                                  ),
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: TextButton(
                                    onPressed: () {
                                      ProjectGlobal.project.add("");
                                      ProjectGlobal.controller.add(
                                        TextEditingController(),
                                      );

                                      setState(() {});
                                    },
                                    style: ButtonStyle(
                                      foregroundColor: WidgetStateProperty.all(
                                        const Color(0xFF0277BD),
                                      ),
                                    ),
                                    child: const Text(
                                      "Add Project",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                                elevatedButtonWidget(
                                  onPressed: () {
                                    ProjectGlobal.controller
                                        .add(TextEditingController());

                                    setState(() {});
                                    Navigator.pop(context);
                                  },
                                  text: "Save",
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ).then((value) => setState(() {}));
                },
                text: "  + Add Project ",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
