import 'package:flutter/material.dart';
import 'package:socialmedia/details.dart';
import 'package:socialmedia/post.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      HomeAppBar(),
      Padding(
          padding: const EdgeInsets.only(top: 90.0),
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return Column(children: [
                  PostCard(
                      post: PostItem(
                    content: "This is the content of post $index",
                    poster: "Siri Basavaraj",
                    image: "assets/post$index.png",
                    likes: index + 100,
                  )),
                  Padding(
                    padding: EdgeInsets.only(left: 12.0, right: 12.0),
                    child: Divider(
                      color: Colors.grey[300],
                    ),
                  )
                ]);
              }))
    ]));
  }
}

class PostCard extends StatelessWidget {
  final PostItem post;
  const PostCard({required this.post});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ViewPostPage(post:post                              )));},
      child: Container(
        margin: EdgeInsets.all(8.0),
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(16.0)),
              child: Image.asset(post.image),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        post.content,
                        style: TextStyle(fontSize: 16.0),
                      ),
                      SizedBox(height: 8.0),
                      Text(
                        post.poster,
                        style: TextStyle(fontWeight: FontWeight.w300),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.favorite_border,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class HomeAppBar extends StatefulWidget implements PreferredSizeWidget {
  @override
  _HomeAppBarState createState() => _HomeAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(64);
}

class _HomeAppBarState extends State<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16.0),
      decoration: BoxDecoration(color: Colors.white),
      child: SafeArea(
        bottom: false,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.search,
                size: 30.0,
                color: Colors.grey,
              ),
            ),
            Text(
              "PESUIO",
              style: TextStyle(
                color: Colors.black,
                fontSize: 32.0,
                fontWeight: FontWeight.w700,
                fontFamily: 'Aladin',
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.message_rounded, size: 30.0, color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
