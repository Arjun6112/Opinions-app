import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:like_button/like_button.dart';

class WallPost extends StatefulWidget {
  const WallPost(
      {super.key,
      required this.message,
      required this.user,
      required this.postId,
      required this.likes});
  final String message;
  final String user;
  final String postId;
  final List<String> likes;

  @override
  State<WallPost> createState() => _WallPostState();
}

class _WallPostState extends State<WallPost> {
  final currentUser = FirebaseAuth.instance.currentUser!;
  bool isLiked = false;

  @override
  void initState() {
    isLiked = widget.likes.contains(currentUser.email);
    super.initState();
  }

  void toggleLike() {
    setState(() {
      isLiked = !isLiked;
    });
    print(isLiked);

    DocumentReference docRef =
        FirebaseFirestore.instance.collection('User Posts').doc(widget.postId);

    if (isLiked) {
      docRef.update({
        'Likes': FieldValue.arrayUnion([currentUser.email])
      });
    } else {
      docRef.update({
        'Likes': FieldValue.arrayRemove([currentUser.email])
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.deepOrange[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Icon(Icons.person, color: Colors.white, size: 50),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.message,
                  overflow: TextOverflow.ellipsis,
                  style: GoogleFonts.poppins(
                    fontSize: 15,
                    color: Colors.white,
                  )),
              const SizedBox(
                height: 10,
              ),
              Row(
                children: [
                  Text(
                    widget.user,
                    style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white54,
                    ),
                  ),
                ],
              ),
            ],
          ),
          Container(
            padding: const EdgeInsets.all(5),
            alignment: AlignmentDirectional.center,
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: LikeButton(
              onTap: (isLiked) {
                toggleLike();
                return Future.value(!isLiked);
              },
              isLiked: isLiked,
              likeCount: widget.likes.length,
            ),
          )
        ],
      ),
    );
  }
}
