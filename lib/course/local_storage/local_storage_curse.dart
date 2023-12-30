import 'package:skillwave/course/model/course.dart';

class LocalStorageService {
  // Заглушка данных - список курсов
  static List<Course> courses = [
    Course(
      id: 1,
      imageUrl:
          "https://cdn.stepik.net/media/cache/images/courses/188959/cover_noSA35M/03eb47f01adc9f2655f50f931ccf0840.jpg",
      name: "Буст английского с нуля до автоматизма (◕‿◕)",
      description:
          "Курс направлен на изучение базы, где вся информация предоставлена без лишней воды 📚🧠. Отобранная информация и интересный способ ее подачи превратят скучную школьную программу в увлекательное путешествие по миру английского🌐 Главные отличия: ✔️это выброс лишнего мусора из грамматики и его замена. ✔️информация действительно поможет заговорить на английском. ✔️упрощенный вид подачи материала. ✔️ интересная трактовка времен и правил. ✔️подойдет для тех кто вообще не шарит в английском.",
      lessons: 16,
      tests: 14,
      documentation: "https://example.com/flutter-docs",
      price: 0, // Добавьте цену курса
    ),
    Course(
      id: 2,
      imageUrl:
          "https://cdn.stepik.net/media/cache/images/courses/158385/cover_SPaHBeA/76ef14008f9f02b0fbd97cd39c6f4e34.png",
      name: "PRO Go. Основы программирования",
      description:
          "Курс посвящен базовым понятиям программирования: типы данных, операторы, переменные, условия, циклы, массивы и функции. Он является вводным и подойдет слушателям с небольшим опытом или вообще без опыта программирования. Обучение будет проходить на языке программирования Go.",
      lessons: 37,
      tests: 117,
      documentation: "https://example.com/web-dev-docs",
      price: 199.99, // Добавьте цену курса
    ),
    // Добавьте нужное количество курсов
  ];

  // Метод для получения всех курсов
  List<Course> getAllCourses() {
    return courses;
  }
}
