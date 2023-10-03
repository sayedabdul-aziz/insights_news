import 'dart:io';

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:insights_news/core/api_services.dart';
import 'package:insights_news/core/app_color.dart';
import 'package:insights_news/core/cahed_data.dart';
import 'package:insights_news/feature/home/views/science_view.dart';

class NewsView extends StatefulWidget {
  const NewsView({super.key});

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  int selectedIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: DefaultTabController(
        length: 4,
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              //Custom AppBar
              Row(children: [
                Column(
                  children: [
                    FutureBuilder(
                      future: CachedData().getName(),
                      builder: (context, snapshot) => Text(
                        'Hello, ${snapshot.data}',
                        style: TextStyle(
                            color: AppColor.whiteColor,
                            fontSize: 17,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Have a nice day',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                FutureBuilder(
                  future: CachedData().getImage(),
                  builder: (context, snapshot) => CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColor.whiteColor,
                    child: CircleAvatar(
                        radius: 18,
                        backgroundImage: (snapshot.data != null)
                            ? FileImage(
                                File(snapshot.data.toString()),
                              ) as ImageProvider
                            : const AssetImage('assets/user.png')),
                  ),
                ),
              ]),
              const SizedBox(
                height: 20,
              ),
              CarouselSlider(
                  items: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          'assets/rodri.png',
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          'assets/rodri.png',
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          'assets/rodri.png',
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.asset(
                          'assets/rodri.png',
                          height: 100,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                  options: CarouselOptions(
                    height: 200,
                    viewportFraction: 1,
                    initialPage: 0,
                    // enlargeFactor: 0.5,
                    enlargeCenterPage: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: const Duration(seconds: 3),
                    autoPlayAnimationDuration:
                        const Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    scrollDirection: Axis.horizontal,
                  )),

              const SizedBox(height: 10),
              ButtonsTabBar(
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 14,
                ),
                backgroundColor: AppColor.lomanadaColor,
                unselectedBackgroundColor: AppColor.containerColor,
                unselectedLabelStyle: const TextStyle(color: Colors.white),
                labelStyle: TextStyle(
                    color: AppColor.containerColor,
                    fontWeight: FontWeight.bold),
                tabs: const [
                  Tab(
                    text: "Science",
                  ),
                  Tab(
                    text: "Sports",
                  ),
                  Tab(
                    text: "Business",
                  ),
                  Tab(
                    text: "Entertainment",
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),

              const Expanded(
                child: TabBarView(
                  children: [
                    ScienceListView(category: 'Science'),
                    ScienceListView(category: 'Sports'),
                    ScienceListView(category: 'Business'),
                    ScienceListView(category: 'Entertainment'),
                  ],
                ),
              ),
            ],
          ),
        ),
      )),
    );
  }
}

// SizedBox(
//   height: 50,
//   child: ListView.builder(
//     physics: const BouncingScrollPhysics(),
//     itemCount: categories.length,
//     scrollDirection: Axis.horizontal,
//     itemBuilder: (context, index) => GestureDetector(
//       onTap: () {
//         setState(() {
//           selectedIndex = index;
//         });
//       },
//       child: Container(
//         margin: const EdgeInsets.all(5),
//         alignment: Alignment.center,
//         padding:
//             const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//         decoration: BoxDecoration(
//             color: selectedIndex == index
//                 ? AppColor.lomanadaColor
//                 : AppColor.containerColor,
//             borderRadius: BorderRadiusDirectional.circular(7)),
//         child: Text(
//           categories[index],
//           style: TextStyle(
//             color: selectedIndex == index
//                 ? AppColor.containerColor
//                 : AppColor.whiteColor,
//           ),
//         ),
//       ),
//     ),
//   ),
// ),

// Expanded(
//   child: ListView.builder(
//     physics: const BouncingScrollPhysics(),
//     itemCount: 20,
//     scrollDirection: Axis.vertical,
//     itemBuilder: (context, index) => Container(
//       margin: const EdgeInsets.all(5),
//       alignment: Alignment.center,
//       padding:
//           const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
//       decoration: BoxDecoration(
//           color: AppColor.containerColor,
//           borderRadius: BorderRadiusDirectional.circular(7)),
//       child: Text(
//         'Sayed Abdul-Aziz',
//         style: TextStyle(color: AppColor.whiteColor),
//       ),
//     ),
//   ),
// )
