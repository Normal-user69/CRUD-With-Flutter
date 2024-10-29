import 'package:facebook_clone/core/routes/route_names.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: btns(context),
        ),
      ),
    );
  }

  List<Widget> btns(BuildContext context) {
    List btnsTxt = RouteNames.appRoutes.keys.toList();
    List btnNavi = RouteNames.appRoutes.values.toList();
    return List.generate(btnsTxt.length-3, (index) {
      return InkWell(
        child: Container(
            color: Colors.red,
            margin: const EdgeInsets.all(16),
            child: Center(
                child: Text(
              btnsTxt[index+3],
              style: const TextStyle(
                fontSize: 40,
                color: Colors.white
              ),
            ))),
            onTap: (){
              Navigator.pushNamed(context, btnNavi[index+3]);
            },
      );
    });
  }
}
