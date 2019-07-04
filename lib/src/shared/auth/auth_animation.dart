import 'package:flutter/animation.dart';

mixin AuthAnimation {
  AnimationController controller;
  Animation<double> inputs;
  Animation<double> buttons;
  Animation<double> register;
  Animation<double> forgot;

  initAnimations({duration, vsync}) {
    controller = AnimationController(duration: duration, vsync: vsync);
  }

  getAnimations(double screenSize) {
    inputs = Tween<double>(begin: -screenSize, end: 0).animate(
        CurvedAnimation(parent: controller, curve: Curves.easeInOutBack));
    buttons = Tween<double>(begin: -50, end: 0).animate(
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn));
    register = Tween<double>(begin: -screenSize, end: 0).animate(
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn));
    forgot = Tween<double>(begin: screenSize, end: 0).animate(
        CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn));
  }
}
