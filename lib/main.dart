import 'package:flutter/material.dart';
import 'about_app.dart';
import 'login_page.dart';
import 'main_screen.dart';
import 'navdrawer.dart';

void main() {
  runApp(const MyFinalProject());
}

class MyFinalProject extends StatelessWidget {
  const MyFinalProject({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My final project',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF03203e)),
      ),
      routes: {
        '/login_page': (context) => LoginPage(),
        '/main_screen':(context) => MainScreen(),
        // '/user_details_screen': (context)=> UserDetailsScreen(),
        '/about_app': (context)=> AboutApp(),
      },
      initialRoute: '/login_page',
    );
  }
}

// void main() => runApp(const MainScreen());

// class MainScreen extends StatelessWidget {
//   const MainScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         appBarTheme: const AppBarTheme(backgroundColor: Color(0xFF03203e)),
//       ),
//       home: AllUsersPage(),
//     );
//   }
// }
//
// class AllUsersPage extends StatefulWidget {
//   const AllUsersPage({Key? key}) : super(key: key);
//
//   @override
//   _AllUsersPageState createState() => _AllUsersPageState();
// }
//
// class _AllUsersPageState extends State<AllUsersPage> {
//   Future<List<User>> _getUsers() async {
//     var data =
//     await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
//
//     var jsonData = json.decode(data.body);
//
//     List<User> users = [];
//
//     for (var u in jsonData) {
//       User user = User( u ['id'], u['name'], u['email'], u['username'], u ['phone'], u ['website']);
//       users.add(user);
//     }
//     return users;
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       drawer: navDrawer(context),
//       appBar: AppBar(
//         title: Text(' All Users'),
//       ),
//       body: Container(
//         child: FutureBuilder(
//           future: _getUsers(),
//           builder: (BuildContext context, AsyncSnapshot snapshot) {
//             if (snapshot.data == null) {
//               return Container(
//                 child: Center(
//                   child: Text('Loading'),
//                 ),
//               );
//             } else {
//               return ListView.builder(
//                 itemCount: snapshot.data.length,
//                 itemBuilder: (BuildContext context, int index) {
//                   return ListTile(
//                     leading: Text(snapshot.data[index].id.toString()),
//                     title: Text(snapshot.data[index].name),
//                     subtitle: Text(snapshot.data[index].email),
//                     onTap: () {
//                       Navigator.push(context, MaterialPageRoute(
//                           builder: (context)=> DetailPage(user: snapshot.data[index]))
//                       );
//                     },
//                   );
//                 },
//               );
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
//
// class DetailPage extends StatelessWidget {
//   const DetailPage({Key? key, required this.user}) : super(key: key);
//
//   final User user;
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text (user.name),
//         ),
//         body: Center(
//           child: Container(
//             child: Column(
//               children: [
//                 Text (' Фамилия: ${user.username}'),
//                 SizedBox(height: 10,),
//                 Text (' Телефон: ${user.phone}'),
//                 SizedBox(height: 10,),
//                 Text (' Сайт: ${user.website}'),
//
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
//
// class User {
//   final int id;
//   final String name;
//   final String email;
//   final String username;
//   final String phone;
//   final String website;
//
//   User(this.id, this.name, this.email, this.username, this.phone, this.website);
//
// }
//
