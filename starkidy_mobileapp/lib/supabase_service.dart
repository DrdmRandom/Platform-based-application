import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseService {
  static SupabaseClient? _studentSupabaseClient;
  static SupabaseClient? _teacherSupabaseClient;

  static Future<void> initializeStudentSupabase() async {
    _studentSupabaseClient = SupabaseClient(
      'https://quixunexplcapuhdsbbw.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InF1aXh1bmV4cGxjYXB1aGRzYmJ3Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTg3MTYxNTksImV4cCI6MjAzNDI5MjE1OX0.zcOi8BC_JwUxKz2usAZ5NrAnQZmn7Q7W8kT7PekNATs',
    );
  }

  static Future<void> initializeTeacherSupabase() async {
    _teacherSupabaseClient = SupabaseClient(
      'https://rumsspsaevjseyqhfssv.supabase.co',
      'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJ1bXNzcHNhZXZqc2V5cWhmc3N2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTkzMTg2NDUsImV4cCI6MjAzNDg5NDY0NX0.59u8ny6GnQRLvUr4R4WdXXCkFi1lS17XesOEUdLa9zc',
    );
  }

  static SupabaseClient get studentSupabaseClient {
    if (_studentSupabaseClient == null) {
      throw Exception("Student Supabase Client is not initialized");
    }
    return _studentSupabaseClient!;
  }

  static SupabaseClient get teacherSupabaseClient {
    if (_teacherSupabaseClient == null) {
      throw Exception("Teacher Supabase Client is not initialized");
    }
    return _teacherSupabaseClient!;
  }
}
