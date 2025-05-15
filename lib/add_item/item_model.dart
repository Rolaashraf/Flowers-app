import 'package:flutter/foundation.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:typed_data';
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;

import 'item.dart';

class ItemModel extends ChangeNotifier {
  final List<Item> _items = [];
  List<Item> get items => _items;
  
  void addItem(Item item) {
    _items.add(item);
    notifyListeners();
  }

  final ImagePicker _imagePicker = ImagePicker();
  List<dynamic> _selectedImages = [];
  List<dynamic> get selectedImages => _selectedImages;

  Future<void> selectImages() async {
    if (kIsWeb) {
      final uploadInput = html.FileUploadInputElement();
      uploadInput.multiple = true;
      uploadInput.accept = 'image/*';
      uploadInput.click();

      uploadInput.onChange.listen((e) async {
        final files = uploadInput.files;
        if (files != null && files.isNotEmpty) {
          final newImages = <String>[];
          for (final file in files) {
            final reader = html.FileReader();
            reader.readAsDataUrl(file);
            await reader.onLoadEnd.first;
            newImages.add(reader.result as String);
          }
          _selectedImages.addAll(newImages);
          notifyListeners();
        }
      });
    } else {
      final images = await _imagePicker.pickMultiImage();
      if (images != null && images.isNotEmpty) {
        final imageBytes = await Future.wait(
            images.map((xfile) => File(xfile.path).readAsBytes()));
        _selectedImages.addAll(imageBytes);
        notifyListeners();
      }
    }
  }

  void removeImage(int index) {
    _selectedImages.removeAt(index);
    notifyListeners();
  }

  Item? _selectedItem;
  Item? get selectedItem => _selectedItem;

  void selectItem(Item item) {
    _selectedItem = item;
    notifyListeners();
  }
}