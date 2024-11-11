import 'package:flutter/material.dart';
import 'pages/login_page.dart';

void main() {
  runApp(NetWatchApp());
}

class NetWatchApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NetWatch',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
