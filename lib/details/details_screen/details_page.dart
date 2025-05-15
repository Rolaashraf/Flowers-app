import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import '../../profile/profile_page/profile_page.dart';
import '../../profile/user_model.dart';
import 'package:provider/provider.dart';

import '../details_widget/details_widget.dart';
import '../../add_item/item_model.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final profileImage = Provider.of<UserModel>(context).user?.image;
    final items = Provider.of<ItemModel>(context);

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              );
            },
            icon: profileImage == null
                ? const Icon(Icons.account_box)
                : CircleAvatar(
                    radius: 20,
                    backgroundImage: kIsWeb
                        ? NetworkImage(profileImage.path)
                        : FileImage(profileImage) as ImageProvider,
                  ),
          ),
        ],
        centerTitle: true,
        title: Text(" ${items.selectedItem?.title ?? ''}"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (items.selectedItem?.images.isNotEmpty ?? false)
              kIsWeb
                  ? Image.network(items.selectedItem!.images.first as String)
                  : Image.memory(items.selectedItem!.images.first as Uint8List),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                FavoriteWidget(
                  index: items.items.indexOf(items.selectedItem!),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.share),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                items.selectedItem?.body ?? '',
                textAlign: TextAlign.justify,
              ),
            ),
            if (items.selectedItem?.images.isEmpty ?? true)
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  MySeason(url: "assets/HD.jpg", text: "Flower"),
                  MySeason(url: "assets/hh.jpg", text: "Calm"),
                ],
              )
            else
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: items.selectedItem?.images.length ?? 0,
                  itemBuilder: (context, index) => kIsWeb
                      ? Image.network(
                          items.selectedItem!.images[index] as String)
                      : Image.memory(
                          items.selectedItem!.images[index] as Uint8List),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8,
                    crossAxisSpacing: 8,
                  ),
                ),
              ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.next_plan),
      ),
    );
  }
}
