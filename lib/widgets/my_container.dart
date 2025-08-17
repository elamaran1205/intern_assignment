import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intern_selection/screens/detail_screen.dart';
import '../widgets/mycolors.dart';

class PostContainer extends StatelessWidget {
  final String user;
  final String userid;
  final String image;
  final String title;
  final String description;

  PostContainer({
    super.key,
    required this.user,
    required this.userid,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
          () => DetailsScreen(
            user: user,
            userid: userid,
            image: image,
            title: title,
            description: description,
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(15.0),
        padding: EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              leading: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(user, style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(userid),
                ],
              ),
              trailing: IconButton(
                onPressed: () {},
                icon: Icon(Icons.more_horiz, color: AppColors.secondary),
              ),
            ),
            SizedBox(height: 10),
            Padding(
              padding: const EdgeInsets.all(18.0),
              child: image.startsWith('http')
                  ? Image.network(image, fit: BoxFit.contain)
                  : Image.asset(image, fit: BoxFit.contain),
            ),
            SizedBox(height: 15),
            Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 12),
            Text(description),
            Row(
              children: [
                Spacer(),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.share_outlined, color: AppColors.secondary),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
