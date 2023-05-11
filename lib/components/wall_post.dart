import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WallPost extends StatelessWidget {
  const WallPost({super.key, required this.message, required this.user});
  final String message;
  final String user;

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
        children: [
          const Icon(Icons.person, color: Colors.white, size: 50),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [],
              ),
              Text(message,
                  style: GoogleFonts.poppins(
                    fontSize: 20,
                    color: Colors.white,
                  )),
              const SizedBox(
                height: 10,
              ),
              Text(
                user,
                style: const TextStyle(
                  fontSize: 15,
                  color: Colors.white54,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
