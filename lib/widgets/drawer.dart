import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intern_selection/widgets/mycolors.dart';

class MyDrawer extends StatelessWidget {
   MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return  Drawer(
       backgroundColor: AppColors.secondary,
  child: ListView(
    padding: EdgeInsets.zero,
    children: [
      DrawerHeader(
        decoration: BoxDecoration(
          color: AppColors.primary,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundImage: AssetImage('assets/logo.png'),
            ),
            SizedBox(height: 10),
            Text(
              'Welcome!',
              style: GoogleFonts.poppins(
                  fontSize: 18, fontWeight: FontWeight.w600, color: Colors.white),
            ),
          ],
        ),
      ),
      ListTile(
        leading: Icon(Icons.dashboard, color: Colors.white),
        title: Text('Dashboard', style: GoogleFonts.poppins(color: Colors.white)),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      ListTile(
        leading: Icon(Icons.settings, color: Colors.white),
        title: Text('Settings', style: GoogleFonts.poppins(color: Colors.white)),
        onTap: () {
          Navigator.pop(context);
          
        },
      ),
      ListTile(
        leading: Icon(Icons.contact_mail, color: Colors.white),
        title: Text('Contact', style: GoogleFonts.poppins(color: Colors.white)),
        onTap: () {
          Navigator.pop(context);
   
        },
      ),
      ListTile(
        leading: Icon(Icons.help_outline, color: Colors.white),
        title: Text('Help', style: GoogleFonts.poppins(color: Colors.white)),
        onTap: () {
          Navigator.pop(context);
         
        },
      ),
      ListTile(
        leading: Icon(Icons.person, color: Colors.white),
        title: Text('Profile', style: GoogleFonts.poppins(color: Colors.white)),
        onTap: () {
          Navigator.pop(context);
         
        },
      ),
    ],
  ),
    );
  }
}