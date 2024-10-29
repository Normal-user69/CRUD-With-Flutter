import 'package:facebook_clone/widgets/post.dart';

class User {
  int id;
  String name;
  String pass; 
  List<Post> posts = []; 

  User({required this.id , required this.name , required this.pass});

}