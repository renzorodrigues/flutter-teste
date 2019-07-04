import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loteria_app/src/app_module.dart';
import 'package:loteria_app/src/shared/auth/auth_animation.dart';
import 'package:loteria_app/src/shared/auth/auth_bloc.dart';
import 'package:loteria_app/src/shared/auth/auth_widget.dart';
import 'package:loteria_app/translations.dart';

class AuthView extends StatefulWidget {
  AuthView({Key key}) : super(key: key);

  _AuthViewState createState() => _AuthViewState();
}

class _AuthViewState extends State<AuthView>
    with SingleTickerProviderStateMixin, AuthWidget, AuthAnimation {
  final bloc = AppModule.to.bloc<AuthBloc>();

  TextEditingController _inputMail = TextEditingController();
  TextEditingController _inputPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
    initAnimations(duration: Duration(milliseconds: 500), vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    bloc.getContext(context);
    getAnimations(MediaQuery.of(context).size.width);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
            child: Column(
          children: <Widget>[
            Container(
              child: logoContainer(),
            ),
            AnimatedBuilder(
              animation: controller,
              builder: (BuildContext context, Widget child) {
                return Transform.translate(
                  offset: Offset(0, inputs.value),
                  child: child,
                );
              },
              child: StreamBuilder(
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                return Container(
                  padding: EdgeInsets.only(top: 10, bottom: 5),
                  child: Wrap(
                    runSpacing: 5,
                    children: <Widget>[
                      textFieldEmail(
                          txfController: _inputMail,
                          func: bloc.animationEmailButton,
                          context: context),
                      textFieldPassword(
                          txfController: _inputPassword,
                          func: bloc.animationEmailButton,
                          context: context),
                    ],
                  ),
                );
              }),
            ),
            Container(
              padding: EdgeInsets.only(bottom: 10),
              child: Wrap(
                runSpacing: 5,
                children: <Widget>[
                  StreamBuilder(
                    stream: bloc.buttonOut,
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      return Container(
                          child: loginEmailButton(
                              icon: image(path: bloc.path, height: 30),
                              color: bloc.color,
                              text: Translations.of(context)
                                  .text('str_mailEntry'),
                              animation: controller,
                              input: _inputMail,
                              func: bloc.animationContainer));
                    },
                  ),
                  loginSocialButton(
                    icon: image(path: 'assets/images/facebook.png', height: 30),
                    color: Colors.grey[200],
                    text: Translations.of(context).text('str_facebookEntry'),
                  ),
                  loginSocialButton(
                    icon: image(path: 'assets/images/google.png', height: 30),
                    color: Colors.grey[200],
                    text: Translations.of(context).text('str_googleEntry'),
                  ),
                ],
              ),
            ),
            Container(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: AnimatedBuilder(
                      animation: controller,
                      builder: (BuildContext context, Widget child) {
                        return Transform.translate(
                            offset: Offset(register.value, 0), child: child);
                      },
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(color: Colors.green),
                        margin: EdgeInsets.only(top: 20),
                        padding: EdgeInsets.all(5),
                        child: Text(
                          Translations.of(context).text('str_register'),
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: AnimatedBuilder(
                      animation: controller,
                      builder: (BuildContext context, Widget child) {
                        return Transform.translate(
                          offset: Offset(forgot.value, 0),
                          child: child,
                        );
                      },
                      child: Container(
                        alignment: Alignment.center,
                        margin: EdgeInsets.only(top: 20),
                        padding: EdgeInsets.all(5),
                        child: Text(Translations.of(context)
                            .text('frs_forgotPassword')),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        )),
      ),
    );
  }
}
