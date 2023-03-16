// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:task_flutter/Core/app_color.dart';
import 'package:task_flutter/Task/Widgets/custom_text.dart';

import '../Widgets/custom_image.dart';
import '../Widgets/navigator.dart';
import 'home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 2)).then((value) {
      customNavReplace(const HomePage(), context);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.primaryColor,
      body: SafeArea(
        child: Stack(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                CustomImage(image: 'img/Splash1.png'),
                CustomImage(image: 'img/Splash2.png'),
              ],
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  CustomImage(image: 'img/Splash3.png'),
                  CustomText(
                    text: 'Al-BASED CACD',
                    fontSize: 24,
                    color: AppColor.white,
                  ),
                  CustomText(
                    text: 'Breast Cancer Detiction',
                    fontSize: 14,
                    color: AppColor.white,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
