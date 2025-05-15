import 'dart:io';

class User {
  User({
    required this.name,
    required this.bio,
    required this.image,
  });
  String name;

  String bio;

  File? image;
}
