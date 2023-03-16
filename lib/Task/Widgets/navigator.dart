import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

void customNavReplace(Widget newRoute, context) {
  Navigator.pushAndRemoveUntil(
    context,
    PageTransition(
      child: newRoute,
      type: PageTransitionType.fade,
      duration: const Duration(milliseconds: 600),
      reverseDuration: const Duration(milliseconds: 600),
    ),
    (route) => false,
  );
}
