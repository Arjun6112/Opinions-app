import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../components/text_field.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _userNameController = TextEditingController();

  void signUpUser() async {
    showDialog(
        context: context,
        builder: (context) =>
            const Center(child: CupertinoActivityIndicator()));
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _emailController.text, password: _passwordController.text);
      if (context.mounted) {
        Navigator.pop(context);
      }
    } on FirebaseAuthException catch (e) {
      Navigator.pop(context);
      displayMessage(e.code);
    }
  }

  void displayMessage(String message) {
    showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Text(message),
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          'Register',
          style: GoogleFonts.poppins(fontSize: 30, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          Icon(Icons.people, size: 100, color: Colors.deepOrange[300]),
          Text(
            "Your opinion matters!",
            style: GoogleFonts.poppins(fontSize: 25),
          ),
          const SizedBox(
            height: 40,
          ),
          CustomTF(
              hintText: "Choose a username",
              controller: _userNameController,
              obscureText: false),
          CustomTF(
              hintText: "Enter Email",
              controller: _emailController,
              obscureText: false),
          CustomTF(
              hintText: "Enter Password",
              controller: _passwordController,
              obscureText: true),
          const SizedBox(height: 10),
          InkWell(
            onTap: signUpUser,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.deepOrange[300],
                  borderRadius: BorderRadius.circular(10)),
              child: const Center(
                child: Text(
                  "Sign Up",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 70),
              Text("Don't have an account? ", style: GoogleFonts.poppins()),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: ((context) => const SignUpScreen())));
                },
                child: Text(
                  "Sign Up",
                  style: GoogleFonts.poppins(color: Colors.deepOrange),
                ),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
