import 'package:flutter/material.dart';
import '../Components/headerBar.dart';

void main() {
  runApp(NewQuizApp());
}

class NewQuizApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'New Quiz',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NewQuizScreen(),
    );
  }
}

class NewQuizScreen extends StatefulWidget {
  @override
  _NewQuizScreenState createState() => _NewQuizScreenState();
}

class _NewQuizScreenState extends State<NewQuizScreen> {
  final _formKey = GlobalKey<FormState>();
  String quizName = '';
  int timeLimitHour = 0;
  int timeLimitMinute = 0;
  int attemptAllowed = 1;
  DateTime dueTime = DateTime.now();
  List<Map<String, dynamic>> questions = [
    {'question': '', 'answer': ''},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(135),
        child: HeaderBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildQuizInfoSection(),
                SizedBox(height: 20),
                _buildQuestionSection(),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    child: Text('Post'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildQuizInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quiz Info',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        TextFormField(
          decoration: InputDecoration(labelText: 'Quiz Name'),
          onChanged: (value) {
            setState(() {
              quizName = value;
            });
          },
        ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Hour'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    timeLimitHour = int.parse(value);
                  });
                },
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Minute'),
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  setState(() {
                    timeLimitMinute = int.parse(value);
                  });
                },
              ),
            ),
          ],
        ),
        TextFormField(
          decoration: InputDecoration(labelText: 'Attempt Allowed'),
          keyboardType: TextInputType.number,
          onChanged: (value) {
            setState(() {
              attemptAllowed = int.parse(value);
            });
          },
        ),
        Row(
          children: [
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Due Date'),
                readOnly: true,
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                    context: context,
                    initialDate: dueTime,
                    firstDate: DateTime.now(),
                    lastDate: DateTime(2100),
                  );
                  if (pickedDate != null) {
                    setState(() {
                      dueTime = pickedDate;
                    });
                  }
                },
                controller: TextEditingController(
                  text: "${dueTime.toLocal()}".split(' ')[0],
                ),
              ),
            ),
            Expanded(
              child: TextFormField(
                decoration: InputDecoration(labelText: 'Due Time'),
                readOnly: true,
                onTap: () async {
                  TimeOfDay? pickedTime = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.fromDateTime(dueTime),
                  );
                  if (pickedTime != null) {
                    setState(() {
                      dueTime = DateTime(
                        dueTime.year,
                        dueTime.month,
                        dueTime.day,
                        pickedTime.hour,
                        pickedTime.minute,
                      );
                    });
                  }
                },
                controller: TextEditingController(
                  text: "${dueTime.hour.toString().padLeft(2, '0')}:${dueTime.minute.toString().padLeft(2, '0')}",
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildQuestionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Questions',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        ...questions.map((question) {
          int index = questions.indexOf(question);
          return Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Card(
              color: Color.fromRGBO(90, 158, 183, 1),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Question ${index + 1}',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      onChanged: (value) {
                        setState(() {
                          questions[index]['question'] = value;
                        });
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                        labelText: 'Answer',
                        filled: true,
                        fillColor: Colors.white,
                      ),
                      onChanged: (value) {
                        setState(() {
                          questions[index]['answer'] = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
          );
        }).toList(),
        TextButton(
          onPressed: () {
            setState(() {
              questions.add({'question': '', 'answer': ''});
            });
          },
          child: Text('Add Question'),
        ),
      ],
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Process the form submission
      print('Quiz Name: $quizName');
      print('Time Limit: $timeLimitHour hours and $timeLimitMinute minutes');
      print('Attempt Allowed: $attemptAllowed');
      print('Due Time: $dueTime');
      print('Questions: $questions');
    }
  }
}