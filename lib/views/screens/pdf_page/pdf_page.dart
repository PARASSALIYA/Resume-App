import 'package:pdf/pdf.dart';
import 'package:resume_app/header_file.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

class PdfPage extends StatefulWidget {
  const PdfPage({super.key});

  @override
  State<PdfPage> createState() => _PdfPageState();
}

class _PdfPageState extends State<PdfPage> {
  pw.TextStyle textStyle = const pw.TextStyle(
    fontSize: 21,
  );
  Future<Uint8List> getpdf() async {
    pw.Document pdf = pw.Document();

    pw.TextStyle style = pw.TextStyle(
      fontSize: 22,
      fontWeight: pw.FontWeight.bold,
    );

    var network = await networkImage(
      "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_960_720.png",
    );

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) => pw.Column(
          children: [
            //image
            pw.Stack(
              children: [
                pw.Padding(
                  padding: const pw.EdgeInsets.only(top: 10),
                  child: pw.Divider(
                    indent: 160,
                    thickness: 2,
                  ),
                ),
                pw.Positioned(
                  right: 40,
                  left: 150,
                  bottom: 130,
                  top: 30,
                  child: pw.Center(
                    child: pw.Text(
                      " ${PersonalGlobal.name.toString()}"
                      " ${PersonalGlobal.lastname.toString()}",
                      style: const pw.TextStyle(
                        fontSize: 38,
                      ),
                    ),
                  ),
                ),
                pw.Positioned(
                  right: 40,
                  left: 150,
                  bottom: 5,
                  top: 50,
                  child: pw.Center(
                    child: pw.Text(
                      PersonalGlobal.profession,
                      style: const pw.TextStyle(
                        fontSize: 20,
                      ),
                    ),
                  ),
                ),
                pw.Padding(
                  padding: const pw.EdgeInsets.only(top: 130),
                  child: pw.Divider(
                    indent: 160,
                    thickness: 2,
                  ),
                ),
                pw.Container(
                  height: 160,
                  width: 160,
                  decoration: pw.BoxDecoration(
                    color: PdfColors.grey,
                    shape: pw.BoxShape.circle,
                    image: pw.DecorationImage(
                      image: (PersonalGlobal.image != null)
                          ? pw.MemoryImage(
                              PersonalGlobal.image!.readAsBytesSync(),
                            )
                          : network,
                    ),
                  ),
                ),
              ],
            ),
            pw.SizedBox(
              height: 20,
            ),
            ...personalList.map(
              (e) => pw.Row(
                mainAxisSize: pw.MainAxisSize.min,
                children: [
                  pw.Container(
                    width: 260,
                    height: 535,
                    child: pw.Column(
                      // mainAxisSize: pw.MainAxisSize.min,
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        //CONTACT
                        pw.SizedBox(height: 10),
                        pw.Text(
                          "CONTACT",
                          style: style,
                        ),
                        pw.SizedBox(height: 10),
                        pw.Row(
                          children: [
                            pw.Text(
                              PersonalGlobal.phone,
                              style: textStyle,
                            ),
                          ],
                        ),
                        pw.Text(
                          e.emailAddress,
                          style: textStyle,
                        ),
                        pw.Text(
                          PersonalGlobal.address,
                          style: textStyle,
                        ),

                        pw.SizedBox(height: 10),
                        pw.Divider(endIndent: 40),
                        //ABOUT ME
                        pw.Text(
                          "PROFILE",
                          style: style,
                        ),
                        pw.SizedBox(height: 10),
                        pw.Text(
                          PersonalGlobal.aboutBe,
                          style: textStyle,
                        ),
                        pw.SizedBox(height: 10),
                        //Skill
                        pw.Divider(endIndent: 40),
                        pw.Text(
                          " Skill",
                          style: style,
                        ),
                        pw.SizedBox(height: 10),
                        pw.Column(
                          children: <pw.Widget>[
                            ...List.generate(
                              TechnicalSkillGlobal.skill.length,
                              (index) => pw.Row(
                                children: [
                                  pw.Text(
                                    " - ",
                                    style: textStyle,
                                  ),
                                  pw.Text(
                                    TechnicalSkillGlobal.skill[index],
                                    style: textStyle,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  pw.SizedBox(width: 15),
                  pw.Container(
                    width: 240,
                    height: 530,
                    child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        //CERTIFICATE
                        pw.SizedBox(height: 10),

                        //EDUCATION
                        pw.SizedBox(height: 10),
                        pw.Text(
                          "EDUCATION",
                          style: style,
                        ),
                        pw.SizedBox(height: 10),
                        pw.Text(
                          "${EducationGlobal.degree}",
                          style: textStyle,
                        ),
                        pw.Text(
                          " ${EducationGlobal.startdate} -"
                          " ${EducationGlobal.enddate}",
                          style: textStyle,
                        ),
                        pw.SizedBox(height: 10),
                        pw.Text(
                          "SSC - 80%",
                          style: textStyle,
                        ),
                        pw.SizedBox(height: 10),

                        pw.Text(
                          "Brilliant Vidhyalay School March 2022-2023",
                          style: textStyle,
                        ),
                        pw.SizedBox(height: 10),
                        pw.Text(
                          "CERTIFICATE COURSES",
                          style: pw.TextStyle(
                            fontSize: 19,
                            fontWeight: pw.FontWeight.bold,
                          ),
                        ),
                        pw.SizedBox(height: 10),
                        pw.Text(
                          "Master In Flutter",
                          style: textStyle,
                        ),
                        pw.SizedBox(height: 5),
                        pw.Text(
                          "2023 - 2025",
                          style: textStyle,
                        ),

                        // EXPERIENCE
                        pw.SizedBox(height: 20),
                        pw.Divider(endIndent: 40),
                        pw.SizedBox(height: 10),
                        pw.Text(
                          "Project",
                          style: style,
                        ),
                        pw.SizedBox(height: 10),
                        pw.Column(
                          children: [
                            ...List.generate(
                              ProjectGlobal.project.length,
                              (index) => pw.Row(
                                children: [
                                  pw.Text(
                                    " - ",
                                    style: textStyle,
                                  ),
                                  pw.Text(
                                    ProjectGlobal.project[index],
                                    style: textStyle,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
    return pdf.save();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.arrow_back_ios),
        title: const Text("Pdf Page"),
        actions: const [
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: PdfPreview(
        build: (format) => getpdf(),
      ),
    );
  }
}
