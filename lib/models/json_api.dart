class Post {
  final String user;
  final String userid;
  final String image;
  final String title;
  final String description;

  Post({
    required this.user,
    required this.userid,
    required this.image,
    required this.title,
    required this.description,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      user: json['user'],
      userid: json['userid'],
      image: json['image'],
      title: json['title'],
      description: json['description'],
    );
  }
}
