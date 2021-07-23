import 'package:flutter/material.dart';
import 'package:unitpay_test/screens/menu_page.dart';

void main() {
  runApp(UnitpayTest());
}

class UnitpayTest extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unitpay Test',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MenuPage(),
    );
  }
}
