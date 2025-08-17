import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intern_selection/models/json_api.dart';
import 'package:intern_selection/widgets/drawer.dart';
import '../widgets/my_container.dart';
import '../widgets/mycolors.dart';

class DashboardScreen extends StatefulWidget {
  DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  List<Post> posts = [];

  @override
  void initState() {
    super.initState();
    loadPosts();
  }

  Future<void> loadPosts() async {
    final String response = await rootBundle.loadString('assets/post.json');
    final List<dynamic> data = json.decode(response);

    setState(() {
      posts = data.map((json) => Post.fromJson(json)).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: AppBar(
        backgroundColor: AppColors.primary,
        title: Text(
          "Dashboard",
          style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.w600),
        ),
        actions: [
          Center(child: Icon(Icons.search, color: AppColors.textSecondary)),
          SizedBox(width: 10),
        ],
      ),
      body: posts.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              physics: AlwaysScrollableScrollPhysics(),
              itemCount: posts.length,
              itemBuilder: (context, index) {
                final post = posts[index];
                return PostContainer(
                  user: post.user,
                  userid: post.userid,
                  image: post.image,
                  title: post.title,
                  description: post.description,
                );
              },
            ),
    );
  }
}
