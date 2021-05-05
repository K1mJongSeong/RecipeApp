import 'package:flutter/material.dart';
import 'utils.dart';

class ThreadPostData {
  final String userName;
  final String userThumbnail;
  final String postDate;
  final int postTimeStamp;
  final String postContent;
  final String postImage;
  final int postLikeCount;
  final int postCommentCount;

  ThreadPostData(
      {this.userName,
      this.userThumbnail,
      this.postDate,
      this.postContent,
      this.postImage,
      this.postLikeCount,
      this.postCommentCount,
      this.postTimeStamp});
}

class Board extends StatefulWidget {
  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  List<ThreadPostData> dummyData = [
    new ThreadPostData(
        userName: "김종성",
        userThumbnail: "",
        postTimeStamp: 3123,
        postContent: "This is first post ",
        postLikeCount: 4,
        postCommentCount: 5),
    new ThreadPostData(
        userName: "김동현",
        userThumbnail: "",
        postTimeStamp: 2222,
        postContent: "This is test content",
        postLikeCount: 4,
        postCommentCount: 5),
    new ThreadPostData(
        userName: "정재원",
        userThumbnail: "",
        postTimeStamp: 2323,
        postContent: "This is test content",
        postLikeCount: 4,
        postCommentCount: 5),
    new ThreadPostData(
        userName: "이건우",
        userThumbnail: "",
        postTimeStamp: 232323,
        postContent: "This is test content",
        postLikeCount: 4,
        postCommentCount: 5),
  ];

  bool _isLoading = false;
  @override
  void initState() {
    _takeUserDataFromFB();
    super.initState();
  }

  Future<void> _takeUserDataFromFB() async {
    setState(() {
      _isLoading = true;
    });
  }

  void _incrementCounter() {
    print("write post");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          ListView(
            shrinkWrap: true,
            children: dummyData.map(_listTile).toList(),
          ),
          _isLoading
              ? Positioned(
                  child: Container(
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                    color: Colors.white.withOpacity(0.7),
                  ),
                )
              : Container()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: "Increment",
        child: Icon(Icons.create),
      ),
    );
  }

  Widget _listTile(ThreadPostData data) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(2.0, 2.0, 2.0, 12),
      child: Card(
        elevation: 2.0,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.check,
                      size: 34,
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        data.userName,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(2.0),
                        child: Text(
                          readTimestamp(data.postTimeStamp),
                          style: TextStyle(fontSize: 16, color: Colors.black87),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(
                height: 4,
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(4, 10, 4, 10),
                child: Text(
                  data.postContent,
                  style: TextStyle(fontSize: 20),
                ),
              ),
              Divider(
                height: 4,
                color: Colors.black,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      Icon(Icons.thumb_up),
                      Text('Like'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.mode_comment),
                      Text('Comment'),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
        // child: ListTile(
        //   onTap: (){
        //     print("tap the list tile");
        //   },
        //   title: Text(data.postContent,style: TextStyle(fontSize: 18),),
        // ),
      ),
    );
  }
}
