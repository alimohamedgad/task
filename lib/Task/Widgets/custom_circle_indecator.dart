import 'package:flutter/material.dart';
import 'package:task_flutter/Core/app_color.dart';
import 'package:task_flutter/Task/Widgets/custom_text.dart';

const tWO_PI = 3.14 * 2;

class CustomIndecator extends StatelessWidget {
  const CustomIndecator({super.key});

  @override
  Widget build(BuildContext context) {
    double size = 200;
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Center(
          child: TweenAnimationBuilder(
        duration: const Duration(seconds: 1),
        tween: Tween(begin: 0.0, end: 1.0),
        builder: (context, value, child) {
          int precentage = (value * 100).ceil();
          return SizedBox(
            height: size,
            width: size,
            child: Stack(
              children: [
                ShaderMask(
                  shaderCallback: (rect) {
                    return SweepGradient(
                      startAngle: 0.0,
                      endAngle: tWO_PI,
                      stops: [value, value],
                      center: Alignment.center,
                      colors: [
                        AppColor.primaryColor.withOpacity(0.8),
                        Colors.grey.withAlpha(55),
                      ],
                    ).createShader(rect);
                  },
                  child: Container(
                    height: size,
                    width: size,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                        image: DecorationImage(
                          image: Image.asset(
                            'img/scale.jpg',
                            color: Colors.white,
                          ).image,
                        )),
                  ),
                ),
                Center(
                  child: Container(
                    height: size - 40,
                    width: size - 40,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white.withOpacity(0.7),
                    ),
                    child: Center(
                      child: CustomText(
                        text: "$precentage %",
                        color: Colors.black,
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        },
      )),
    );
  }
}
