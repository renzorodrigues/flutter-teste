import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loteria_app/src/home/home_page.dart';
import 'package:loteria_app/src/shared/auth/auth_property.dart';
import 'package:rxdart/rxdart.dart';

class AuthBloc extends BlocBase with AuthProperties {
  BehaviorSubject<String> _controllerButton = BehaviorSubject<String>();

  Stream<String> get buttonOut => _controllerButton.stream;
  Sink<String> get buttonIn => _controllerButton.sink;

  getContext(BuildContext context){
    buildContext = context;
  }

  animationContainer(AnimationController animation, TextEditingController emailtextCtrl) {
    animationController = animation;
    emailTextEditCtrl = emailtextCtrl;

    if (animationController.value > 0 && emailTextEditCtrl.text.length < 3)
      animationController.reverse();
    else
      animationController.forward();

    if (animationController.value > 0 && emailTextEditCtrlOnChange.text.contains("@") && emailTextEditCtrlOnChange.text.contains("."))
      goToHome();
  }

    goToHome(){
    Navigator.pushReplacement(buildContext, 
    MaterialPageRoute(builder: (BuildContext context) => HomePage())
    );
  }

  animationEmailButton(TextEditingController emailTextCtrl) {
    buttonIn.add(_changeEmailButtonAnimation(emailTextCtrl));
  }

  _changeEmailButtonAnimation(TextEditingController emailTextCtrlOnChange) {
    emailTextEditCtrlOnChange = emailTextCtrlOnChange;

    if (emailTextEditCtrlOnChange.text.length >= 3 && emailTextEditCtrlOnChange.text.contains("@") && emailTextEditCtrlOnChange.text.contains(".")) {
      path = "assets/images/enter.png";
      color = Colors.lightGreen;
    } else {
      path = "assets/images/mail.png";
      color = Colors.grey[200];
    }

    if (animationController.value == 0 && emailTextEditCtrlOnChange.text.length >= 3)
      animationController.forward();
  }

  @override
  void dispose() {
    _controllerButton.close();
    super.dispose();
  }
}
