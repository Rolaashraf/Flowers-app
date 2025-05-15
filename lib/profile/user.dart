<<<<<<< HEAD
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
=======
import 'dart:typed_data';

class User {
  String bio;
  Uint8List? image;
  String name;

  User({required this.name, required this.bio, required this.image});
>>>>>>> ab7297007726b123278549910bd453a47f0598a5
}
