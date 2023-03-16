import 'package:flutter/material.dart';

class CustomImage extends StatelessWidget {
  final String image;
  const CustomImage({
    Key? key,
    required this.image,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      image,
      // width: double.infinity,
      // height: 120,
    );
  }
}

// class CustomImageFile extends StatelessWidget {
//   final File? image;
//   const CustomImageFile({
//     Key? key,
//     required this.image,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Image.file(image != null ? );
//   }
// }
