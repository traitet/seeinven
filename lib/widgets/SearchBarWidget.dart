import 'dart:math';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flutter/material.dart';



class Post {
  final String title;
  final String body;

  Post(this.title, this.body);
}

class SearchBarWidget extends StatefulWidget {
  @override
  _SearchBarWidgetState createState() => _SearchBarWidgetState();
}

class _SearchBarWidgetState extends State<SearchBarWidget> {
  final SearchBarController<Post> _searchBarController = SearchBarController();
  bool isReplay = false;

  @override
  Widget build(BuildContext context) {
    return 
    // Scaffold(
      SafeArea(
        child: SearchBar<Post>(
          // searchBarPadding: EdgeInsets.symmetric(horizontal: 10),
          // headerPadding: EdgeInsets.symmetric(horizontal: 10),
          // listPadding: EdgeInsets.symmetric(horizontal: 10),
          onSearch: _getALlPosts,
          searchBarController: _searchBarController,
          // placeHolder: Text("placeholder"),
          // cancellationWidget: Text("Cancel"),
          // emptyWidget: Text("empty"),
          // indexedScaledTileBuilder: (int index) => ScaledTile.count(1, index.isEven ? 2 : 1),
          // onCancelled: () {print("Cancelled triggered");},
          // mainAxisSpacing: 5,
          // crossAxisSpacing: 5,
          // crossAxisCount: 2,
          onItemFound: (Post post, int index) {
            return Container(
              // color: Colors.lightBlue,
              // child: ListTile(
              //   title: Text(post.title),
              //   isThreeLine: true,
              //   subtitle: Text(post.body),
              //   onTap: () {
              //     Navigator.of(context).push(MaterialPageRoute(builder: (context) => Detail()));
              //   },
              // ),
            );
          },
        ),
      );
    
  }

    Future<List<Post>> _getALlPosts(String text) async {
    await Future.delayed(Duration(seconds: text.length == 4 ? 10 : 1));
    if (isReplay) return [Post("Replaying !", "Replaying body")];
    if (text.length == 5) throw Error();
    if (text.length == 6) return [];
    List<Post> posts = [];
    var random = new Random();
    for (int i = 0; i < 10; i++) {
      posts.add(Post("$text $i", "body random number : ${random.nextInt(100)}"));
    }
    return posts;
  }
}

// class Detail extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: <Widget>[
//             IconButton(
//               icon: Icon(Icons.arrow_back),
//               onPressed: () => Navigator.of(context).pop(),
//             ),
//             Text("Detail"),
//           ],
//         ),
//       ),
//     );
//   }
// }