import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_app/screens/profile_screen.dart';
import 'package:login_app/screens/registration_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static Future<User?> loginUsingEmailPassword(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == "user-not-found") {
        print("No user found");
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Login",
            style: TextStyle(
                color: Colors.black,
                fontSize: 44.0,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 44.0),
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
          TextField(
            controller: passwordController,
            obscureText: true,
            decoration: const InputDecoration(
                hintText: 'Password',
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.black,
                )),
          ),
          const SizedBox(
            height: 26.0,
          ),
          Container(
            width: double.infinity,
            child: RawMaterialButton(
              onPressed: () async {
                User? user = await (loginUsingEmailPassword(
                    email: emailController.text,
                    password: passwordController.text,
                    context: context));
                if (user != null) {
                  Navigator.of(context).pushReplacement(
                      MaterialPageRoute(builder: (context) => ProfileScreen()));
                }
              },
              fillColor: Colors.blue,
              elevation: 0.0,
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0)),
              child: const Text(
                "Login",
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
                "Don't have an account? ",
                style: TextStyle(fontSize: 16.0),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => RegistrationScreen()));
                },
                child: const Text(
                  "Sign Up",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16.0),
                ),
              )
            ],
          )
        ],
      ),
    ));
  }
}
