import 'package:flutter/material.dart';
import 'package:i/navdrawer.dart';
import 'package:i/to_do_list.dart';
import 'package:i/todo_widget.dart';
import 'json_data.dart';
import 'main.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'main_screen.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({Key? key, required this.user}) : super(key: key);

  final User user;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF03203e))),
      home: Scaffold(
        drawer: navDrawer(context),
        appBar: AppBar(
          centerTitle: true,
          title: Text (user.name),
        ),
        body: Center(
          child: Container(
            child: Column(
              children: [
                const SizedBox(height: 20,),
                Text (' Фамилия: ${user.username}', style: TextStyle(fontSize: 18),),
                const SizedBox(height: 10,),
                Text (' Телефон: ${user.phone}'),
                const SizedBox(height: 10,),
                Text (' Сайт: ${user.website}'),
                const SizedBox(height: 30,),
                ElevatedButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Color(0xFFFDFBFE)),
                      backgroundColor: MaterialStateProperty.all(Color(0xFF03203e)),
                    ),
                    onPressed: () {
                  Navigator.pop(context);
                }, child: const Text ('Назад к списку')),
                ElevatedButton(
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Color(0xFFFDFBFE)),
                      backgroundColor: MaterialStateProperty.all(Color(0xFF03203e)),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => TodoList()),
                      );
                    }, child: Text ('Перейти к задачам'))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

