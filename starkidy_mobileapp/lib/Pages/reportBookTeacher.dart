import 'package:flutter/material.dart';
import '../controllers/database_helper.dart';

class TeacherReportBook extends StatefulWidget {
  @override
  _TeacherReportBookPageState createState() => _TeacherReportBookPageState();
}

class _TeacherReportBookPageState extends State<TeacherReportBook> {
  final _formKey = GlobalKey<FormState>();
  final _studentIdController = TextEditingController();
  final _noteController = TextEditingController();
  final DatabaseHelper _dbHelper = DatabaseHelper();

  @override
  void dispose() {
    _studentIdController.dispose();
    _noteController.dispose();
    super.dispose();
  }

  Future<void> _saveNote() async {
    if (_formKey.currentState!.validate()) {
      await _dbHelper.addOrUpdateReport(
        _studentIdController.text,
        _noteController.text,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Note saved successfully')),
      );
    }
  }

  Future<void> _loadNote() async {
    var report = await _dbHelper.getReport(_studentIdController.text);
    if (report != null) {
      _noteController.text = report['note'];
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No note found for this student ID')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Report Book'),
        backgroundColor: Color.fromRGBO(90, 158, 183, 1),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                controller: _studentIdController,
                decoration: InputDecoration(labelText: 'Student ID'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a student ID';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _noteController,
                decoration: InputDecoration(labelText: 'Note'),
                maxLines: 5,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a note';
                  }
                  return null;
                },
              ),
              SizedBox(height: 16),
              ElevatedButton(
                onPressed: _saveNote,
                child: Text('Save Note'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(90, 158, 183, 1),
                ),
              ),
              ElevatedButton(
                onPressed: _loadNote,
                child: Text('Load Note'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(90, 158, 183, 1),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
