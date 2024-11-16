import 'package:flutter/material.dart';
import 'package:myapp/profile/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Social Shopping',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromRGBO(153, 218, 208, 1),
          primary: const Color.fromRGBO(153, 218, 208, 1),
        ),
        useMaterial3: true,
      ),
      home: const ProfilePage(),
    );
  }
}
