import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';
import 'body.dart';
import 'todoList.dart';
import 'wirtePost.dart';

final List<String> entries = <String>[
  '김치볶음밥',
  '닭갈비',
  '돼지고기김치볶음',
  '떡볶이',
  '오리주물럭',
  '잡채',
  '제육볶음',
  '김치찌개',
  '된장찌개',
  '머핀'
];

final List<String> entries2 = <String>[
  '김치볶음밥은 김치의 톡 쏘는 맛이 볶은 밥의 느끼함을 보완해주어 맛의 균형이 잘 맞는다.',
  '양념고추장에 재워 둔 닭갈비를 양배추·고구마·당근·파와 함께 볶는 음식.',
  '돼지고기를 김치·파와 함께 볶은 음식.',
  '떡과 부재료를 양념에 볶거나 끓여서 먹는 음식.',
  '양념고추장에 재워 둔 오리고기를 양파·대파·부추·숙주나물 등과 함께 볶은 음식.',
  '이름 그대로 잡다한 재료(당면, 돼지고기, 채소, 버섯 등)를 모아 볶은 음식.',
  '양념고추장에 재워 둔 돼지고기를 볶은 음식.',
  '한국의 대표적인 음식인 김치를 넣고 얼큰하게 끓인 음식.',
  '된장을 푼 물에 갖은 재료를 넣어 끓인 음식.',
  '밀가루에 설탕, 유지, 우유, 달걀, 베이킹파우더 따위를 넣고 틀을 사용하여 오븐에 구워 낸 음식.'
];

final List<String> entries3 = <String>[
  '1',
  '2',
  '3',
  '4',
  '5',
  '6',
  '7',
  '8',
  '9',
  '10'
];

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
  'assets/images/spoon.png',
];

final Map<String, String> locationTypeToString = {
  "ko": "한식",
  "ch": "중식",
  "am": "양식",
  "ja": "일식",
};

class Next extends StatefulWidget {
  Next({Key key}) : super(key: key);
  @override
  _NextState createState() => _NextState();
}

class _NextState extends State<Next> {
  Container taskList(
      String title, String description, IconData iconImg, Color inconColor) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Row(
        children: <Widget>[
          Icon(
            iconImg,
            color: inconColor,
            size: 30,
          ),
          Container(
            padding: EdgeInsets.only(left: 10, right: 10),
            width: MediaQuery.of(context).size.width * 0.8,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(title,
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white)),
                SizedBox(
                  height: 10,
                ),
                Text(description,
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.white,
                        fontWeight: FontWeight.normal))
              ],
            ),
          )
        ],
      ),
    );
  }

  CalendarController _controller;
  TextStyle dayStyle(FontWeight fontWeight) {
    return TextStyle(color: Color(0xff30384c), fontWeight: fontWeight);
  }

  String currentLocation;
  int _currentPageIndex = 0;
  @override
  void initState() {
    super.initState();
    _currentPageIndex = 0;
    _controller = CalendarController();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyWidget(),
      bottomNavigationBar: _bottomNavigationWidget(),
      appBar: AppBar(
        title: Image.asset('assets/images/appbar6.PNG'),
        backgroundColor: Color(0xFFCCCC99),
        centerTitle: true,
        elevation: 0.0,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage('assets/images/cook.PNG'),
                backgroundColor: Colors.white,
              ),
              accountName: Text('김종성'),
              accountEmail: Text('miaer789@naver.com'),
              decoration: BoxDecoration(
                color: Color(0xFFCCCC99),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40.0),
                  bottomRight: Radius.circular(40.0),
                ),
              ),
            ),
            ListTile(
                leading: Icon(
                  Icons.money,
                  color: Colors.grey[850],
                ),
                title: Text('이번달 예산'),
                onTap: () {
                  print('쌉싸름한 레시피');
                }),
            ListTile(
                leading: Icon(
                  Icons.settings,
                  color: Colors.grey[850],
                ),
                title: Text('설정'),
                onTap: () {
                  print('쌉싸름한 레시피');
                }),
            ListTile(
                leading: Icon(
                  Icons.call,
                  color: Colors.grey[850],
                ),
                title: Text('고객센터'),
                onTap: () {
                  print('010-2248-4124');
                }),
          ],
        ),
      ),
    );
  }

  Widget _bodyWidget() {
    switch (_currentPageIndex) {
      case 0:
        body:
        return ListView.separated(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          itemBuilder: (BuildContext _context, int index) {
            return Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    child: Image.asset(
                      entries4[index], // entrie 인덱스 내부를 다 불러옴
                      width: 90,
                      height: 90,
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 80,
                      padding: const EdgeInsets.only(left: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${entries[index]}',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              fontSize: 17,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '${entries2[index]}',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: Colors.black.withOpacity(0.3),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 1),
                                ),
                                SvgPicture.asset(
                                  'aseets/svg/heart_off.svg',
                                  width: 13,
                                  height: 13,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.favorite_outlined,
                                  size: 15,
                                ),
                                Text('좋아요 : ${entries3[index]}'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          },
          itemCount: entries.length,
          separatorBuilder: (BuildContext _context, int index) {
            return Container(
              height: 1,
              color: Colors.black.withOpacity(0.4),
            );
          },
        );
        break;
      case 1:
        return Container(
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                SizedBox(
                  height: 30,
                ),
                TableCalendar(
                  startingDayOfWeek: StartingDayOfWeek.monday,
                  calendarStyle: CalendarStyle(
                    weekdayStyle: dayStyle(FontWeight.normal),
                    weekendStyle: dayStyle(FontWeight.normal),
                    selectedColor: Colors.lightGreen,
                    todayColor: Colors.lightGreen,
                  ),
                  daysOfWeekStyle: DaysOfWeekStyle(
                      weekendStyle: TextStyle(
                          color: Color(0xff30384c),
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                      weekdayStyle: TextStyle(
                          color: Color(0xff30384c),
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                      dowTextBuilder: (date, locale) {
                        return DateFormat.E(locale)
                            .format(date)
                            .substring(0, 1);
                      }),
                  headerStyle: HeaderStyle(
                      formatButtonVisible: false,
                      titleTextStyle: TextStyle(
                        color: Color(0xff30384c),
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      leftChevronIcon: Icon(
                        Icons.chevron_left,
                        color: Color(0xff30384c),
                      ),
                      rightChevronIcon: Icon(
                        Icons.chevron_right,
                        color: Color(0xff30384c),
                      )),
                  calendarController: _controller,
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  padding: EdgeInsets.only(left: 30),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular((50)),
                          topRight: Radius.circular(50)),
                      color: Color(0xff30384c)),
                  child: Stack(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.only(top: 50),
                            child: Text(
                              "Today",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                          taskList(
                              "대파",
                              "2,980원",
                              CupertinoIcons.check_mark_circled_solid,
                              Color(0xff00cf8d)),
                          taskList(
                              "양파",
                              "2,500원",
                              CupertinoIcons.check_mark_circled_solid,
                              Color(0xff00cf8d)),
                          taskList(
                              "다진마늘",
                              "3,000원",
                              CupertinoIcons.check_mark_circled_solid,
                              Color(0xff00cf8d)),
                          taskList(
                              "팽이버섯",
                              "2,700원",
                              CupertinoIcons.check_mark_circled_solid,
                              Color(0xff00cf8d)),
                        ],
                      ),
                      Positioned(
                        bottom: 0,
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                        child: Container(
                          decoration: BoxDecoration(
                              gradient: LinearGradient(
                                  begin: FractionalOffset.topCenter,
                                  end: FractionalOffset.bottomCenter,
                                  colors: [
                                Color(0xff30384c).withOpacity(0),
                                Color(0xff30384c)
                              ],
                                  stops: [
                                0.0,
                                1.0
                              ])),
                        ),
                      ),
                      Positioned(
                        bottom: 40,
                        right: 20,
                        child: Column(
                          children: [
                            ButtonTheme(
                                child: RaisedButton(
                              color: Color(0xff30384c),
                              elevation: 0.0,
                              child: Icon(
                                Icons.add_circle_outline_outlined,
                                color: Colors.white,
                                size: 55.0,
                              ),
                              onPressed: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          TodoListPage())),
                            ))
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
        break;
      case 3:
        return Body();
        break;
    }
    return Board();
  }

  BottomNavigationBarItem _bottomNavigationBarItem(
      String iconName, String label) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(
        "assets/svg/${iconName}_off.svg",
        width: 22,
      ),
      activeIcon: Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: SvgPicture.asset(
            "assets/svg/${iconName}_on.svg",
            width: 22,
          )),
      label: label,
    );
  }

  Widget _bottomNavigationWidget() {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentPageIndex,
      onTap: (index) {
        setState(() {
          _currentPageIndex = index;
        });
      },
      selectedItemColor: Colors.black,
      selectedLabelStyle: TextStyle(color: Colors.black),
      items: [
        _bottomNavigationBarItem("home", "홈"),
        _bottomNavigationBarItem("calendar", "캘린더"),
        _bottomNavigationBarItem("chat", "커뮤니티"),
        _bottomNavigationBarItem("user", "내 정보"),
      ],
    );
  }
}
