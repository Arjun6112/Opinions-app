import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:opinions_app/components/text_field.dart';
import 'package:opinions_app/views/auth/signup_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  void signIn() async {
    showDialog(
        context: context,
        builder: (context) =>
            const Center(child: CupertinoActivityIndicator()));
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
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
          'Login',
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
            height: 100,
          ),
          CustomTF(
              hintText: "Enter Email",
              controller: _emailController,
              obscureText: false),
          CustomTF(
              hintText: "Enter Password",
              controller: _passwordController,
              obscureText: true),
          const SizedBox(height: 20),
          InkWell(
            onTap: signIn,
            child: Container(
              width: MediaQuery.of(context).size.width * 0.8,
              height: 50,
              decoration: BoxDecoration(
                  color: Colors.deepOrange[300],
                  borderRadius: BorderRadius.circular(10)),
              child: const Center(
                child: Text(
                  "Login",
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
