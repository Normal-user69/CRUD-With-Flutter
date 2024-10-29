import 'package:device_preview/device_preview.dart';
import 'package:facebook_clone/core/routes/pages.dart';
import 'package:facebook_clone/core/routes/route_names.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(DevicePreview(
    builder: (context) =>const MyApp(),
    enabled: true, 
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      initialRoute: RouteNames.home,
      onGenerateRoute: AppRoute.generate,
    );
  }
}
