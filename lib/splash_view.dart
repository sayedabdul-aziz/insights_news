import 'package:flutter/material.dart';
import 'package:insights_news/core/app_color.dart';
import 'package:insights_news/feature/home/views/home_view.dart';
import 'package:insights_news/feature/upload_view.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    super.initState();

    Future.delayed(
      const Duration(seconds: 2),
      () async {
        var prefs = await SharedPreferences.getInstance();
        bool isUpload = prefs.getBool('IsUpload') ?? false;
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  (isUpload) ? const HomeView() : const UploadUserDataView(),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png'),
            const SizedBox(
              height: 40,
            ),
            Text(
              'Insights News',
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w600,
                  color: AppColor.whiteColor),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text(
              'Stay Informed, Anytime, Anywhere.',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey),
            )
            // Text(data)
          ],
        ),
      ),
    );
  }
}
