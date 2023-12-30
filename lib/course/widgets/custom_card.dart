import 'package:flutter/material.dart';
import 'package:skillwave/course/model/course.dart';
import 'package:skillwave/course/screens/course_detail_screen.dart';
import 'package:skillwave/course/widgets/custom_chip.dart';

class CustomCard extends StatelessWidget {
  final Course course;

  const CustomCard({Key? key, required this.course}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
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
            AspectRatio(
              aspectRatio: 16 / 9,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.network(
                  course.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    course.name,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    course.description,
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        course.isFree ? 'Free' : '\$${course.price}',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: course.isFree ? Colors.green : Colors.black,
                        ),
                      ),
                      const Spacer(),
                      CustomChip(
                          label: 'Lessons: ${course.lessons}',
                          icon: Icons.timer),
                      const SizedBox(width: 8),
                      CustomChip(
                          label: 'Tests: ${course.tests}',
                          icon: Icons.assignment),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
