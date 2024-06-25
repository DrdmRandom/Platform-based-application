import 'package:flutter/material.dart';

class AttendanceInputPage extends StatefulWidget {
  final String mataKuliah;
  final String kelas;

  AttendanceInputPage({required this.mataKuliah, required this.kelas});

  @override
  _AttendanceInputPageState createState() => _AttendanceInputPageState();
}

class _AttendanceInputPageState extends State<AttendanceInputPage> {
  final Map<String, bool> attendance = {
    'Aether': false,
    'Cealus': false,
    'Dawwi': false,
    'Dinanti': false,
    'Rover': false,
  };

  void _submitAttendance() {
    // Handle the attendance submission logic here
    print('Submitting attendance: $attendance');
    Navigator.pop(context, true); // Return to the previous screen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Attendance for ${widget.mataKuliah} - ${widget.kelas}'),
        backgroundColor: Color.fromRGBO(90, 158, 183, 1),
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: attendance.keys.map((student) {
          return Card(
            color: Color.fromRGBO(90, 158, 183, 1),
            child: ListTile(
              title: Text(
                student,
                style: TextStyle(color: Colors.white),
              ),
              trailing: Checkbox(
                value: attendance[student],
                onChanged: (bool? value) {
                  setState(() {
                    attendance[student] = value!;
                  });
                },
              ),
            ),
          );
        }).toList(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _submitAttendance,
        backgroundColor: Color.fromRGBO(90, 158, 183, 1),
        child: Icon(Icons.check),
      ),
    );
  }
}
