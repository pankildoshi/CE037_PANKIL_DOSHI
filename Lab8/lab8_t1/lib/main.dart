import 'package:flutter/material.dart';

void main() {
  runApp(const FinalState());
}

class FinalState extends StatefulWidget {
  const FinalState({Key? key}) : super(key: key);

  @override
  State<FinalState> createState() => _FinalStateState();
}

class _FinalStateState extends State<FinalState> {
  // Intiliing the variable with the actual age
  num age = 19;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Lab 8',
        theme: ThemeData(
          primarySwatch: Colors.deepOrange,
        ),
        home: Scaffold(
          appBar: AppBar(
            title: const Text("First App"),
            centerTitle: true,
          ),
          // Desgined 2 Floating Action Buttton which will increment or decrement
          // the value of variqable
          floatingActionButton: Wrap(
            children: [
              // Floating action buttton which will incrememt the value of the varaible..
              // When this button is pressed the age varaible is incrmented by 1..
              FloatingActionButton(
                onPressed: () => {
                  setState(() {
                    age += 1;
                  })
                },
                child: const Icon(Icons.add),
              ),
              const SizedBox(
                width: 20.0,
              ),
              // Floating action buttton which will decrement the value of the varaible..
              // When this button is pressed the age varaible is decrement by 1..
              FloatingActionButton(
                onPressed: () => {
                  setState(() {
                    age -= 1;
                  })
                },
                child: const Icon(Icons.remove),
              ),
            ],
          ),
          body: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(),
                const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/profile.jpg'),
                  radius: 70,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Name: ",
                        style: TextStyle(fontSize: 24.0, letterSpacing: 2.0),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "Pankil Doshi",
                        style: TextStyle(fontSize: 24.0, letterSpacing: 2.0),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        "Age: ",
                        style: TextStyle(fontSize: 24.0, letterSpacing: 2.0),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        // Accessing the Value of the variable..
                        // The actual value for the first time when the app is launched is 19
                        '$age',
                        style:
                            const TextStyle(fontSize: 24.0, letterSpacing: 2.0),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(0, 0, 8.0, 0),
                        child: Icon(
                          Icons.email,
                          color: Colors.blue,
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        "pankil@gmail.com",
                        style: TextStyle(fontSize: 24.0, letterSpacing: 2.0),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}

// // Test1 is StatefulWidget class which creates object of 'state' object
// class Test1 extends StatefulWidget {
//   const Test1({Key? key}) : super(key: key);

//   @override
//   State<Test1> createState() => _Test1State();
// }

// // following class builds 'state' object for above class
// // in this class we can define data which can change their states
// class _Test1State extends State<Test1> {
//   @override
//   Widget build(BuildContext context) {
//     return Container();
//   }
// }

// Padding can be added to your widget using one of the two ways
// 1. Padding class
// 2. Padding property inside any container
// Padding() class
// body: const Padding(
//   padding: EdgeInsets.fromLTRB(20, 20, 20, 20),
//   child: Text(
//     "Hello World",
//     style: TextStyle(fontSize: 40.0),
//   ),
// ),
// // container's padding: property
// body: Container(
//   padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
//   child: const Text(
//     "Hey, there!",
//     style: TextStyle(fontSize: 40.0),
//   ),
// ),


// body: Column(
// // Setting the mainAxisAlignment & crossAxisAlignment
// // properties to center to vertically & horizontally
// // aligning Children widgets to center
// mainAxisAlignment: MainAxisAlignment.center,
// crossAxisAlignment: CrossAxisAlignment.center,
// children: [
//   // Adding Multiple Containers
//   // Wraping them with Padding() class
//   Row(),
//   Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Container(
//       color: Colors.red,
//       padding: const EdgeInsets.all(20.0),
//       child: const Text("Box 1"),
//     ),
//   ),
//   Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Container(
//       color: Colors.blue,
//       padding: const EdgeInsets.all(20.0),
//       child: const Text("Box 1"),
//     ),
//   ),
//   Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Container(
//       color: Colors.green,
//       padding: const EdgeInsets.all(20.0),
//       child: const Text("Box 1"),
//     ),
//   ),
// ],
// )

// Putting All the boxes in one line
// body: Row(
//   mainAxisAlignment: MainAxisAlignment.center,
//   crossAxisAlignment: CrossAxisAlignment.center,
//   // Adding multiple containers using children:
//   children: [
//     // Expanded expands the container to occupy as much as width
//     // that the container can
//     Expanded(
//       child: Container(
//         color: Colors.red,
//         padding: const EdgeInsets.all(20.0),
//         child: const Text("Box 1"),
//       ),
//     ),
//     Container(
//       color: Colors.blue,
//       padding: const EdgeInsets.all(20.0),
//       child: const Text("Box 1"),
//     ),
//     Container(
//       color: Colors.green,
//       padding: const EdgeInsets.all(20.0),
//       child: const Text("Box 1"),
//     ),
//   ],
// )));