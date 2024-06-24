class AttendanceController {
  Future<Map<String, List<Map<String, dynamic>>>> fetchAttendance(String studentId) async {
    // Mock data for demonstration purposes
    List<Map<String, dynamic>> data = [
      {
        'student_id': '2023062003',
        'semester': 'Tahun 1 Semester 1',
        'course_id': 'MTK-03-06',
        'attendance': 30,
      },
      {
        'student_id': '2023062003',
        'semester': 'Tahun 1 Semester 1',
        'course_id': 'BHS-02-07',
        'attendance': 40,
      },
      {
        'student_id': '2023062003',
        'semester': 'Tahun 1 Semester 1',
        'course_id': 'SAI-01-09',
        'attendance': 50,
      },
      {
        'student_id': '2023062003',
        'semester': 'Tahun 1 Semester 2',
        'course_id': 'MTK-03-06',
        'attendance': 100,
      },
      {
        'student_id': '2023062003',
        'semester': 'Tahun 1 Semester 2',
        'course_id': 'BHS-02-07',
        'attendance': 100,
      },
      {
        'student_id': '2023062003',
        'semester': 'Tahun 1 Semester 2',
        'course_id': 'SAI-01-09',
        'attendance': 100,
      },
      {
        'student_id': '2023062004',
        'semester': 'Tahun 1 Semester 1',
        'course_id': 'MTK-03-06',
        'attendance': 45,
      },
      {
        'student_id': '2023062004',
        'semester': 'Tahun 1 Semester 1',
        'course_id': 'BHS-02-07',
        'attendance': 55,
      },
      {
        'student_id': '2023062004',
        'semester': 'Tahun 1 Semester 1',
        'course_id': 'SAI-01-09',
        'attendance': 65,
      },
      {
        'student_id': '2023062004',
        'semester': 'Tahun 1 Semester 2',
        'course_id': 'MTK-03-06',
        'attendance': 95,
      },
      {
        'student_id': '2023062004',
        'semester': 'Tahun 1 Semester 2',
        'course_id': 'BHS-02-07',
        'attendance': 90,
      },
      {
        'student_id': '2023062004',
        'semester': 'Tahun 1 Semester 2',
        'course_id': 'SAI-01-09',
        'attendance': 85,
      },
    ];

    // Filter data for the given student ID
    List<Map<String, dynamic>> filteredData = data.where((record) => record['student_id'] == studentId).toList();
    Map<String, List<Map<String, dynamic>>> attendanceData = {};

    for (var record in filteredData) {
      String semester = record['semester'];
      String course = record['course_id'];
      int attendance = record['attendance'];

      attendanceData.putIfAbsent(semester, () => []);
      attendanceData[semester]!.add({
        'course': course,
        'attendance': attendance,
      });
    }

    return attendanceData;
  }
}
