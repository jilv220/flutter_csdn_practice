import 'package:flutter/material.dart';
import 'package:flutter_app/widgets/NameCardWidget.dart';

class StarFragment extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return StarFragmentState();
  }
}

class StarFragmentState extends State<StarFragment> {
  // dummy data
  int num = 0;
  double baseTop = 240;

  bool isStar1;
  String starState1 = "关注";
  TextStyle starStyleState1 = TextStyle(
    color: Colors.red,
  );

  bool isStar2;
  String starState2 = "关注";
  TextStyle starStyleState2 = TextStyle(
    color: Colors.red,
  );

  bool isStar3;
  String starState3 = "关注";
  TextStyle starStyleState3 = TextStyle(
    color: Colors.red,
  );

  @override
  void initState() {
    super.initState();
    isStar1 = false;
    isStar2 = false;
    isStar3 = false;
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: 60,
              ),
              Image.asset("assets/Images/Monkey.png", scale: 2.5),
              Container(height: 40),
              Text("赶快去关注你心中的大牛吧",
                  style: TextStyle(fontSize: 15, color: Colors.grey)),
              Container(
                height: 60,
              ),
              NameCardWidget(
                  height: 150,
                  width: 205,
                  name: "JOJO",
                  nameExt: " $num篇",
                  nameExtStyle: TextStyle(color: Colors.blue),
                  namePadding: 40,
                  title: "架构师",
                  titleStyle: TextStyle(color: Colors.grey, fontSize: 12),
                  titlePadding: 8,
                  buttonText: starState1,
                  buttonTextStyle: starStyleState1,
                  buttonPadding: EdgeInsets.fromLTRB(64, 10, 64, 0),
                  shapeBorder: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey, width: 0.2),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.2)),
                  onPressed: () {
                    setState(() {
                      //switch state

                      if (!isStar1) {
                        isStar1 = !isStar1;
                        starState1 = "已关注";
                        starStyleState1 = TextStyle(color: Colors.grey);
                      } else {
                        isStar1 = !isStar1;
                        starState1 = "关注";
                        starStyleState1 = TextStyle(color: Colors.red);
                      }
                    });
                  }),
              Container(
                height: 30,
              ),
              NameCardWidget(
                  height: 150,
                  width: 205,
                  name: "DIO",
                  nameExt: " $num篇",
                  nameExtStyle: TextStyle(color: Colors.blue),
                  namePadding: 40,
                  title: "架构师",
                  titleStyle: TextStyle(color: Colors.grey, fontSize: 12),
                  titlePadding: 8,
                  buttonText: starState2,
                  buttonTextStyle: starStyleState2,
                  buttonPadding: EdgeInsets.fromLTRB(64, 10, 64, 0),
                  shapeBorder: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey, width: 0.2),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.2)),
                  onPressed: () {
                    setState(() {
                      //switch state

                      if (!isStar2) {
                        isStar2 = !isStar2;
                        starState2 = "已关注";
                        starStyleState2 = TextStyle(color: Colors.grey);
                      } else {
                        isStar2 = !isStar2;
                        starState2 = "关注";
                        starStyleState2 = TextStyle(color: Colors.red);
                      }
                    });
                  }),
              Container(
                height: 30,
              ),
              NameCardWidget(
                  height: 150,
                  width: 205,
                  name: "Jotaro",
                  nameExt: " $num篇",
                  nameExtStyle: TextStyle(color: Colors.blue),
                  namePadding: 40,
                  title: "架构师",
                  titleStyle: TextStyle(color: Colors.grey, fontSize: 12),
                  titlePadding: 8,
                  buttonText: starState3,
                  buttonTextStyle: starStyleState3,
                  buttonPadding: EdgeInsets.fromLTRB(64, 10, 64, 0),
                  shapeBorder: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.grey, width: 0.2),
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.grey, width: 0.2)),
                  onPressed: () {
                    setState(() {
                      //switch state

                      if (!isStar3) {
                        isStar3 = !isStar3;
                        starState3 = "已关注";
                        starStyleState3 = TextStyle(color: Colors.grey);
                      } else {
                        isStar3 = !isStar3;
                        starState3 = "关注";
                        starStyleState3 = TextStyle(color: Colors.red);
                      }
                    });
                  }),
              Container(
                height: 30,
              ),
            ],
          ),
          Positioned(
            child: Container(
                height: 60,
                width: 60,
                child: CircleAvatar(
                    backgroundImage: AssetImage("assets/Images/Jojo.jpg"))),
            left: 174,
            top: baseTop,
          ),
          Positioned(
            child: Container(
                height: 60,
                width: 60,
                child: CircleAvatar(
                    backgroundImage: AssetImage("assets/Images/Dio.jpg"))),
            left: 174,
            top: baseTop + 180,
          ),
          Positioned(
            child: Container(
                height: 60,
                width: 60,
                child: CircleAvatar(
                    backgroundImage: AssetImage("assets/Images/Jotaro.jpg"))),
            left: 174,
            top: baseTop + 360,
          ),
        ],
      ),
    );
  }
}
