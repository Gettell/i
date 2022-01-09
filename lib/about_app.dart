import 'package:flutter/material.dart';
import 'package:i/strings.dart';

class AboutApp extends StatelessWidget {
  const AboutApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('О приложении'),
      ),
      body: Container(
        padding: EdgeInsets.all(16),
        child: Center(child: Text(Strings.aboutApp)),
      ),
    );
  }
}