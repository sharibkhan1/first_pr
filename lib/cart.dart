import 'package:flutter/material.dart';
import 'mobile.dart';
class Cartpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('cart'),
      ),
      body: Center(
        child: Text('This is the CArt Page'),
      ),
    );
  }
}