import 'package:flutter/material.dart';

mixin AuthProperties {
  
  String path = "assets/images/mail.png";
  Color color = Colors.grey[200];
  AnimationController animationController;
  TextEditingController emailTextEditCtrl;
  TextEditingController emailTextEditCtrlOnChange;
  BuildContext buildContext;

}