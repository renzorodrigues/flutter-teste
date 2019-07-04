import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:loteria_app/translations.dart';

mixin AuthWidget {
  logoContainer() {
    return Container(
        padding: EdgeInsets.only(top: 30, bottom: 10),
        child: image(path: 'assets/images/falcon.png', height: 150));
  }

  image({String path, double height}) {
    var assets = AssetImage(path);
    var image = Image(image: assets, height: height);
    return image;
  }

  textFieldEmail({TextEditingController txfController, Function func, BuildContext context}){
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30),
      child: Theme(
        data: ThemeData(
          primaryColor: Colors.lightGreen,
        ),
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            prefixIcon: Icon(Icons.email),
            contentPadding: const EdgeInsets.only(left: 20, top: 20),
            hintStyle: const TextStyle(fontStyle: FontStyle.italic),
            hintText: Translations.of(context).text('frs_typeMail'),
            labelText: Translations.of(context).text('str_mail').toUpperCase(),
          ),
          controller: txfController,
          onChanged: (value) => func(txfController)
        ),
      ),
    );
  }

  textFieldPassword({TextEditingController txfController, Function func, BuildContext context}){
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30),
      child: Theme(
        data: ThemeData(
          primaryColor: Colors.lightGreen,
        ),
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            prefixIcon: Icon(Icons.lock),
            contentPadding: const EdgeInsets.only(left: 20, top: 20),
            hintStyle: const TextStyle(fontStyle: FontStyle.italic),
            hintText: Translations.of(context).text('frs_typePassword'),
            labelText: Translations.of(context).text('str_password').toUpperCase(),
          ),
          controller: txfController,
          onChanged: (value) => func(txfController),
          obscureText: true,
        ),
      ),
    );
  }

  loginEmailButton({dynamic icon, Color color, String text, AnimationController animation, Function func, TextEditingController input}) {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30),
      child: ButtonTheme(
        buttonColor: color,
        minWidth: 320.0,
        height: 50.0,
        child: RaisedButton(
          child: Row(
            children: <Widget>[
              Container(width: 50, child: Container(child: icon)),
              Container(child: Container(child: Text(text)))
            ],
          ),
          onPressed: () {
            func(animation, input);
          },
        ),
      ),
    );
  }

  loginSocialButton({dynamic icon, Color color, String text}) {
    return Container(
      margin: const EdgeInsets.only(left: 30, right: 30),
      child: ButtonTheme(
        buttonColor: color,
        minWidth: 320.0,
        height: 50.0,
        child: RaisedButton(
          child: Row(
            children: <Widget>[
              Container(width: 50, child: Container(child: icon)),
              Container(child: Container(child: Text(text)))
            ],
          ),
          onPressed: () {},
        ),
      ),
    );
  }
}
