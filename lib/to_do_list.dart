import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:i/navdrawer.dart';
import 'json_data.dart';
import 'package:http/http.dart' as http;

class TodoList extends StatefulWidget {



  const TodoList({Key? key,}) : super(key: key);


  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {

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
                      List<Todo> todosList = snapshot.data!;
                      return ListView.builder(
                          itemCount: 13,
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                onTap: () {},
                                title: Text (snapshot.data![index].title.toString()),
                                trailing: Checkbox(
                                  checkColor: Color(0xFF03203e),
                                  activeColor: Colors.red,
                                  value: snapshot.data![index].completed, onChanged: null,),
                              ),
                            );
                          });
                    }
                    return Center(child: CircularProgressIndicator());
                  },),
              ),
              FloatingActionButton(
                  backgroundColor: Color(0xFF03203e),
                  child: Icon(Icons.arrow_back_rounded),
                  onPressed: () {Navigator.pop(context);})
            ],
          )
      ),
    );
  }
}