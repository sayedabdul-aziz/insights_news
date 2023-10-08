import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insights_news/core/app_color.dart';
import 'package:insights_news/core/cahed_data.dart';
import 'package:insights_news/feature/home/views/home_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

File? imgFile;
String? imgPath;

class ProfileView extends StatefulWidget {
  const ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  void initState() {
    getImage();
  }

  String? username;
  bool isVisable = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Stack(
                children: [
                  FutureBuilder(
                    future: CachedData().getImage(),
                    builder: (context, snapshot) => CircleAvatar(
                      radius: 52,
                      backgroundColor: AppColor.whiteColor,
                      child: CircleAvatar(
                          radius: 50,
                          backgroundImage: (snapshot.data != null)
                              ? FileImage(
                                  File(snapshot.data.toString()),
                                ) as ImageProvider
                              : const AssetImage('assets/user.png')),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: InkWell(
                      onTap: () async {
                        await getImageFromGallery();
                      },
                      child: const CircleAvatar(
                          radius: 12,
                          backgroundColor: Colors.indigo,
                          child: Icon(
                            Icons.camera_alt,
                            color: Colors.white,
                            size: 18,
                          )),
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: Divider(
                  color: AppColor.lomanadaColor,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: (isVisable)
                    ? GestureDetector(
                        onTap: () {
                          setState(() {
                            isVisable = false;
                          });
                        },
                        child: FutureBuilder(
                            future: CachedData().getName(),
                            builder: (c, snapshot) {
                              return Container(
                                  width: double.infinity,
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      color: AppColor.containerColor),
                                  child: Text(
                                    snapshot.data.toString(),
                                    style: TextStyle(
                                        color: AppColor.lomanadaColor,
                                        fontSize: 18),
                                  ));
                            }),
                      )
                    : TextFormField(
                        style: TextStyle(color: AppColor.whiteColor),
                        cursorColor: AppColor.lomanadaColor,
                        onChanged: (value) {
                          setState(() {
                            username = value;
                          });
                        },
                        onFieldSubmitted: (value) {
                          setName(value);
                          setState(() {
                            username = value;
                            isVisable = true;
                          });
                        },
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.person,
                              color: AppColor.lomanadaColor,
                            ),
                            filled: true,
                            fillColor: AppColor.containerColor,
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: AppColor.containerColor)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide:
                                    BorderSide(color: AppColor.containerColor)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                    color: AppColor.containerColor))),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future getImageFromGallery() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setImage(pickedFile.path.toString());
      setState(() {
        imgFile = File(pickedFile.path);
      });
    }
  }

  Future getImageFromCamera() async {
    final pickedFile =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setImage(pickedFile.path.toString());
      setState(() {
        imgFile = File(pickedFile.path);
      });
    }
  }

  Future<void> setImage(String path) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('IMAGE', path);
    getImage();
  }

  getImage() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      imgPath = prefs.getString('IMAGE');
    });
  }

  Future<void> setName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('NAME', name);
    getImage();
  }

  getName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      imgPath = prefs.getString('NAME');
    });
  }
}
