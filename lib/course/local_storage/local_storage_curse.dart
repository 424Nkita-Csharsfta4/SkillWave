import 'package:skillwave/course/model/course.dart';

class LocalStorageService {
  /// Заглушка данных - список курсов
  static List<Course> courses = [
    Course(
      id: 1,
      imageUrl:
          "https://sun9-46.userapi.com/impg/dkQjxKb7B355E1PWWmKdH_cya3NMCEGiTEoqVw/fQgXtfAKODo.jpg?size=225x225&quality=96&sign=5aa724b319aeb775f8a1216d934004aa&type=album",
      name: "Буст английского с нуля до автоматизма (◕‿◕)",
      description:
          "Курс направлен на изучение базы, где вся информация предоставлена без лишней воды 📚🧠. Отобранная информация и интересный способ ее подачи превратят скучную школьную программу в увлекательное путешествие по миру английского🌐 Главные отличия: ✔️это выброс лишнего мусора из грамматики и его замена. ✔️информация действительно поможет заговорить на английском. ✔️упрощенный вид подачи материала. ✔️ интересная трактовка времен и правил. ✔️подойдет для тех кто вообще не шарит в английском.",
      lessons: 16,
      tests: 14,
      documentation: "https://stepik.org/course/188959/promo",
      price: 0,
    ),
    Course(
      id: 2,
      imageUrl:
          "https://sun9-27.userapi.com/impg/OuTqT8ihzwjLd7meSRJ8Q1F3zKEPHS-un_9obA/Jlrq8ixxfns.jpg?size=230x230&quality=96&sign=846d2dd8e98881d9195d23089856b490&type=album",
      name: "PRO Go. Основы программирования",
      description:
          "Курс посвящен базовым понятиям программирования: типы данных, операторы, переменные, условия, циклы, массивы и функции. Он является вводным и подойдет слушателям с небольшим опытом или вообще без опыта программирования. Обучение будет проходить на языке программирования Go.",
      lessons: 37,
      tests: 117,
      documentation: "https://stepik.org/course/158385/promo",
      price: 199.99,
    ),
  ];

  /// Метод для получения всех курсов
  List<Course> getAllCourses() {
    return courses;
  }

  void saveSelectedCourse(Course selectedCourse) {
    // TODO: Сохранение выбранного курса в локальное хранилище
    // Это место для логики сохранения курса в локальное хранилище
    print('Курсы сохранены: ${selectedCourse.name}');
  }
}
