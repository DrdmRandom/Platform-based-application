import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AttendanceController {
  final SupabaseClient _supabaseClient = Supabase.instance.client;

  Future<Map<String, List<Map<String, dynamic>>>> fetchAttendance(String studentId) async {
    final response = await _supabaseClient
        .from('attendance')
        .select()
        .eq('student_id', studentId)
        .execute();

    if (response.error == null) {
      List<dynamic> data = response.data as List<dynamic>;
      Map<String, List<Map<String, dynamic>>> attendanceData = {};

      for (var record in data) {
        String semester = record['semester'];
        String course = record['course'];
        int attendance = record['attendance'];

        if (!attendanceData.containsKey(semester)) {
          attendanceData[semester] = [];
        }

        attendanceData[semester]!.add({
          'course': course,
          'attendance': attendance,
        });
      }

      return attendanceData;
    } else {
      throw Exception('Failed to fetch attendance: ${response.error!.message}');
    }
  }
}
