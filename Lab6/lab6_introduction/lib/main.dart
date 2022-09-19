import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    // Scaffold is basic material design visual layout structure
    // where we can place widgets
    home: Scaffold(
      // appbar: property specifies Appbar of the application displayed on top
      // Text() is used to specify a text widget
      // which is here assigned to title: of Appbar
      appBar: AppBar(
        title: const Text("Lab6: Introduction"),
      ),
      // body: specifies the main section of application
      // where widgets are placed
      // Center() is centers the widget vertically & horizontally on screen
      body: const Center(
        child: Text(
          "Hello World",
          // defininf custom font family
          style: TextStyle(fontFamily: 'BungeeSpice'),
        ),
      ),
      // specifies scaffold background color
      backgroundColor: Colors.black,
    ),
  ));
}
