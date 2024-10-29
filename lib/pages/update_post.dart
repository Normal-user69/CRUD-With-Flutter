import 'package:facebook_clone/core/manger/post_manger.dart';
import 'package:facebook_clone/core/routes/route_names.dart';
import 'package:facebook_clone/widgets/app_bar.dart';
import 'package:facebook_clone/widgets/post.dart';
import 'package:flutter/material.dart';

class UpdatePost extends StatefulWidget {
  const UpdatePost({super.key});

  @override
  State<UpdatePost> createState() => _UpdatePostState();
}

class _UpdatePostState extends State<UpdatePost> {
  int postid = -1;
  bool isUpdating = false;
  late Post post;
  // Controllers for the update fields
  final TextEditingController titleController = TextEditingController();
  final TextEditingController bodyController = TextEditingController();
  final TextEditingController tagsController = TextEditingController();

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
                if (postid > -1 && isUpdating)
                  FutureBuilder<Post>(
                    future: PostManger().getPost(postid),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (snapshot.hasData) {
                       post = snapshot.data!;
                        _initializeControllers(post);
                        return updateSection();
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

  // Initializes controllers with the fetched post data (only once)
  void _initializeControllers(Post post) {
    if (titleController.text.isEmpty) {
      titleController.text = post.title;
      bodyController.text = post.body;
      tagsController.text = post.tags.join(', ');
    }
  }

  // Search bar for entering post ID
  Widget searchBar() {
    return Container(
      color: Colors.grey,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: (value) {
                try {
                  postid = int.parse(value);
                } catch (e) {
                  postid = -1;
                }
              },
              decoration: const InputDecoration(
                hintText: "Enter The Post ID",
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                isUpdating = true; // This will trigger the update section to show
              });
            },
            child: const Text("Search"),
          ),
        ],
      ),
    );
  }

  // Update Section with title, body, and tags fields
  Widget updateSection() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Title field
          TextField(
            controller: titleController,
            decoration: InputDecoration(
              labelText: "Title",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Body field
          TextField(
            controller: bodyController,
            maxLines: 10,
            decoration: InputDecoration(
              labelText: "Body",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
          ),
          const SizedBox(height: 20),

          // Tags field
          TextField(
            controller: tagsController,
            decoration: InputDecoration(
              labelText: "Tags (comma separated)",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
            ),
          ),
          const SizedBox(height: 30),

          // Update button
          ElevatedButton(
            onPressed: () {
              // Create updated post with new data
              final updatedPost = Post(
                id: post.id,
                title: titleController.text,
                body: bodyController.text,
                likes: post.likes,          // Assuming you want to keep the same likes count
                comments: post.comments,    // Same comments count
                views: post.views,          // Same views count
                tags: tagsController.text.split(',').map((tag) => tag.trim()).toList(),
              );

              // Update the post and navigate back to all posts
              PostManger().updatePost(updatedPost);
              Navigator.pushReplacementNamed(context, RouteNames.getAllPosts);
            },
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 15),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
            child: const Text(
              'Update',
              style: TextStyle(fontSize: 18),
            ),
          ),
        ],
      ),
    );
  }
}
