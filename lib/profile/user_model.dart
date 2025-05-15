<<<<<<< HEAD
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tree/profile/user.dart';

class UserModel extends ChangeNotifier {
  final ImagePicker imagePicker = ImagePicker();

  // Initialize the user with default name and bio
  UserModel() {
    _user = User(
      name: "Rola Ashraf",
      bio: "Code. Sleep. Eat. Repeat.",
      image: null,
    );
  }

  User? _user;
  User? get user => _user;

  // Pick an image from camera or gallery
  Future<void> imageSelector(ImageSource source) async {
    try {
      final XFile? pickedImage = await imagePicker.pickImage(source: source);
      if (pickedImage != null) {
        _user = User(
          name: _user?.name ?? "Ereeny Nassef",
          bio: _user?.bio ?? "Code. Sleep. Eat. Repeat.",
          image: File(pickedImage.path),
        );
        notifyListeners();
      }
    } catch (e) {
      debugPrint("Image selection error: $e");
    }
  }

  // Remove the profile image
  void removeImage() {
    if (_user != null) {
      _user = User(
        name: _user!.name,
        bio: _user!.bio,
        image: null,
      );
      notifyListeners();
    }
  }
=======
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/profile/user.dart';

class userModel extends ChangeNotifier {
  final ImagePicker imagePicker = ImagePicker();
  User? _user;

  User? get user => _user;

  Future<void> imageSelector(ImageSource source) async {
    final XFile? image = await imagePicker.pickImage(source: source);
    if (image != null) {
      final bytes = await image.readAsBytes();
      if (_user != null) {
        _user!.image = bytes;
      } else {
        _user = User(
          name: "Nour Ahmed",
          bio: "Code. Sleep. Eat. Repeat",
          image: bytes,
        );
      }
      notifyListeners();
    }
  }

  void removeImage() {
    _user?.image = null;
    notifyListeners();
  }
>>>>>>> ab7297007726b123278549910bd453a47f0598a5
}
