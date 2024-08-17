import 'package:resume_app/header_file.dart';

class BuildOptionsPage extends StatefulWidget {
  const BuildOptionsPage({super.key});

  @override
  State<BuildOptionsPage> createState() => _BuildOptionsPageState();
}

class _BuildOptionsPageState extends State<BuildOptionsPage> {
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
          "Profile",
          style: TextStyle(fontWeight: FontWeight.w500),
        ),
        actions: [
          const Icon(
            Icons.diamond_outlined,
          ),
          const SizedBox(
            width: 20,
          ),
          elevatedButtonWidget(
            onPressed: () {
              Navigator.pushNamed(context, Routes.pdfpage);
            },
            text: "View",
          ),
          const SizedBox(
            width: 20,
          ),
        ],
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          mainAxisSpacing: 8,
          childAspectRatio: 0.9,
        ),
        padding: const EdgeInsets.all(10),
        itemCount: Routes.buildoption.length,
        itemBuilder: (context, index) => Container(
          margin: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                spreadRadius: 1,
                blurRadius: 3,
                offset: const Offset(3, 3),
              ),
            ],
          ),
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(
                context,
                Routes.buildoption[index]['route'],
              );
            },
            child: Column(
              children: [
                const Spacer(),
                Image.asset(
                  Routes.buildoption[index]['icon'],
                  height: 90,
                ),
                const Spacer(),
                Text(
                  Routes.buildoption[index]['name'],
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF0277BD),
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
