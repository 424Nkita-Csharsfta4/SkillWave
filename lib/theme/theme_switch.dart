// ignore_for_file: unused_element

import 'package:flutter/material.dart';

class ThemeSwitcher extends StatefulWidget {
  const ThemeSwitcher({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ThemeSwitcherState createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<ThemeSwitcher> {
  bool _isDarkMode = false;

  void _toggleTheme() {
    setState(() {
      _isDarkMode = !_isDarkMode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Theme Switcher'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Switch Theme',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            ElevatedButton(
              onPressed: _toggleTheme, // Меняем тему при нажатии на кнопку
              child: Text(_isDarkMode
                  ? 'Switch to Light Theme'
                  : 'Switch to Dark Theme'),
            ),
          ],
        ),
      ),
      // Применяем текущую выбранную тему к Scaffold
      backgroundColor: Theme.of(context).colorScheme.background,
    );
  }
}
