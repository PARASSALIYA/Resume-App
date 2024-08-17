import 'package:resume_app/header_file.dart';

Widget projectWidget() {
  return StatefulBuilder(
    builder: (context, setState) {
      return ElevatedButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
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
                              controller: ProjectGlobal.controller[index],
                              onChanged: (val) {
                                ProjectGlobal.project[index] = val;
                              },
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              ProjectGlobal.controller.removeAt(index);
                              ProjectGlobal.project.removeAt(index);
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
                    ElevatedButton(
                      onPressed: () {
                        ProjectGlobal.project.add("");
                        ProjectGlobal.controller.add(
                          TextEditingController(),
                        );

                        setState(() {});
                      },
                      child: const Icon(Icons.add),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {});
                      },
                      child: const Text("Save"),
                    ),
                  ],
                ),
              ),
            ),
          ).then((value) => setState);
        },
        child: const Text("  + Add Project "),
      );
    },
  );
}
