import 'package:resume_app/header_file.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Resume"),
        actions: [
          GestureDetector(
            onTap: () {},
            child: const Icon(Icons.more_vert_outlined),
          ),
          IconButton(
            onPressed: () {
              setState(() {});
            },
            icon: const Icon(
              Icons.refresh,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
      // backgroundColor: Colors.blueGrey.shade200,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, Routes.buildoptionspage);
                },
                child: Material(
                  elevation: 20,
                  // shadowColor: Colors.blueGrey,
                  borderRadius: BorderRadius.circular(20),
                  color: const Color(0xFF0277BD),
                  child: Container(
                    height: 150,
                    alignment: Alignment.center,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "+  Create New",
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w500,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "Resume",
                style: TextStyle(
                  fontSize: 20,
                  // color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
              ),
              ...personalList.map(
                (e) => Card(
                  elevation: 8,
                  surfaceTintColor: Colors.white,
                  child: ListTile(
                    leading: CircleAvatar(
                      foregroundImage: e.image != null
                          ? FileImage(e.image!)
                          : const NetworkImage(
                              "https://static-00.iconduck.com/assets.00/profile-circle-icon-2048x2048-cqe5466q.png",
                            ),
                    ),
                    title: Text("${e.name} ${e.lastname}"),
                    subtitle:
                        Text("Contact: ${e.phone}\nEmail: ${e.emailAddress}"),
                    trailing: IconButton(
                      onPressed: () {
                        personalList.remove(e);
                        setState(() {});
                      },
                      icon: const Icon(Icons.delete),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, Routes.pdfpage);
        },
        backgroundColor: const Color(0xFF0277BD),
        foregroundColor: Colors.white,
        child: const Text(
          "PDF",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
