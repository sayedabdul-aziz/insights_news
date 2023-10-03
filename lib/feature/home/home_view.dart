import 'package:flutter/material.dart';
import 'package:insights_news/core/app_color.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:insights_news/feature/news/news_view.dart';
import 'package:insights_news/feature/notification/notification_view.dart';
import 'package:insights_news/feature/profile/profile_view.dart';
import 'package:insights_news/feature/search/search_screen.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<Widget> screens = [
    const NewsView(),
    const SearchView(),
    const NotificationView(),
    const ProfileView(),
  ];
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[index],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: index,
        onTap: (value) {
          setState(() {
            index = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        backgroundColor: AppColor.backgroundColor,
        unselectedItemColor: Colors.grey,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: AppColor.lomanadaColor,
        elevation: 0.0,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/home.svg'),
            label: '',
            activeIcon: SvgPicture.asset(
              'assets/icons/home.svg',
              width: 20,
              colorFilter:
                  ColorFilter.mode(AppColor.lomanadaColor, BlendMode.srcIn),
            ),
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/search.svg'),
            label: '',
            activeIcon: SvgPicture.asset(
              'assets/icons/search.svg',
              width: 20,
              colorFilter:
                  ColorFilter.mode(AppColor.lomanadaColor, BlendMode.srcIn),
            ),
          ),
          BottomNavigationBarItem(
              icon: SvgPicture.asset(
                'assets/icons/Notification.svg',
              ),
              activeIcon: SvgPicture.asset(
                'assets/icons/Notification.svg',
                width: 20,
                colorFilter:
                    ColorFilter.mode(AppColor.lomanadaColor, BlendMode.srcIn),
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: SvgPicture.asset('assets/icons/Profile.svg'),
              activeIcon: SvgPicture.asset(
                'assets/icons/Profile.svg',
                width: 20,
                colorFilter:
                    ColorFilter.mode(AppColor.lomanadaColor, BlendMode.srcIn),
              ),
              label: ''),
        ],
      ),
    );
  }
}
