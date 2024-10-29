import 'package:facebook_clone/core/manger/post_manger.dart';
import 'package:facebook_clone/widgets/app_bar.dart';
import 'package:flutter/material.dart';

class GetAll extends StatelessWidget{
  const GetAll({super.key});
  
@override
Widget build(BuildContext context) {
  return Scaffold(
      appBar: appBar(),
    body: PostManger().getAllPosts(),
  );
}

}