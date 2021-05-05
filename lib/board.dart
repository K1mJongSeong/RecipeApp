import 'package:flutter/material.dart';
import 'colors.dart';

class ThreadPostData {
  final String userName;
  final String userThumbnail;
  final String postDate;
  final String postTimeStamp;
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

final List<String> entries4 = <String>[
  'assets/images/김치볶음밥.jpg',
  'assets/images/닭갈비.jpg',
  'assets/images/돼지고기김치볶음.jpg',
  'assets/images/떡볶이.jpg',
  'assets/images/오리주물럭.jpg',
  'assets/images/잡채.jpg',
  'assets/images/제육볶음.jpg',
  'assets/images/김치찌개.jpg',
  'assets/images/된장찌개.jpg',
  'assets/images/muffin2.PNG',
];

class Board extends StatefulWidget {
  @override
  _BoardState createState() => _BoardState();
}

class _BoardState extends State<Board> {
  List<ThreadPostData> dummyData = [
    new ThreadPostData(
        userName: "김종성",
        userThumbnail: "",
        postTimeStamp: "3 Seconds Ago",
        postContent: "안녕하세요. 쌉싸름한 레시피 PM을 맡고있는 김종성입니다."
            "현재 개발 솔플중",
        postLikeCount: 1,
        postCommentCount: 5),
    new ThreadPostData(
        userName: "김동현",
        userThumbnail: "",
        postTimeStamp: "1 Minutes Ago",
        postContent: "안녕하세요. 쌉싸름한 레시피 팀원 김동현입니다. 안녕히가세요.",
        postLikeCount: 444,
        postCommentCount: 2),
    new ThreadPostData(
        userName: "정재원",
        userThumbnail: "",
        postTimeStamp: "24 Hours Ago",
        postContent: "안녕하세요. 쌉싸름한 레시피 팀원 정재원입니다. 이번 발표 잘 부탁드립니다.",
        postLikeCount: 7,
        postCommentCount: 3),
    new ThreadPostData(
        userName: "이건우",
        userThumbnail: "",
        postTimeStamp: "3 Days Ago",
        postContent: "안녕하세요. 쌉싸름한 레시피 팀원 이건우입니다. ",
        postLikeCount: 6,
        postCommentCount: 1),
  ];

  bool _isLoading = false;
  @override
  void initState() {
    //_takeUserDataFromFB();
    super.initState();
  }

/*
  Future<void> _takeUserDataFromFB() async {
    setState(() {
      _isLoading = true;
    });
  }
*/
  void _incrementCounter() {
    print("write post");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color(0xFFCCCC99),
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
        color: basic,
        elevation: 7.0,
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
                        Icons.perm_identity,
                        size: 34,
                      )),
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
                          data.postTimeStamp,
                          style: TextStyle(fontSize: 16, color: Colors.black87),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Divider(
                height: 2,
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
                height: 2,
                color: Colors.black,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 6.0, bottom: 2.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.thumb_up,
                          size: 20,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Like ${data.postLikeCount}',
                            style: TextStyle(
                                fontSize: 19, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.mode_comment),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Comment ${data.postCommentCount}',
                            style: TextStyle(
                                fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
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
