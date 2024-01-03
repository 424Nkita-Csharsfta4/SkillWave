import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:skillwave/course/model/course.dart';
import 'package:skillwave/course/model/udemy_api.dart';

class StepikApiService {
  static const String authToken = 'kKpT0uT0B1OpmiBgZsNj0bmTeN4ab0r7voPiSNBu';
  static final Dio _dio = Dio();

  /// Получение списка курсов
  Future<List<Course>> fetchCourses() async {
    try {
      final response = await _dio.get(
        '${StepikAPI.baseUrl}/courses',
        options: Options(
          headers: {
            'Authorization': 'Bearer $authToken',
          },
        ),
      );

      if (response.statusCode == 200) {
        final List<dynamic> coursesJson = response.data['courses'];
        List<Course> courses = coursesJson
            .map((courseJson) => Course.fromJson(courseJson))
            .toList();
        return courses;
      } else {
        throw Exception('Failed to load courses');
      }
    } catch (error) {
      throw Exception('Failed to load courses: $error');
    }
  }

  /// Получение подробной информации о курсе по его ID
  Future<Course> fetchCourseDetails(int courseId) async {
    try {
      final response = await _dio.get(
        '${StepikAPI.baseUrl}/courses/$courseId',
        options: Options(
          headers: {
            'Authorization': 'Bearer $authToken',
          },
        ),
      );

      if (response.statusCode == 200) {
        final Map<String, dynamic> courseJson = response.data;
        Course course = Course.fromJson(courseJson);
        return course;
      } else {
        throw Exception('Failed to load course details');
      }
    } catch (error) {
      throw Exception('Failed to load course details: $error');
    }
  }
}
