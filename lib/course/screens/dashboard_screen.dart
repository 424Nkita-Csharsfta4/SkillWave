import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skillwave/course/local_storage/local_storage_curse.dart';
import 'package:skillwave/course/model/course.dart';
import 'package:skillwave/course/screens/course_detail_screen.dart';
import 'package:skillwave/course/widgets/custom_chip.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late List<Course> allCourses;
  late List<Course> displayedCourses;
  int courseIndex = 0;

  @override
  void initState() {
    super.initState();
    allCourses = LocalStorageService.courses;
    displayedCourses = allCourses;
  }

  Future<List<Course>> _loadCourses(BuildContext context) async {
    try {
      setState(() {
        displayedCourses = LocalStorageService.courses;
      });
      return LocalStorageService.courses;
    } catch (e) {
      print('Error loading courses from local storage: $e');
      return [];
    }
  }

  void _searchCourses(String searchText) {
    setState(() {
      displayedCourses = allCourses
          .where((course) =>
              course.name.toLowerCase().contains(searchText.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    var list = [];
    var txtTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        leading: const Icon(
          Icons.menu,
          color: Colors.black,
        ),
        title: Text(
          'Новые курсы',
          style: GoogleFonts.roboto(
            fontSize: 20,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20, top: 7),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: const Color.fromARGB(255, 240, 240, 240),
            ),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.account_circle),
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            decoration:
                const BoxDecoration(border: Border(left: BorderSide(width: 4))),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: TextField(
                    onChanged: _searchCourses,
                    decoration: InputDecoration(
                      hintText: 'Поиск курса',
                      hintStyle: GoogleFonts.poppins(
                        textStyle: txtTheme.titleMedium
                            ?.copyWith(color: Colors.grey.withOpacity(0.5)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 45,
            child: ListView.builder(
              itemCount: list.length,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => GestureDetector(
                onTap: list[index].onPress,
                child: SizedBox(
                  width: 170,
                  height: 45,
                  child: Row(
                    children: [
                      Container(
                        width: 45,
                        height: 45,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.black,
                        ),
                        child: Center(
                          child: Text(
                            list[index].title,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      Flexible(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              list[index].heading,
                              style: txtTheme.titleMedium,
                            ),
                            Text(
                              list[index].subHeading,
                              style: txtTheme.bodyMedium,
                            ),
                            CustomChip(
                              label: displayedCourses.isNotEmpty
                                  ? displayedCourses[courseIndex].name
                                  : '',
                              icon: Icons.star,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            height: 100,
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 3, 3, 3),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Лучшие курсы',
                          style: GoogleFonts.roboto(
                            textStyle: txtTheme.titleMedium?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          'Выберите из наших лучших курсов для успешного обучения.',
                          style: GoogleFonts.poppins(
                            textStyle: txtTheme.bodyMedium?.copyWith(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () async {
                        var localStorageService = LocalStorageService();

                        var index = courseIndex;
                        if (index >= 0 && index < displayedCourses.length) {
                          localStorageService
                              .saveSelectedCourse(displayedCourses[index]);

                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CourseDetailScreen(
                                course: displayedCourses[index],
                              ),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                      ),
                      child: const Text('Подробнее'),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Course>>(
              future: _loadCourses(context),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasError) {
                  return Center(child: Text('Error: ${snapshot.error}'));
                } else if (!snapshot.hasData || displayedCourses.isEmpty) {
                  return const Center(
                      child: Text('No available courses Error 402'));
                } else {
                  return ListView.builder(
                    itemCount: displayedCourses.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(displayedCourses[index].name),
                        subtitle: Text(displayedCourses[index].description),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CourseDetailScreen(
                                course: displayedCourses[index],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
