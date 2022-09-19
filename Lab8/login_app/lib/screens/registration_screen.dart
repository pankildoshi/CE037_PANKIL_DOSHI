import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_app/models/user_model.dart';
import 'package:login_app/screens/login_screen.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({Key? key}) : super(key: key);

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  final _formKey = GlobalKey<FormState>();
  final _auth = FirebaseAuth.instance;

  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  postDetailsToFirestore() async {
    FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
    User? user = _auth.currentUser;

    UserModel userModel = UserModel();
    userModel.userId = user!.uid;
    userModel.email = user.email;
    userModel.firstName = firstNameController.text;
    userModel.lastName = lastNameController.text;

    await firebaseFirestore
        .collection("users")
        .doc(user.uid)
        .set(userModel.toMap());
    Fluttertoast.showToast(msg: "Sign up successful!");

    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => LoginScreen()),
        (route) => false);
  }

  void register(String email, String password) async {
    if (_formKey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsToFirestore()})
          .catchError((e) {
        Fluttertoast.showToast(msg: e.message);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Form(
              key: _formKey,
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Sign Up",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 44.0,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 44.0),
                    TextFormField(
                      controller: firstNameController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                          hintText: 'First Name',
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.black,
                          )),
                    ),
                    const SizedBox(height: 26.0),
                    TextFormField(
                      controller: lastNameController,
                      keyboardType: TextInputType.text,
                      decoration: const InputDecoration(
                          hintText: 'Last Name',
                          prefixIcon: Icon(
                            Icons.person,
                            color: Colors.black,
                          )),
                    ),
                    const SizedBox(height: 26.0),
                    TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: const InputDecoration(
                          hintText: 'Email',
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.black,
                          )),
                    ),
                    const SizedBox(
                      height: 26.0,
                    ),
                    TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      validator: (value) {
                        RegExp regex = RegExp(r'^.{6,}$');
                        if (value!.isEmpty) {
                          return "Password is required";
                        }
                        if (!regex.hasMatch(value)) {
                          return "Enter Valid Password(Min. 6 Charactors)";
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          hintText: 'Password',
                          prefixIcon: Icon(
                            Icons.key,
                            color: Colors.black,
                          )),
                    ),
                    const SizedBox(
                      height: 26.0,
                    ),
                    TextFormField(
                      controller: confirmPasswordController,
                      obscureText: true,
                      validator: (value) {
                        if (passwordController.text.length >= 6 &&
                            passwordController.text != value) {
                          return "Password doesn't match";
                        } else {
                          return null;
                        }
                      },
                      decoration: const InputDecoration(
                          hintText: 'Confirm Password',
                          prefixIcon: Icon(
                            Icons.key,
                            color: Colors.black,
                          )),
                    ),
                    const SizedBox(
                      height: 26.0,
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: RawMaterialButton(
                        onPressed: () {
                          register(
                              emailController.text, passwordController.text);
                        },
                        fillColor: Colors.blue,
                        elevation: 0.0,
                        padding: const EdgeInsets.symmetric(vertical: 20.0),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.0)),
                        child: const Text(
                          "Sign Up",
                          style: TextStyle(color: Colors.white, fontSize: 18.0),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 16.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account? ",
                          style: TextStyle(fontSize: 16.0),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginScreen()));
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 16.0),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
