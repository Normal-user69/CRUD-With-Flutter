import 'package:facebook_clone/core/manger/post_manger.dart';
import 'package:facebook_clone/core/routes/route_names.dart';
import 'package:facebook_clone/widgets/app_bar.dart';
import 'package:facebook_clone/widgets/post.dart';
import 'package:flutter/material.dart';

class DeletePost extends StatefulWidget {
  const DeletePost({super.key});

  @override
  State<DeletePost> createState() => _DeletePostState();
}

class _DeletePostState extends State<DeletePost> {
  int postid = -1;
  late Post post;

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
                if (postid > -1)
                  FutureBuilder<Post>(
                    future: PostManger().getPost(postid),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (snapshot.hasData) {
                        post = snapshot.data!;
                        return Column(
                          children: [
                            SingleChildScrollView(
                                child: post
                                    .getPost), // Adjust this based on your actual post display widget
                            Row(
                              children: [
                                const Text("Delete this post? "),
                                ElevatedButton(
                                  onPressed: () {
                                    PostManger().deletePost(post);
                                  },
                                  child: const Text("Yes!"),
                                ),
                              ],
                            ),
                          ],
                        );
                      } else {
                        return const Text("No post found.");
                      }
                    },
                  ),
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
                setState(() {
                  try {
                    postid = int.parse(value);
                  } catch (e) {
                    postid = -1;
                  }
                });
              },
              decoration: const InputDecoration(
                hintText: "Enter The Post Id",
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              if (postid > -1) {
                setState((){
                  PostManger().deletePost(post);
                  Navigator.pushReplacementNamed(context, RouteNames.getAllPosts);
                });
              }
            },
            child: const Text("Delete"),
          ),
        ],
      ),
    );
  }
}
