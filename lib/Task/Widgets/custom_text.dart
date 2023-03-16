// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({
    Key? key,
    required this.text,
    this.color = Colors.black,
    this.fontSize = 20,
    this.textAlign,
    this.onTap,
  }) : super(key: key);

  final String text;
  final Color color;
  final double fontSize;
  final TextAlign? textAlign;

  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        text,
        textAlign: textAlign,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: color,
          fontSize: fontSize,
        ),
      ),
    );
  }
}
