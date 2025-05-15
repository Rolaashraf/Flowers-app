import 'dart:io';
import 'dart:typed_data';
import 'dart:html' as html;
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:provider/provider.dart';
import 'package:tree/add_item/item_model.dart';

import '../dashboard/dashboard_screen.dart';
import 'item.dart';

class AddItemScreen extends StatefulWidget {
  const AddItemScreen({super.key});

  @override
  State<AddItemScreen> createState() => AddItemScreenState();
}

class AddItemScreenState extends State<AddItemScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();

  @override
  void dispose() {
    _titleController.dispose();
    _bodyController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/c.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Consumer<ItemModel>(
          builder: (context, itemModel, child) => ListView(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            children: [
              const SizedBox(height: 150),
              GestureDetector(
                onTap: () => itemModel.selectImages(),
                child: Container(
                  color: Colors.white,
                  height: 100,
                  width: MediaQuery.of(context).size.width - 24,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(Icons.camera_alt, size: 40),
                      const SizedBox(height: 8),
                      Text(
                        itemModel.selectedImages.isEmpty
                            ? "Tap to add images"
                            : "Tap to add more images",
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 8),
              if (itemModel.selectedImages.isNotEmpty)
                SizedBox(
                  height: 100,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: itemModel.selectedImages.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Stack(
                        children: [
                          kIsWeb
                              ? Image.network(
                                  itemModel.selectedImages[index] as String,
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                )
                              : Image.memory(
                                  itemModel.selectedImages[index] as Uint8List,
                                  height: 100,
                                  width: 100,
                                  fit: BoxFit.cover,
                                ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: IconButton(
                              icon: const Icon(Icons.close, size: 16),
                              onPressed: () => itemModel.removeImage(index),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              const SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _titleController,
                  decoration: const InputDecoration(
                    hintText: "Title",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: _bodyController,
                  minLines: 3,
                  maxLines: 6,
                  keyboardType: TextInputType.multiline,
                  decoration: const InputDecoration(
                    hintText: "Body",
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () {
          final itemModel = Provider.of<ItemModel>(context, listen: false);

          if (_titleController.text.isEmpty || _bodyController.text.isEmpty) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Please enter title and body')),
            );
            return;
          }

          itemModel.addItem(Item(
            images: List.from(itemModel.selectedImages),
            title: _titleController.text,
            body: _bodyController.text,
            favorite: false,
          ));

          itemModel.selectedImages.clear();
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const DashboardScreen()),
          );
        },
      ),
    );
  }
}
