class Course {
  final int id;
  final String imageUrl;
  final String name;
  final String description;
  final int lessons;
  final int tests;
  final String documentation;
  final double price;
  final bool isFree; // Добавляем информацию о бесплатности курса

  Course({
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.description,
    required this.lessons,
    required this.tests,
    required this.documentation,
    required this.price, // Добавляем цену курса
    this.isFree = false, // Устанавливаем значение по умолчанию
  });

  factory Course.fromJson(Map<String, dynamic> json) {
    return Course(
      id: json['id'],
      imageUrl: json['imageUrl'],
      name: json['name'],
      description: json['description'],
      lessons: json['lessons'],
      tests: json['tests'],
      documentation: json['documentation'],
      price: json['price'] ?? 0.0,
      isFree: json['isFree'] ?? false,
    );
  }
}
