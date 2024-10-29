import 'package:facebook_clone/core/manger/post_manger.dart';
import 'package:facebook_clone/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class GetPost extends StatefulWidget {
  const GetPost({super.key});

  @override
  State<GetPost> createState() => _GetPostState();
}

class _GetPostState extends State<GetPost> {
  late Widget post;
  late int postid;
  @override
  void initState() {
    super.initState();
    postid = -1;
    post = Container();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.only(top: 32),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                searchBar(),
                SizedBox(
                  width: 500,
                  child: SingleChildScrollView(child: post),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget searchBar() {
    return Container(
      color: Colors.grey,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: (value) {
                try {
                  setState(() {
                    postid = int.parse(value);
                  });
                } catch (e) {
                  postid = -1;
                }
              },
              decoration: const InputDecoration(
                hintText: "Enter The Post Id",
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                post = PostManger().getWidgetPost(postid);
              });
            },
            child: const Text("Search"),
          ),
        ],
      ),
    );
  }
}
