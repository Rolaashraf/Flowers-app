import 'dart:io';

import 'package:flutter/material.dart';

class Options extends StatelessWidget {
  final String title;
  final IconData icon;
  final File? selectedImage;
  final VoidCallback onPressed;

  const Options({
    required this.onPressed,
    required this.title,
    required this.icon,
    this.selectedImage,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Color iconColor = (title == "Delete" && selectedImage == null)
        ? Colors.grey
        : (title == "Delete" ? Colors.red : Colors.black);

    return Column(
      children: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(icon, color: iconColor),
        ),
        Text(
          title,
          style: TextStyle(color: iconColor),
        ),
      ],
    );
  }
}
