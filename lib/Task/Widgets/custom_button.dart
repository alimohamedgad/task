// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:task_flutter/Core/app_color.dart';
import 'package:task_flutter/Task/Widgets/custom_text.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.onPrees,
  }) : super(key: key);
  final VoidCallback onPrees;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPrees,
      child: Container(
        width: 232,
        height: 44,
        margin: const EdgeInsets.only(top: 100),
        decoration: BoxDecoration(
          color: AppColor.primaryColor,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.cloud_upload_rounded,
              color: Colors.white,
            ),
            SizedBox(width: 6),
            CustomText(
              text: 'Upload',
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}
