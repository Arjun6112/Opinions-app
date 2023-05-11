import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:opinions_app/components/text_field.dart';
import 'package:opinions_app/components/wall_post.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _opinioncontroller = TextEditingController();

  void postMessage() {
    if (_opinioncontroller.text.isNotEmpty) {
      FirebaseFirestore.instance.collection('User Posts').add({
        'Message': _opinioncontroller.text,
        'User': FirebaseAuth.instance.currentUser!.email,
        'TimeStamp': Timestamp.now(),
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              icon: const Icon(Icons.logout))
        ],
        centerTitle: true,
        title: Text(
          "Opinions",
          style: GoogleFonts.sacramento(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Colors.deepOrange[300]),
        ),
      ),
      body: Column(
        children: [
          Expanded(
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("User Posts")
                      .orderBy("TimeStamp", descending: false)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return ListView.builder(
                          itemCount: snapshot.data!.docs.length,
                          itemBuilder: (context, index) {
                            final post = snapshot.data!.docs[index];
                            return ListTile(
                              title: WallPost(
                                  message: post['Message'], user: post['User']),
                            );
                            // return WallPost(
                            //     message: post['Message'], user: post['User']);
                          });
                    } else if (snapshot.hasError) {
                      return Center(
                        child: Text("Error :${snapshot.error}"),
                      );
                    }
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.deepOrange,
                      ),
                    );
                  })),
          Divider(
            color: Colors.deepOrange[300],
            thickness: 2,
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Expanded(
                  child: CustomTF(
                controller: _opinioncontroller,
                hintText: 'Your Opinions',
                obscureText: false,
              )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: IconButton(
                    onPressed: () {
                      postMessage();
                      _opinioncontroller.clear();
                    },
                    icon: Icon(
                      color: Colors.deepOrange[300],
                      Icons.arrow_circle_up,
                      size: 38,
                    )),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: Text(
              "Logged in as ${FirebaseAuth.instance.currentUser!.email}",
              style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            ),
          )
        ],
      ),
    );
  }
}
