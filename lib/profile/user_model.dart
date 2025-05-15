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
}
