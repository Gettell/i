import 'package:flutter/material.dart';
import 'about_app.dart';

Widget navDrawer (context)=> Drawer(
  child: ListView(
    children: [
      DrawerHeader(
        decoration: BoxDecoration(color: Color(0xFF03203e)),
        child: Container(
          height: 200,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 100.00,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.0)),
                child: Image(image: AssetImage('images/ninja.png'),
                ),
              ),
              const Text('Навигация', style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold ,color: Color(0xFFFDFBFE)),),
            ],
          ),
        ),),
      ListTile(
        leading: Icon(Icons.import_contacts),
        title: Text ('О приложении'),
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AboutApp ()),
          );
        },
      ),
    ],
  ),
);