import 'package:flutter/material.dart';
import '../controllers/database_helper.dart';

class StudentReportBook extends StatefulWidget {
  @override
  _StudentReportBookPageState createState() => _StudentReportBookPageState();
}

class _StudentReportBookPageState extends State<StudentReportBook> {
  final DatabaseHelper _dbHelper = DatabaseHelper();
  List<Map<String, dynamic>> _students = [];

  @override
  void initState() {
    super.initState();
    _loadStudentIDs();
  }

  Future<void> _loadStudentIDs() async {
    print('Loading student IDs...');
    var students = await _dbHelper.getAllStudentIDs();
    print('Student IDs loaded: $students');
    setState(() {
      _students = students;
    });
  }

  Future<void> _showNoteDialog(String studentId) async {
    var report = await _dbHelper.getReport(studentId);
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Note for $studentId'),
          content: Text(report?['note'] ?? 'No note found for this student ID'),
          actions: <Widget>[
            TextButton(
              child: Text('Close'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Student Report Book'),
        backgroundColor: Color.fromRGBO(90, 158, 183, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: _students.isEmpty
            ? Center(child: CircularProgressIndicator())
            : ListView.builder(
          itemCount: _students.length,
          itemBuilder: (context, index) {
            return Card(
              margin: const EdgeInsets.symmetric(vertical: 8.0),
              child: ListTile(
                title: Text(_students[index]['studentId']),
                trailing: Icon(Icons.arrow_forward),
                onTap: () => _showNoteDialog(_students[index]['studentId']),
              ),
            );
          },
        ),
      ),
    );
  }
}
