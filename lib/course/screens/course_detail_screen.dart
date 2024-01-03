import 'package:flutter/material.dart';
import 'package:skillwave/course/model/course.dart';
import 'package:skillwave/course/services/udemy_api_service.dart';

class CourseDetailScreen extends StatelessWidget {
  final Course course;

  const CourseDetailScreen({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        /// Заголовок экрана - название курса
        title: Text(course.name),
      ),
      body: FutureBuilder<Course>(
        /// Получение подробностей о курсе через API
        future: StepikApiService().fetchCourseDetails(course.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            /// Ожидание данных - отображение индикатора загрузки
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            /// Обработка ошибок при получении данных
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            /// Обработка сценария отсутствия данных о курсе
            return const Center(child: Text('No course details available'));
          } else {
            /// Отображение подробностей о курсе, если они доступны
            final courseDetails = snapshot.data!;
            return SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Название курса с использованием жирного шрифта
                  Text(courseDetails.name,
                      style: const TextStyle(
                          fontSize: 24, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 10),

                  /// Описание курса
                  Text(courseDetails.description),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
