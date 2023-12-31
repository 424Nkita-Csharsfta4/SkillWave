import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skillwave/course/model/course.dart';
import 'package:skillwave/course/screens/course_detail_screen.dart';
import 'package:skillwave/course/widgets/custom_chip.dart';

class CustomCard extends StatelessWidget {
  final Course course;

  const CustomCard({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      child: Card(
        elevation: 3,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
        child: InkWell(
          onTap: () {
            /// Переход на экран деталей курса при нажатии
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CourseDetailScreen(course: course),
              ),
            );
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              /// Виджет с изображением курса
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12.0),
                  topRight: Radius.circular(12.0),
                ),
                child: Image.asset(
                  course.imageUrl,
                  height: 180,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    /// Название курса
                    Text(
                      course.name,
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(height: 8),

                    /// Описание курса
                    Text(
                      course.description,
                      style: GoogleFonts.roboto(
                        textStyle: const TextStyle(
                          fontSize: 14,
                        ),
                      ),
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),

                    /// Чипы с информацией о курсе (lessons, tests)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomChip(
                          label: 'Lessons: ${course.lessons}',
                          icon: Icons.timer,
                        ),
                        CustomChip(
                          label: 'Tests: ${course.tests}',
                          icon: Icons.assignment,
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),

                    /// Информация о стоимости курса
                    Container(
                      decoration: BoxDecoration(
                        color: course.isFree
                            ? Colors.green
                            : const Color.fromARGB(255, 243, 33, 33),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 8,
                        vertical: 4,
                      ),
                      child: Text(
                        course.isFree ? 'Free' : '\$${course.price}',
                        style: GoogleFonts.poppins(
                          textStyle: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
