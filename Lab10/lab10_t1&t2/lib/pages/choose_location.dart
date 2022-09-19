import 'package:flutter/material.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    print("Build Function in ChooseLocation");
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        title: const Text("Choose Location"),
      ),
      body: ElevatedButton(
        onPressed: () => {
          setState(() {
            counter += 1;
          })
        },
        child: Text("Counter: $counter"),
      ),
    );
  }
}
