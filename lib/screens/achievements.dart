import 'package:athletics_app/screens/userinfo.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'achievements.dart';
import 'homescreen.dart';
import 'leaderboard.dart';
import 'memberScreen.dart';
import 'members.dart';

class Achievement extends StatefulWidget {
  @override
  _AchievementState createState() => _AchievementState();
}

class _AchievementState extends State<Achievement> {
  int _currentindex = 0;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xFF143B40),
          title: Text(


            'Achievement',

            style: TextStyle(
              fontSize: 30,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          leading: FlatButton(
            onPressed: () {
              Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => new HomeScreen()),
              );
            },
            child: Icon(
              Icons.arrow_back_sharp,
              size: 30,
              color: Colors.white,
            ),
          ),
          actions: [
            IconButton(
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context) => new MemberInfo()),
                );
              },
              icon: Icon(
                Icons.account_circle,
                color: Colors.white,
                size: 30,
              ),
            ),
          ],
        ),
        bottomNavigationBar: Theme(
          data: Theme.of(context).copyWith(
              canvasColor: Color.fromRGBO(255, 255, 255, 255),
              primaryColor: Colors.red,
              textTheme: Theme.of(context)
                  .textTheme
                  .copyWith(caption: TextStyle(color: Colors.black))),
          child: Container(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: BottomNavigationBar(
                showSelectedLabels: false,
                showUnselectedLabels: false,
                currentIndex: 0,
                items: [
                  BottomNavigationBarItem(
                    icon: Padding(
                      padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                      child: IconButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            new MaterialPageRoute(
                                builder: (context) => new HomeScreen()),
                          );
                        },
                        icon: Icon(Icons.home),
                        color: Colors.white,
                        iconSize: 30,
                      ),
                    ),

                    backgroundColor: Color(0xFF143B40),
                    // ignore: deprecated_member_use
                    title: Text(''),
                  ),
                  BottomNavigationBarItem(
                    icon: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new Leaderboard()),
                        );
                      },
                      icon: Icon(Icons.leaderboard),
                      color: Colors.white,
                      iconSize: 30,
                    ),
                    // ignore: deprecated_member_use
                    title: Text(''),
                  ),
                  BottomNavigationBarItem(
                    icon: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new Achievement()),
                        );
                      },
                      icon: Icon(Icons.emoji_events_rounded),
                      color: Colors.white,
                      iconSize: 30,
                    ),

                    // ignore: deprecated_member_use
                    title: Text(''),
                  ),
                  BottomNavigationBarItem(
                    icon: IconButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          new MaterialPageRoute(
                              builder: (context) => new Members()),
                        );
                      },
                      icon: Icon(Icons.group_rounded),
                      color: Colors.white,
                      iconSize: 30,
                    ),
                    // ignore: deprecated_member_use
                    title: Text(''),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage("assets/athlete.jpeg"), fit: BoxFit.fill),
          ),
          child: StreamBuilder(
            stream: Firestore.instance.collection('achievements').snapshots(),
            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot){
              if(!snapshot.hasData)
                return Center( child: CircularProgressIndicator(),
                );
              return Center(
                child: ListView(
                  //child: Column(
                  children: [
                    Container(
                      width: 350,
                      height: 190,
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Color(0xFF143B40),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                          children: [
                            Text(snapshot.data.documents[0]['TITLE'],
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(snapshot.data.documents[0]['DESCRIPTION'],
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(snapshot.data.documents[0]['RECORDS'],
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(snapshot.data.documents[0]['RECORDS 1'],
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ]
                      ),
                    ),
                    Container(
                      width: 350,
                      height: 312,
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Color(0xFF143B40),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                          children: [
                            Text(snapshot.data.documents[1]['TITLE'],
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(snapshot.data.documents[1]['DESCRIPTION'],
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(snapshot.data.documents[1]['RECORDS'],
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(snapshot.data.documents[1]['OUTPUT'],
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(snapshot.data.documents[1]['RECORDS 1'],
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(snapshot.data.documents[1]['OUTPUT 1'],
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white
                              ),
                            ),
                          ]
                      ),
                    ),
                    Container(
                      width: 350,
                      height: 240,
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Color(0xFF143B40),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                          children: [
                            Text(snapshot.data.documents[2]['TITLE'],
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(snapshot.data.documents[2]['DESCRIPTION'],
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(snapshot.data.documents[2]['RECORDS'],
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(snapshot.data.documents[2]['RECORDS 1'],
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ]
                      ),
                    ),
                    Container(
                      width: 350,
                      height: 210,
                      margin: EdgeInsets.all(10),
                      padding: EdgeInsets.all(15),
                      decoration: BoxDecoration(
                          color: Color(0xFF143B40),
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Column(
                          children: [
                            Text(snapshot.data.documents[3]['TITLE'],
                              style: TextStyle(
                                  fontSize: 20,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 15),
                            Text(snapshot.data.documents[3]['DESCRIPTION'],
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.white
                              ),
                            ),
                            SizedBox(height: 20),
                            Text(snapshot.data.documents[3]['RECORDS'],
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(snapshot.data.documents[3]['RECORDS 1'],
                              style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ]
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
