import 'package:resume_app/header_file.dart';

floatingActionButtonWidget({required BuildContext context, required s}) {
  return FloatingActionButton.small(
    onPressed: () {
      showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: PersonalGlobal.image != null
                ? s.height * 0.23
                : s.height * 0.15,
            padding: const EdgeInsets.all(16),
            width: double.infinity,
            child: StatefulBuilder(builder: (context, setState) {
              return Column(
                children: [
                  iconButton(
                    onPressed: () async {
                      ImagePicker picker = ImagePicker();

                      XFile? xFile =
                          await picker.pickImage(source: ImageSource.camera);

                      PersonalGlobal.image = File(xFile!.path);
                      setState(() {});
                      Navigator.pop(context);
                    },
                    icon: Icons.camera_alt,
                    text: "Camera",
                  ),
                  iconButton(
                    onPressed: () async {
                      ImagePicker picker = ImagePicker();
                      XFile? xFile =
                          await picker.pickImage(source: ImageSource.gallery);

                      PersonalGlobal.image = File(xFile!.path);
                      setState(() {});
                      Navigator.pop(context);
                    },
                    icon: Icons.image,
                    text: "Gallery",
                  ),
                ],
              );
            }),
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
  );
}
