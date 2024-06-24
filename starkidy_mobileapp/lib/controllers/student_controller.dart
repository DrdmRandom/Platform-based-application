import 'dart:convert';
import 'package:http/http.dart' as http;

class StudentController {
  Future<List<dynamic>> fetchStudents() async {
    // Replace with your actual database endpoint
    final response = await http.get(Uri.parse('http://your-database-endpoint.com/students'));

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else {
      throw Exception('Failed to load students');
    }
  }
}
