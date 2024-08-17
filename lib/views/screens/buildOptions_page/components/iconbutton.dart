import 'package:resume_app/header_file.dart';

Widget iconButton(
    {required text, required icon, required VoidCallback onPressed}) {
  return IconButton(
    onPressed: onPressed,
    icon: Row(
      children: [
        Icon(
          icon,
          size: 25,
          color: const Color(0xFF0277BD),
        ),
        const SizedBox(width: 10),
        Text(
          text,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black,
          ),
        ),
      ],
    ),
  );
}
