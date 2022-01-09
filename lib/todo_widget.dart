import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:i/navdrawer.dart';
import 'json_data.dart';
import 'package:http/http.dart' as http;

class TodoWidget extends StatefulWidget {



  const TodoWidget({Key? key,}) : super(key: key);


  @override
  _TodoWidgetState createState() => _TodoWidgetState();
}

class _TodoWidgetState extends State<TodoWidget> {

  List <Todo> todosList = [];
  Future <List<Todo>> getTodos () async {
    final response = await http.get(Uri.parse("https://jsonplaceholder.typicode.com/todos"));
    var data =jsonDecode(response.body.toString());
    if (response.statusCode == 200) {
      for (Map i in data) {
        Todo todos = Todo (userId: i["userId"], id: i["id"], title: i ["title"], completed: i ["completed"]);
        todosList.add(todos);
      }
      return todosList;
    } else {
      throw Exception('Failed to load todos');
    }
  }


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold (
        drawer: navDrawer(context),
          appBar: AppBar(
            backgroundColor: Color(0xFF03203e),
            centerTitle: true,
            title: const Text('Задачи'),
          ),
          body: Column(
            children: [
              Expanded(
                child: FutureBuilder(
                  future: getTodos(),
                  builder: ( context, AsyncSnapshot<List<Todo>> snapshot) {
                    if (snapshot.hasData){
                      List<Todo> photosList = snapshot.data!;
                      return ListView.builder(
                          itemCount: photosList.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              leading: Text (snapshot.data![index].completed.toString()),
                              title: Text (snapshot.data![index].title.toString()),
                              subtitle: Text ('Notes id:'+ snapshot.data![index].title),
                            );
                          });
                    }
                    return Center(child: CircularProgressIndicator());
                  },),
              ),
            ],
          )
      ),
    );
  }
}