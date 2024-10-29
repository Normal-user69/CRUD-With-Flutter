import 'package:facebook_clone/core/manger/post_manger.dart';
import 'package:facebook_clone/core/manger/user_manger.dart';
import 'package:facebook_clone/core/routes/route_names.dart';
import 'package:facebook_clone/widgets/app_bar.dart';
import 'package:facebook_clone/widgets/post.dart';
import 'package:flutter/material.dart';

class AddPost extends StatelessWidget {
  const AddPost({super.key});
  @override
  Widget build(BuildContext context) {
    if(!PostManger.isFitched){
      PostManger().fetchPosts();
    }
    String body = "";
    List tags = [];
    return Scaffold(
      appBar: appBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Post body text field (large)
              TextField(
                onChanged: (value) {
                  body = value;
                },
                maxLines: 10,
                decoration: InputDecoration(
                  hintText: "What's on your mind?",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              // Tags text field (thinner)
              TextField(
                onChanged: (value) {
                  tags = value.split(' ');
                },
                decoration: InputDecoration(
                  hintText: 'Add tags (comma separated)',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              // Publish button
              ElevatedButton(
                onPressed: () {
                  // Logic to publish the post
                  PostManger().addPost(Post(
                    id: PostManger.posts.length + 1,
                    title: UserManger.users[UserManger.currentId].name,
                    body: body,
                    likes: 0,
                    comments: 0,
                    views: 0,
                    tags: tags,
                  ));
                  print("Post published!");
                  Navigator.pushReplacementNamed(context, RouteNames.getAllPosts);
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: const Text(
                  'Publish',
                  style: TextStyle(fontSize: 18),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
