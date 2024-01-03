class Course {
  /// Уникальный идентификатор курса
  final int id;

  /// URL изображения курса
  final String imageUrl;

  /// Название курса
  final String name;

  /// Описание курса
  final String description;

  /// Количество уроков
  final int lessons;

  /// Количество тестов
  final int tests;

  /// Ссылка на документацию курса
  final String documentation;

  /// Цена курса
  final double price;

  /// Признак бесплатности курса
  final bool isFree;

  Course({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.lessons,
    required this.tests,
    required this.documentation,
    required this.price, // Цена курса
    this.isFree = false, // По умолчанию курс платный
  });

  /// Фабричный метод для создания экземпляра курса из JSON
  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      imageUrl: json['imageUrl'],
      name: json['name'],
      description: json['description'],
      lessons: json['lessons'],
      tests: json['tests'],
      documentation: json['documentation'],
      price: json['price'] ??
          0.0, // Если цена не указана, устанавливаем значение по умолчанию
      isFree: json['isFree'] ??
          false, // Если информация о бесплатности не указана, устанавливаем значение по умолчанию
    );
  }
}
