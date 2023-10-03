import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insights_news/core/app_color.dart';
import 'package:insights_news/core/cahed_data.dart';
import 'package:insights_news/feature/home/home_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

File? imgFile;
String? imgPath;

class UploadUserDataView extends StatefulWidget {
  const UploadUserDataView({super.key});

  @override
  State<UploadUserDataView> createState() => _UploadUserDataViewState();
}

class _UploadUserDataViewState extends State<UploadUserDataView> {
  @override
  void initState() {
    getImage();
  }

  String? username;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.backgroundColor,
        elevation: 0.0,
        actions: [
          TextButton(
            onPressed: () async {
              var prefs = await SharedPreferences.getInstance();

              prefs.setBool('IsUpload', true).then((value) {
                if (imgPath != null && username != null) {
                  prefs.setString(CachedData.NAME, username!);
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomeView(),
                      ));
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Center(
                      child: Text(
                        'Please Upload your image',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    backgroundColor: Colors.red,
                  ));
                }
              });
            },
            child: Text(
              'Done',
              style: TextStyle(color: AppColor.lomanadaColor),
            ),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 150,
                width: 150,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: (imgPath != null)
                            ? FileImage(
                                File(imgPath!),
                              ) as ImageProvider
                            : const AssetImage('assets/user.png'))),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () async {
                  await getImageFromCamera();
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColor.containerColor),
                  child: Text('Upload from Camera',
                      style: TextStyle(color: AppColor.whiteColor)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              GestureDetector(
                onTap: () async {
                  await getImageFromGallery();
                },
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: AppColor.containerColor),
                  child: Text('Upload from Gallery',
                      style: TextStyle(color: AppColor.whiteColor)),
                ),
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
                child: TextFormField(
                  style: TextStyle(color: AppColor.whiteColor),
                  cursorColor: AppColor.lomanadaColor,
                  onChanged: (value) {
                    setState(() {
                      username = value;
                    });
                  },
                  onFieldSubmitted: (value) {
                    setState(() {
                      username = value;
                    });
                  },
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.person,
                        color: AppColor.lomanadaColor,
                      ),
                      filled: true,
                      fillColor: AppColor.containerColor,
                      hintText: 'Enter your username',
                      hintStyle:
                          TextStyle(color: AppColor.whiteColor, fontSize: 14),
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
                          borderSide:
                              BorderSide(color: AppColor.containerColor))),
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
