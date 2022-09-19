import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
        appBar: AppBar(
          title: const Text("Lab7"),
        ),
        body: Column(
          children: [
            // Adding an Image to body of the Application
            // const Image(
            //   // image: property is used to An Image
            //   // AssetImage() constructor is used to specify the path of an Image
            //   image: AssetImage("assets/images/nike.jpg"),
            // ),
            // // Adding an Icon using Icon widget
            const Icon(
              Icons.flutter_dash,
              size: 100,
              color: Colors.blue,
            ),

            // Elevated Button: An elevated button is a label child displayed
            // on a Material widget whose Material. elevation increases
            // when the button is pressed.
            ElevatedButton(
                onPressed: () => {print("Elevated Button Pressed")},
                child: const Text("Elevated button")),

            // Flat Button: FlatButton is the material design widget in flutter.
            // It is a text label material widget that performs an action
            // when the button is tapped.
            FlatButton(
              onPressed: () => {print("Flat Button Pressed")},
              color: Colors.amberAccent,
              child: const Text("Flat Button"),
            ),

            // Icon Button: An icon button is a picture printed on a Material
            // widget that reacts to touches by filling with color (ink).
            // Icon buttons are commonly used in the AppBar.
            IconButton(
              onPressed: () => {print("Icon Button Pressed")},
              icon: const Icon(Icons.add_reaction_outlined),
              iconSize: 45.0,
              tooltip: "Add an Emoji",
            ),

            // Text Button: A text button is a label child displayed on a
            // Material widget. The label's Text and Icon widgets are displayed
            // in the style's ButtonStyle.
            TextButton(
                onPressed: () => {print("Text Button Pressed")},
                child: const Text("Text Button")),

            // Directionality: A widget that determines the ambient
            // directionality of text and text-direction-sensitive render objects.
            Directionality(
              textDirection: TextDirection.rtl,
              child: TextButton.icon(
                  onPressed: () => {print("Text Button Pressed")},
                  icon: const Icon(Icons.camera_alt),
                  label: const Text("Text Button")),
            )
          ],
        )),
  ));
}
