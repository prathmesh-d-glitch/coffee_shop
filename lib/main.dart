// import 'package:coffee/screens/home_page.dart';
// import 'package:coffee/screens/detail_page.dart';
// import 'package:coffee/widgets/custom_tab_bar.dart';
import 'package:coffee/screens/login_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(const SwiftCafeApp());

class SwiftCafeApp extends StatelessWidget {
  const SwiftCafeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}