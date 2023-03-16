import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:task_flutter/Core/app_color.dart';
import 'package:task_flutter/Task/Widgets/custom_text.dart';

import '../../Core/app_string.dart';
import '../Widgets/custom_button.dart';
import '../Widgets/custom_circle_indecator.dart';
import '../Widgets/custom_image.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File? imageFile;

  Future getImageFromGallory() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      final choiseImage = File(image!.path);
      setState(() {
        imageFile = choiseImage;
      });
    } on PlatformException catch (e) {
      print('Failed to pick image $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 90, 0, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomImage(image: 'img/uploadPage_image.png'),
              const SizedBox(height: 20),
              const CustomText(
                text: AppString.homePageTitle,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const CustomText(
                text: AppString.homeSubTitle,
                textAlign: TextAlign.center,
                fontSize: 15,
                color: Colors.grey,
              ),
              CustomButton(
                onPrees: () async {
                  await getImageFromGallory();
                  showDialog(
                    context: context,
                    builder: (context) => const CustomIndecator(),
                  );
                  Future.delayed(const Duration(seconds: 2)).then(
                    (value) {
                      Navigator.pop(context);
                      showDialog(
                        context: context,
                        builder: (context) => Dialog(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Container(
                            height: 290,
                            width: 181,
                            margin: const EdgeInsets.only(top: 40),
                            padding: const EdgeInsets.only(
                                left: 20, bottom: 15, right: 15),
                            child: Column(
                              children: [
                                imageFile != null
                                    ? Image.file(
                                        imageFile!,
                                        width: double.infinity,
                                        height: 120,
                                      )
                                    : const FlutterLogo(),
                                const SizedBox(height: 9),
                                const CustomText(text: 'The Result is:'),
                                const SizedBox(height: 7),
                                const CustomText(
                                  text: 'Bengin',
                                  fontSize: 40,
                                  color: AppColor.green,
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(0, 18, 0, 0),
                                  child: Align(
                                    alignment: Alignment.bottomRight,
                                    child: TextButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      child: const CustomText(
                                        text: 'Cancel',
                                        color: AppColor.primaryColor,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
