import 'dart:convert';
import 'package:facebook_clone/widgets/post.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostManger {
  static List<Post> posts = [];
  static List<Widget> postWidgets = [];
  static bool isFitched = false;

  // Fetch posts and store them in the 'posts' list
  Future<void> fetchPosts() async {
    var url = Uri.parse('https://dummyjson.com/posts');
    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        // Decode the JSON data into a Map
        List<dynamic> jsonPosts = jsonDecode(response.body)['posts'];
        posts = List.generate(jsonPosts.length,(index){
          return Post.fromJson(jsonPosts[index]);
        } );
        postWidgets = List.generate(posts.length, (index) {
          return posts[index].getPost;
        });
        isFitched = true;
      } else {
        isFitched = false;
        throw Exception('Failed to load posts');
      }
    } catch (e) {
      isFitched = false;
      throw Exception('Error fetching posts: $e');
    }
  }

  // Get all posts as widgets (this method returns a list of widgets)
  Future<ListView> _getAllPosts() async {
    if (!isFitched) {
      await fetchPosts();
    }
    return ListView(children: postWidgets);
  }

  FutureBuilder<ListView> getAllPosts() {
    return FutureBuilder<ListView>(
      future: _getAllPosts(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView(children: postWidgets);
      },
    );
  }

  Future<Post> _getPost(int index) async {
    if (!isFitched) {
      await fetchPosts();
    }
    return posts[index];
  }

  Future<Post> getPost(int index) async {
    return await _getPost(index);
  }

  Future<Widget> _getWidgetPost(int index) async {
    if (!isFitched) {
      await fetchPosts();
    }
    return postWidgets[index];
  }

  FutureBuilder<Widget> getWidgetPost(int index) {
    return FutureBuilder<Widget>(
      future: _getWidgetPost(index),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        return postWidgets[index];
      },
    );
  }

  void addPost(Post post) async {
    if (!isFitched) {
      await fetchPosts(); // Wait for fetching posts to complete
    }

    // After fetch is complete, add the new post to the lists
     posts.add(post);
          postWidgets = List.generate(posts.length, (index) {
        return posts[index].getPost;
      },);
  }

  void deletePost(Post post) {
      posts.remove(post);
      postWidgets = List.generate(posts.length, (index) {
        return posts[index].getPost;
      },);

    print("removed ${post.title}");
  }

void updatePost(Post updatedPost) {
  // Find the index of the post with the same ID in the list
  int index = 
  posts.indexWhere((post) => post.id == updatedPost.id);

  if (index != -1) {
    print("am in the updated post title is ${updatedPost.title}");
    // If found, replace it with a new Post instance
    posts[index] = Post(
      id: updatedPost.id,
      title: updatedPost.title,
      body: updatedPost.body,
      likes: updatedPost.likes,
      comments: updatedPost.comments,
      views: updatedPost.views,
      tags: updatedPost.tags,
    );

    postWidgets = List.generate(posts.length, (index) {
      return posts[index].getPost;
      },);

  } else {
    throw Exception("Post with id ${updatedPost.title} not found.");
  }
}


}
