import 'package:flutter/material.dart';
import 'package:tree/add_item/item_model.dart';
import 'package:provider/provider.dart';
import '../add_item/add_item_screen.dart';
import '../details/details_widget/favorite.dart';
import '../favorite/favorite_model.dart';
import '../favorite/favorite_screen.dart'; // Add this if not already
import '../profile/profile_page/profile_page.dart';
import '../profile/user_model.dart';
import 'package:flutter/foundation.dart' show Uint8List, kIsWeb;
import '../details/details_screen/details_page.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final profileImage = Provider.of<UserModel>(context).user?.image;
    final items = Provider.of<ItemModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Dashboard"),
        actions: [
          Consumer<FavoriteModel>(
            builder: (context, favModel, _) => Stack(
              alignment: Alignment.topRight,
              children: [
                IconButton(
                  icon: const Icon(Icons.favorite),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FavoriteScreen()),
                    );
                  },
                ),
                if (favModel.fav.isNotEmpty)
                  Positioned(
                    right: 6,
                    top: 6,
                    child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration: const BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                      child: Text(
                        '${favModel.fav.length}',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
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
      ),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
        ),
        itemCount: items.items.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              items.selectItem(items.items[index]);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const DetailsPage()),
              );
            },
            child: SizedBox(
              child: Column(
                children: [
                  kIsWeb
                      ? Image.network(
                          items.items[index].images.first as String,
                          height: 125,
                          width: 200,
                          fit: BoxFit.cover,
                        )
                      : Image.memory(
                          items.items[index].images.first as Uint8List,
                          height: 125,
                          width: 200,
                          fit: BoxFit.cover,
                        ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(items.items[index].title),
                      FavoriteWidget(
                        index: items.items.indexOf(items.items[index]),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const AddItemScreen()),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
