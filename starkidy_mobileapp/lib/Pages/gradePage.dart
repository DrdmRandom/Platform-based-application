import 'package:flutter/material.dart';
import '../Components/headerBar.dart';

class GradePage extends StatefulWidget {
  @override
  _GradePageState createState() => _GradePageState();
}

class _GradePageState extends State<GradePage> {
  // Dropdown value
  String selectedYear = 'Tahun 1';

  // Data for grades, quizzes, and assignments
  final Map<String, List<Map<String, dynamic>>> gradeData = {
    "Tahun 1": [
      {
        "course": "Matematika",
        "Term": [
          {"name": "1", "score": "A"},
          {"name": "2", "score": "AB"},
          {"name": "3", "score": "BC"},
          {"name": "4", "score": "AB"},
        ],
        "Ujian": [
          {"name": "Tengah Semester", "score": "AB"},
          {"name": "Akhir Semester", "score": "B"},
        ],
      },
      {
        "course": "Ilmu pengetahuan alam (IPA)",
        "Term": [
          {"name": "1", "score": "C"},
          {"name": "2", "score": "B"},
          {"name": "3", "score": "A"},
          {"name": "4", "score": "C"},
        ],
        "Ujian": [
          {"name": "Tengah Semester", "score": "BC"},
          {"name": "Akhir Semester", "score": "B"},
        ],
      },
      {
        "course": "Ilmu pengetahuan Sejarah (IPS)",
        "Term": [
          {"name": "1", "score": "CD"},
          {"name": "2", "score": "CD"},
          {"name": "3", "score": "C"},
          {"name": "4", "score": "AB"},
        ],
        "Ujian": [
          {"name": "Tengah Semester", "score": "CD"},
          {"name": "Akhir Semester", "score": "B"},
        ],
      },
      {
        "course": "Inggris",
        "Term": [
          {"name": "1", "score": "B"},
          {"name": "2", "score": "B"},
          {"name": "3", "score": "A"},
          {"name": "4", "score": "B"},
        ],
        "Ujian": [
          {"name": "Tengah Semester", "score": "B"},
          {"name": "Akhir Semester", "score": "AB"},
        ],
      },
      {
        "course": "Olah Raga",
        "Term": [
          {"name": "1", "score": "A"},
          {"name": "2", "score": "A"},
          {"name": "3", "score": "A"},
          {"name": "4", "score": "A"},
        ],
        "Ujian": [
          {"name": "Tengah Semester", "score": "A"},
          {"name": "Akhir Semester", "score": "A"},
        ],
      },
      {
        "course": "Fisika",
        "Term": [
          {"name": "1", "score": "AB"},
          {"name": "2", "score": "B"},
          {"name": "3", "score": "A"},
          {"name": "4", "score": "A"},
        ],
        "Ujian": [
          {"name": "Tengah Semester", "score": "AB"},
          {"name": "Akhir Semester", "score": "A"},
        ],
      },
      {
        "course": "Seni Rupa",
        "Term": [
          {"name": "1", "score": "A"},
          {"name": "2", "score": "A"},
          {"name": "3", "score": "A"},
          {"name": "4", "score": "A"},
        ],
        "Ujian": [
          {"name": "Tengah Semester", "score": "A"},
          {"name": "Akhir Semester", "score": "B"},
        ],
      },
    ],
    "Tahun 2": [
      {
        "course": "Matematika",
        "Term": [
          {"name": "1", "score": "AB"},
          {"name": "2", "score": "B"},
          {"name": "3", "score": "B"},
          {"name": "4", "score": "A"},
        ],
        "Ujian": [
          {"name": "Tengah Semester", "score": "B"},
          {"name": "Akhir Semester", "score": "AB"},
        ],
      },
      {
        "course": "Ilmu pengetahuan alam (IPA)",
        "Term": [
          {"name": "1", "score": "BC"},
          {"name": "2", "score": "B"},
          {"name": "3", "score": "B"},
          {"name": "4", "score": "BC"},
        ],
        "Ujian": [
          {"name": "Tengah Semester", "score": "BC"},
          {"name": "Akhir Semester", "score": "BC"},
        ],
      },
      {
        "course": "Ilmu pengetahuan Sejarah (IPS)",
        "Term": [
          {"name": "1", "score": "BC"},
          {"name": "2", "score": "BC"},
          {"name": "3", "score": "A"},
          {"name": "4", "score": "D"},
        ],
        "Ujian": [
          {"name": "Tengah Semester", "score": "BC"},
          {"name": "Akhir Semester", "score": "B"},
        ],
      },
      {
        "course": "Inggris",
        "Term": [
          {"name": "1", "score": "AB"},
          {"name": "2", "score": "B"},
          {"name": "3", "score": "A"},
          {"name": "4", "score": "D"},
        ],
        "Ujian": [
          {"name": "Tengah Semester", "score": "AB"},
          {"name": "Akhir Semester", "score": "B"},
        ],
      },
      {
        "course": "Olah Raga",
        "Term": [
          {"name": "1", "score": "A"},
          {"name": "2", "score": "A"},
          {"name": "3", "score": "A"},
          {"name": "4", "score": "A"},
        ],
        "Ujian": [
          {"name": "Tengah Semester", "score": "A"},
          {"name": "Akhir Semester", "score": "A"},
        ],
      },
      {
        "course": "Fisika",
        "Term": [
          {"name": "1", "score": "AB"},
          {"name": "2", "score": "B"},
          {"name": "3", "score": "A"},
          {"name": "4", "score": "A"},
        ],
        "Ujian": [
          {"name": "Tengah Semester", "score": "AB"},
          {"name": "Akhir Semester", "score": "A"},
        ],
      },
      {
        "course": "Seni Rupa",
        "Term": [
          {"name": "1", "score": "A"},
          {"name": "2", "score": "A"},
          {"name": "3", "score": "A"},
          {"name": "4", "score": "A"},
        ],
        "Ujian": [
          {"name": "Tengah Semester", "score": "A"},
          {"name": "Akhir Semester", "score": "B"},
        ],
      },
    ],
    "Tahun 3": [
      {
        "course": "Matematika",
        "Term": [
          {"name": "1", "score": "AB"},
          {"name": "2", "score": "B"},
        ],
        "Ujian": [
          {"name": "Tengah Semester", "score": "B"},
        ],
      },
      {
        "course": "Ilmu pengetahuan alam (IPA)",
        "Term": [
          {"name": "1", "score": "BC"},
          {"name": "2", "score": "B"},
        ],
        "Ujian": [
          {"name": "Tengah Semester", "score": "B"},
        ],
      },
      {
        "course": "Ilmu pengetahuan Sejarah (IPS)",
        "Term": [
          {"name": "1", "score": "C"},
          {"name": "2", "score": "B"},
        ],
        "Ujian": [
          {"name": "Tengah Semester", "score": "BC"},
        ],
      },
      {
        "course": "Inggris",
        "Term": [
          {"name": "1", "score": "AB"},
          {"name": "2", "score": "B"},
        ],
        "Ujian": [
          {"name": "Tengah Semester", "score": "AB"},
        ],
      },
      {
        "course": "Olah Raga",
        "Term": [
          {"name": "1", "score": "A"},
          {"name": "2", "score": "A"},
        ],
        "Ujian": [
          {"name": "Tengah Semester", "score": "A"},
        ],
      },
      {
        "course": "Fisika",
        "Term": [
          {"name": "1", "score": "AB"},
          {"name": "2", "score": "B"},
        ],
        "Ujian": [
          {"name": "Tengah Semester", "score": "AB"},
        ],
      },
      {
        "course": "Seni Rupa",
        "Term": [
          {"name": "1", "score": "A"},
          {"name": "2", "score": "A"},
        ],
        "Ujian": [
          {"name": "Tengah Semester", "score": "A"},
        ],
      },
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(135),
        child: HeaderBar(),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 10, right: 10, bottom: 5, top: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/gradeImage.png', // Change the image to grade related if needed
                      height: 100,
                      width: 100,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Grades",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  padding: EdgeInsets.symmetric(horizontal: 12),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: selectedYear,
                      onChanged: (String? newValue) {
                        setState(() {
                          selectedYear = newValue!;
                        });
                      },
                      items: <String>['Tahun 1', 'Tahun 2', 'Tahun 3']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 8.0),
                            child: Text(value, style: TextStyle(color: Colors.black)),
                          ),
                        );
                      }).toList(),
                      icon: Icon(Icons.arrow_drop_down, color: Colors.black),
                      dropdownColor: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: gradeData[selectedYear]!.length,
              itemBuilder: (context, index) {
                final course = gradeData[selectedYear]![index];
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    color: Color.fromRGBO(90, 158, 183, 1),
                    child: ExpansionTile(
                      title: Text(
                        course['course']!,
                        style: TextStyle(color: Colors.white),
                      ),
                      children: <Widget>[
                        ...course['Term'].map<Widget>((term) {
                          return ListTile(
                            tileColor: Colors.white,
                            title: Text(
                              "Term ${term['name']}",
                              style: TextStyle(color: Colors.black),
                            ),
                            trailing: Text(
                              "${term['score']}",
                              style: TextStyle(color: Colors.black),
                            ),
                          );
                        }).toList(),
                        ...course['Ujian'].map<Widget>((exam) {
                          return ListTile(
                            tileColor: Colors.white,
                            title: Text(
                              "${exam['name']}",
                              style: TextStyle(color: Colors.black),
                            ),
                            trailing: Text(
                              "${exam['score']}",
                              style: TextStyle(color: Colors.black),
                            ),
                          );
                        }).toList(),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
