import 'package:flutter/material.dart';
import 'package:skillwave/screens/auntification/login/login.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _OnboardingState createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final PageController controller = PageController(initialPage: 0);
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    controller.addListener(() {
      setState(() {
        currentPage = controller.page!.round();
      });
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      body: Stack(
        alignment: Alignment.center,
        children: [
          PageView(
            controller: controller,
            children: [
              _buildPage(
                imageUrl: '../assets/image/First_Persons.png',
                title: 'Добро пожаловать!',
                subtitle:
                    'Приветствуем тебя на платформе, где ты сможешь раскрыть свой потенциал через обучение. Наши курсы созданы для того, чтобы помочь тебе освоить новые навыки, расширить горизонты и достичь новых вершин.',
              ),
              _buildPage(
                imageUrl: '../assets/image/Two_Persons.png',
                title: 'Исследуй возможности',
                subtitle:
                    'Наши курсы предоставляют уникальную возможность глубоко погрузиться в увлекательные области знаний. Давай вместе сделаем обучение интересным и продуктивным!',
              ),
              _buildPage(
                imageUrl: '../assets/image/Free_Persons.png',
                title: 'Погружение в обучение',
                subtitle:
                    'Готов ли ты начать учиться? Вместе мы откроем новые горизонты и обретем новые навыки. Наши курсы разработаны для того, чтобы каждый шаг был увлекательным и образовательным.',
                isLastPage:
                    true, // Добавим флаг, чтобы понять, что это последний экран
              ),
              Login(),
            ],
          ),
          Positioned(
            bottom: 30, // Перемещаем иконки вниз
            child: Visibility(
              visible:
                  currentPage != 3, // Проверяем, не последняя ли это страница
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  Color color =
                      index == currentPage ? Colors.black : Colors.grey;
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: color,
                        shape: BoxShape.circle,
                      ),
                    ),
                  );
                }),
              ),
            ),
          ),
          if (currentPage != 3) // Проверяем, не последняя ли это страница
            Positioned(
              bottom: 80,
              right: 20,
              child: IconButton(
                icon: const Icon(Icons.arrow_forward),
                onPressed: () {
                  if (currentPage < 3) {
                    controller.animateToPage(
                      currentPage + 1,
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut,
                    );
                  }
                },
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildPage({
    required String imageUrl,
    required String title,
    required String subtitle,
    bool isLastPage = false,
  }) {
    return Center(
      child: Container(
        width: 390,
        height: 844,
        clipBehavior: Clip.antiAlias,
        decoration: const BoxDecoration(color: Colors.white),
        child: Stack(
          children: [
            Positioned(
              left: 78,
              top: 138,
              child: Container(
                width: 256,
                height: 359,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(imageUrl),
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
            Positioned(
              left: 72,
              top: 516,
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 24,
                  fontFamily: 'Roboto Mono',
                  fontWeight: FontWeight.w400,
                  height: 1.5, // Adjusted line height
                ),
              ),
            ),
            Positioned(
              left: 72,
              top: 571,
              child: SizedBox(
                width: 246,
                height: 124,
                child: Text(
                  subtitle,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 13,
                    fontFamily: 'Roboto Mono',
                    fontWeight: FontWeight.w400,
                    height: 1.5, // Adjusted line height
                  ),
                ),
              ),
            ),
            const Positioned(
              left: 108,
              top: 59,
              child: SizedBox(
                width: 234,
                child: Text(
                  'SkillWeave',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 36,
                    fontFamily: 'Roboto Mono',
                    fontWeight: FontWeight.w700,
                    height: 1.5,
                  ),
                ),
              ),
            ),
            if (isLastPage) // Проверяем, последняя ли это страница
              Positioned(
                bottom: 80,
                right: 20,
                child: !isLastPage
                    ? IconButton(
                        icon: const Icon(Icons.arrow_forward),
                        onPressed: () {
                          if (currentPage < 3) {
                            controller.animateToPage(
                              currentPage + 1,
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            );
                          }
                        },
                      )
                    : const SizedBox(),
              ),
          ],
        ),
      ),
    );
  }
}
