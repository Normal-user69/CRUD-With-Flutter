import 'package:facebook_clone/core/routes/route_names.dart';
import 'package:facebook_clone/pages/add_post.dart';
import 'package:facebook_clone/pages/delete_post.dart';
import 'package:facebook_clone/pages/get_all.dart';
import 'package:facebook_clone/pages/get_post.dart';
import 'package:facebook_clone/pages/home.dart';
import 'package:facebook_clone/pages/login.dart';
import 'package:facebook_clone/pages/update_post.dart';
import 'package:flutter/material.dart';

class AppRoute {
  static Route<dynamic> generate(RouteSettings? settings) {
    switch (settings?.name) {
      case RouteNames.splash:
        return MaterialPageRoute(builder: (_) {
          return const Test();
        });
        case RouteNames.login:
        return MaterialPageRoute(builder: (_) {
          return const LoginPage();
        });
      case RouteNames.home:
        return MaterialPageRoute(builder: (_) {
          return const Home();
        });
      case RouteNames.getAllPosts:
        return MaterialPageRoute(builder: (_) {
          return const GetAll();
        });
      case RouteNames.getPost:
        return MaterialPageRoute(builder: (_) {
          return const GetPost();
        });
      case RouteNames.addPost:
        return MaterialPageRoute(builder: (_) {
          return const AddPost();
        });
      case RouteNames.deletePost:
        return MaterialPageRoute(builder: (_) {
          return const DeletePost();
        });
      case RouteNames.updatePost:
        return MaterialPageRoute(builder: (_) {
          return const UpdatePost();
        });
      default:
        return MaterialPageRoute(builder: (_) {
          return const Test();
        });
    }
  }
}

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("default"),
      ),
    );
  }
}
