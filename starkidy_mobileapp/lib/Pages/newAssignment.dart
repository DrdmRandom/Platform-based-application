import 'package:flutter/material.dart';
import '../Components/headerBar.dart';

class newAssignment extends StatefulWidget {
  @override
  _newAssignmentState createState() => _newAssignmentState();
}

class _newAssignmentState extends State<newAssignment> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'New Assignment',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: NewAssignmentScreen(),
    );
  }
}

class NewAssignmentScreen extends StatefulWidget {
  @override
  _NewAssignmentScreenState createState() => _NewAssignmentScreenState();
}

class _NewAssignmentScreenState extends State<NewAssignmentScreen> {
  final _formKey = GlobalKey<FormState>();
  String assignmentName = '';
  int timeLimitHour = 0;
  int timeLimitMinute = 0;
  DateTime dueDate = DateTime.now();
  String description = '';

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
                _buildAssignmentInfoSection(),
                SizedBox(height: 20),
                _buildDescriptionSection(),
                SizedBox(height: 20),
                Center(
                  child: ElevatedButton(
                    onPressed: _submitForm,
                    child: Text('Post Assignment'),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildAssignmentInfoSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Assignment Info',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        TextFormField(
          decoration: InputDecoration(labelText: 'Assignment Name'),
          onChanged: (value) {
            setState(() {
              assignmentName = value;
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
          decoration: InputDecoration(labelText: 'Due Date'),
          readOnly: true,
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: dueDate,
              firstDate: DateTime.now(),
              lastDate: DateTime(2100),
            );
            if (pickedDate != null) {
              setState(() {
                dueDate = pickedDate;
              });
            }
          },
          controller: TextEditingController(
            text: "${dueDate.toLocal()}".split(' ')[0],
          ),
        ),
      ],
    );
  }

  Widget _buildDescriptionSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Description/Question',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        TextFormField(
          decoration: InputDecoration(labelText: 'Description'),
          maxLines: 5,
          onChanged: (value) {
            setState(() {
              description = value;
            });
          },
        ),
      ],
    );
  }

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      // Process the form submission
      print('Assignment Name: $assignmentName');
      print('Time Limit: $timeLimitHour hours and $timeLimitMinute minutes');
      print('Due Date: $dueDate');
      print('Description: $description');
    }
  }
}