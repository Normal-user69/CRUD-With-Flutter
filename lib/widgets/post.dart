import 'package:facebook_clone/core/constants/icons.dart';
import 'package:flutter/material.dart';

class Post extends StatelessWidget {
  final int id;
  final String title;
  final String body;
  final int likes;
  final int comments;
  final int views;
  final List tags;

  const Post(
      {super.key,
      required this.id,
      required this.title,
      required this.body,
      required this.likes,
      required this.comments,
      required this.views,
      required this.tags});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id:json['id'] ??'',
      title: json['title'] ?? '',
      body: json['body'] ?? '',
      likes: json['reactions']['likes'] ?? 0,
      comments:
          json['reactions']['dislikes'] ?? 0, // Assuming comments mean dislikes
      views: json['views'] ?? 0,
      tags:
          List<String>.from(json['tags'] ?? []), // Convert tags to List<String>
    );
  }

  List<Widget> get postTags {
    return List.generate(tags.length, (index) {
      return Text(
        "#${tags[index]}",
        style: const TextStyle(fontSize: 20, color: Colors.blue),
      );
    });
  }

  Widget get getPost {
    return Container(
      margin: const EdgeInsets.all(32),
      decoration: const BoxDecoration(
        color: Colors.black12,
      ),
      child: Wrap(
        alignment: WrapAlignment.center,
        children: <Widget>[
          Text(
            title,
            style: const TextStyle(fontSize: 40),
          ),
          const Divider(thickness: 3),
          Text(
            body,
            style: const TextStyle(fontSize: 30),
          ),
          const Divider(thickness: 3),
          Row(
            children: postTags,
          ),
          const Divider(thickness: 3),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Row(
                children: [
                  AppIcons.like,
                  Text("$likes"),
                ],
              ),
              Row(
                children: [
                  AppIcons.comments,
                  Text("$comments"),
                ],
              ),
              Row(
                children: [
                  AppIcons.views,
                  Text("$views"),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return getPost;
  }
}
