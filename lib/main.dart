import 'package:flutter/material.dart';
import 'package:monitoring_app/views/followers_page.dart';
import 'package:monitoring_app/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const HomePage(),
        "/followers": (context) => const FollowersPage()
      },
    );
  }
}
