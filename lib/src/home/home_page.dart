import 'package:flutter/material.dart';
import 'package:loteria_app/src/shared/auth/auth_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  voltar() {
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => AuthView()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Container(),
      floatingActionButton: FloatingActionButton(
        onPressed: voltar,
        child: Icon(Icons.exit_to_app),
      ),
    );
  }
}
