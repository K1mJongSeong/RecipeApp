import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'next.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'First app',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[600],
      appBar: AppBar(
        title: Image.asset(
          'assets/images/appbar.jpg',
          fit: BoxFit.cover,
          width: 500,
        ),
        backgroundColor: (Color(0xFFF8CD53)),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: Builder(
        builder: (context) {
          return GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: SingleChildScrollView(
              padding: EdgeInsets.fromLTRB(30.0, 40.0, 0.0, 0.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Center(
                    child: CircleAvatar(
                      backgroundImage: AssetImage('assets/images/muffin2.PNG'),
                      radius: 70.0,
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Form(
                    child: Theme(
                      data: ThemeData(
                          primaryColor: Colors.teal,
                          inputDecorationTheme: InputDecorationTheme(
                              labelStyle: TextStyle(
                                  color: Colors.teal, fontSize: 15.0))),
                      child: Container(
                        padding: EdgeInsets.all(40.0),
                        child: Column(
                          children: <Widget>[
                            TextField(
                              controller: controller,
                              decoration: InputDecoration(labelText: 'ID'),
                              keyboardType: TextInputType.emailAddress,
                            ),
                            TextField(
                              controller: controller2,
                              decoration: InputDecoration(labelText: 'PW'),
                              keyboardType: TextInputType.text,
                              obscureText: true,
                            ),
                            SizedBox(
                              height: 40.0,
                            ),
                            ButtonTheme(
                                minWidth: 300.0,
                                height: 50.0,
                                child: RaisedButton(
                                    color: Colors.orangeAccent,
                                    child: Icon(
                                      Icons.check,
                                      color: Colors.white,
                                      size: 35.0,
                                    ),
                                    onPressed: () {
                                      if (controller.text == 'Recipe' &&
                                          controller2.text == 'rlawhdtjd') {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder:
                                                    (BuildContext context) =>
                                                        Next()));
                                      } else if (controller.text == 'Recipe' &&
                                          controller2.text != 'rlawhdtjd') {
                                        showSnackBar2(context);
                                      } else if (controller.text != 'Recipe' &&
                                          controller2.text == 'rlawhdtjd') {
                                        showSnackBar3(context);
                                      } else {
                                        showSnackBar(context);
                                      }
                                    })),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

void showSnackBar(BuildContext context) {
  Scaffold.of(context).showSnackBar(SnackBar(
    content: Text(
      '로그인 정보를 확인하세요.',
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.blue,
  ));
}

void showSnackBar2(BuildContext context) {
  Scaffold.of(context).showSnackBar(SnackBar(
    content: Text(
      '로그인 정보를 확인하세요.',
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.blue,
  ));
}

void showSnackBar3(BuildContext context) {
  Scaffold.of(context).showSnackBar(SnackBar(
    content: Text(
      '로그인 정보를 확인하세요.',
      textAlign: TextAlign.center,
    ),
    duration: Duration(seconds: 2),
    backgroundColor: Colors.blue,
  ));
}
