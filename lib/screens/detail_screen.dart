import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/mycolors.dart';

class DetailsScreen extends StatelessWidget {
  final String user;
  final String userid;
  final String image;
  final String title;
  final String description;

  DetailsScreen({
    required this.user,
    required this.userid,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title,style: GoogleFonts.poppins(),),
        backgroundColor: AppColors.primary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: image.startsWith('http')
                  ? Image.network(image, height: 200)
                  : Image.asset(image, height: 200),
            ),
            SizedBox(height: 20),
            Text(user, style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 18)),
            Text(userid, style: TextStyle(color: AppColors.textSecondary)),
            SizedBox(height: 15),
            Text(description, style: GoogleFonts.poppins(fontSize: 16)),
          ],
        ),
      ),
    );
  }
}