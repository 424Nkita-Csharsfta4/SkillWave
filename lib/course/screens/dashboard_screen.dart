import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:skillwave/course/local_storage/local_storage_curse.dart';
import 'package:skillwave/course/model/course.dart';
import 'package:skillwave/course/screens/course_detail_screen.dart';
import 'package:http/http.dart' as http;

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  Future<List<Course>> _loadCourses(BuildContext context) async {
    try {
      final response = await http.get(Uri.parse('https://stepik.org/api'));

      if (response.statusCode == 200) {
        final List<dynamic> coursesJson = json.decode(response.body)['courses'];
        List<Course> courses =
            coursesJson.map((json) => Course.fromJson(json)).toList();
        return courses;
      }
    } catch (e) {
      // В случае ошибки при загрузке из API или недоступности API
      // загружаем данные из локального хранилища
      return LocalStorageService.courses;
    }

    // Если ни API, ни локальное хранилище не доступны, возвращаем пустой список
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Новые курсы'),
      ),
      body: FutureBuilder<List<Course>>(
        future: _loadCourses(context),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('Нет доступных курсов Ошибка 402'));
          } else {
            final courses = snapshot.data!;
            return ListView.builder(
              itemCount: courses.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(courses[index].name),
                  subtitle: Text(courses[index].description),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            CourseDetailScreen(course: courses[index]),
                      ),
                    );
                  },
                );
              },
            );
          }
        },
      ),
    );
  }
}
