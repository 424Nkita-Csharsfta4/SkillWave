import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:skillwave/course/model/course.dart';
import 'package:skillwave/course/model/udemy_api.dart';

class StepikApiService {
  static const String authToken = 'kKpT0uT0B1OpmiBgZsNj0bmTeN4ab0r7voPiSNBu';

  Future<List<Course>> fetchCourses() async {
    final response = await http.get(
      Uri.parse('${StepikAPI.baseUrl}/courses'),
      headers: {
        'Authorization': 'Bearer $authToken',
      },
    );

    if (response.statusCode == 200) {
      final List<dynamic> coursesJson = json.decode(response.body)['courses'];
      List<Course> courses =
          coursesJson.map((courseJson) => Course.fromJson(courseJson)).toList();
      return courses;
    } else {
      throw Exception('Failed to load courses');
    }
  }

  Future<Course> fetchCourseDetails(int courseId) async {
    final response = await http.get(
      Uri.parse('${StepikAPI.baseUrl}/courses/$courseId'),
      headers: {
        'Authorization': 'Bearer $authToken',
      },
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> courseJson = json.decode(response.body);
      Course course = Course.fromJson(courseJson);
      return course;
    } else {
      throw Exception('Failed to load course details');
    }
  }
}
