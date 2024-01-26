import 'package:flutter/material.dart';
import 'package:skillwave/course/local_storage/local_storage_curse.dart';
import 'package:skillwave/course/model/course.dart';
import '../widgets/custom_card.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SkillWave Курсы'),
        actions: [
          IconButton(
            icon: const Icon(Icons.person),
            onPressed: () {
              Navigator.pushNamed(context, '/profile');
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 0, 0, 0),
              ),
              child: Text('SkillWave',
                  style: TextStyle(fontSize: 24, color: Colors.white)),
            ),
            ListTile(
              title: const Text('Курсы', style: TextStyle(fontSize: 18)),
              leading: const Icon(Icons.book),
              onTap: () {
                // Обработка выбора пункта меню
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Организация', style: TextStyle(fontSize: 18)),
              leading: const Icon(Icons.business),
              onTap: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Поиск курса...',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: LocalStorageService.courses.length,
                itemBuilder: (context, index) {
                  Course course = LocalStorageService.courses[index];
                  return CustomCard(course: course);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
