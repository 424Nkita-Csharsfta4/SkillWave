import 'package:flutter/material.dart';

class CustomChip extends StatelessWidget {
  final String label;
  final IconData icon;

  const CustomChip({Key? key, required this.label, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 18,
          ),
          const SizedBox(width: 4),
          Text(
            label,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 33, 33, 34),
      elevation: 2,
      padding: const EdgeInsets.symmetric(horizontal: 8),
    );
  }
}
