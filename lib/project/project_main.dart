
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:learn_reverpod/project/page/home/home_page.dart';




void main() {
  runApp(const ProviderScope(
      child:  MyRiverpodProject()
  ));
}

class MyRiverpodProject extends StatelessWidget {
  const MyRiverpodProject({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}


