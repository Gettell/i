class User {
  final int id;
  final String name;
  final String email;
  final String username;
  final String phone;
  final String website;

  User(this.id, this.name, this.email, this.username, this.phone, this.website);

}

class Todo {
  final int userId;
  final int id;
  final String title;
  final bool completed;

  Todo({
    required this.userId,
    required this.id,
    required this.title,
    required this.completed
  });
}