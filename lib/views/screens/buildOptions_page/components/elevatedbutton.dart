import 'package:resume_app/header_file.dart';

Widget elevatedButtonWidget({required onPressed, required text}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ButtonStyle(
      backgroundColor: WidgetStateProperty.all(
        const Color(0xFF0277BD),
      ),
    ),
    child: Text(
      text,
      style: const TextStyle(
        fontSize: 18,
        color: Colors.white,
        fontWeight: FontWeight.w500,
      ),
    ),
  );
}
