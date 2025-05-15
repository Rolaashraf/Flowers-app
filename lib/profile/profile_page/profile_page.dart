<<<<<<< HEAD
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:tree/profile/user_model.dart';
import '../profile_widget/options.dart';
=======
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:myapp/profile/profile_wodget/options.dart';
import 'package:myapp/profile/user_model.dart';
import 'package:provider/provider.dart';
>>>>>>> ab7297007726b123278549910bd453a47f0598a5

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
<<<<<<< HEAD
      appBar: AppBar(
        title: const Text("Profile"),
      ),
      body: Consumer<UserModel>(
        builder: (context, userModel, child) {
          final user = userModel.user;

          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(height: 30),
                Center(
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 100,
                        backgroundColor: Colors.grey.shade400,
                        backgroundImage: user?.image != null
                            ? (kIsWeb
                                ? NetworkImage(user!.image!.path)
                                    as ImageProvider
                                : FileImage(user!.image!))
                            : null,
                        child: user?.image == null
                            ? const Icon(Icons.person,
                                size: 100, color: Colors.white)
                            : null,
                      ),
                      CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 25,
                        child: IconButton(
                          icon: const Icon(Icons.camera_alt,
                              size: 20, color: Colors.white),
                          onPressed: () {
                            showModalBottomSheet(
                              context: context,
                              builder: (context) => SizedBox(
                                height: 150,
                                child: Column(
                                  children: [
                                    const SizedBox(height: 10),
                                    const Text("Update Profile Picture",
                                        style: TextStyle(fontSize: 18)),
                                    const Divider(),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Options(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            userModel.imageSelector(
                                                ImageSource.camera);
                                          },
                                          title: "Camera",
                                          icon: Icons.camera_alt,
                                        ),
                                        Options(
                                          onPressed: () {
                                            Navigator.pop(context);
                                            userModel.imageSelector(
                                                ImageSource.gallery);
                                          },
                                          title: "Gallery",
                                          icon: Icons.image,
                                        ),
                                        if (user?.image != null)
                                          Options(
                                            onPressed: () {
                                              userModel.removeImage();
                                              Navigator.pop(context);
                                            },
                                            title: "Delete",
                                            icon: Icons.delete,
                                            selectedImage: user?.image,
                                          ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                ListTile(
                  leading: const Icon(Icons.person),
                  title: const Text("Name",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(user?.name ?? "No name set"),
                ),
                ListTile(
                  leading: const Icon(Icons.info_outline),
                  title: const Text("Bio",
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  subtitle: Text(user?.bio ?? "No bio set"),
                ),
              ],
            ),
          );
        },
=======
      appBar: AppBar(title: const Text("Profile")),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Center(
            child: Consumer<userModel>(
              builder: (context, userModel, child) {
                return Column(
                  children: [
                    Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        CircleAvatar(
                          backgroundColor: Colors.grey,
                          radius: 100,
                          child: userModel.user?.image == null
                              ? const Icon(Icons.person, size: 100, color: Colors.white)
                              : ClipOval(
                                  child: Image.memory(
                                    userModel.user!.image!,
                                    width: 200,
                                    height: 200,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                        ),
                        CircleAvatar(
                          backgroundColor: Colors.black,
                          radius: 25,
                          child: IconButton(
                            onPressed: () {
                              showModalBottomSheet(
                                context: context,
                                isScrollControlled: true,
                                builder: (context) => SingleChildScrollView(
                                  padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context).viewInsets.bottom,
                                    top: 20,
                                    left: 20,
                                    right: 20,
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Text(
                                        "Profile",
                                        style: TextStyle(fontSize: 20),
                                      ),
                                      const Divider(),
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                        children: [
                                          Options(
                                            title: "Camera",
                                            icon: Icons.camera_alt,
                                            color: Colors.grey,
                                            onPressesd: () {
                                              userModel.imageSelector(ImageSource.camera);
                                              Navigator.pop(context);
                                            },
                                          ),
                                          Options(
                                            title: "Gallery",
                                            icon: Icons.image,
                                            color: Colors.grey,
                                            onPressesd: () {
                                              userModel.imageSelector(ImageSource.gallery);
                                              Navigator.pop(context);
                                            },
                                          ),
                                          Options(
                                            title: "Delete",
                                            icon: Icons.delete,
                                            color: Colors.red,
                                            onPressesd: () {
                                              userModel.removeImage();
                                              Navigator.pop(context);
                                            },
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            icon: const Icon(Icons.camera_alt, size: 25),
                          ),
                        ),
                      ],
                    ),

                    
                    const SizedBox(height: 24),
                    ListTile(
                      leading: const Icon(Icons.person),
                      title: const Text("Name"),
                      subtitle: Text(userModel.user?.name ?? "Rola Ashraf"),
                    ),
                    ListTile(
                      leading: const Icon(Icons.info),
                      title: const Text("Bio"),
                      subtitle: Text(userModel.user?.bio ?? " Code, Sleep, Eat, Repeat"),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
>>>>>>> ab7297007726b123278549910bd453a47f0598a5
      ),
    );
  }
}
