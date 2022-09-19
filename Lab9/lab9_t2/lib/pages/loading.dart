import 'package:flutter/material.dart';
// Importing the necessary packages for the word_time.dart file..
import '../services/word_time.dart';

class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  String? time = 'Loading...';
  void setWorldTime() async {
    WordTime timeinstance =
        WordTime(location: 'kolkata', flag: 'india.png', url: 'Asia/Kolkata');
    await timeinstance.getTime();
    setState(() {
      time = timeinstance.time;
    });
  }

  @override
  void initState() {
    super.initState();
    print("Init State function in choose location");
    setWorldTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Loading Title"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(time.toString()),
      ),
    );
  }
}
