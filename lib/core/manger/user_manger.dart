import 'package:facebook_clone/widgets/user.dart';

class UserManger {
  static int currentId = 0;
  static List<User> users = [
    User(id: 0, name: "hassan", pass: "123"),
  ];  
  
  void addUser(User user){
    users.add(user);
    ++currentId;
  }

  User getUser(int id){
    return users.firstWhere((user) => user.id == id);
  }
}

