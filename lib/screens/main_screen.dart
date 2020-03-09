import 'package:flutter/material.dart';
//import 'package:hackathon/screens/finger_print.dart';
import 'package:hackathon/service/network_service.dart';
import 'package:hackathon/widget/custom_paint.dart';
import 'package:local_auth/local_auth.dart';
import 'package:page_transition/page_transition.dart';
import 'package:sliding_up_panel/src/panel.dart';
import 'airtime_screen.dart';
//import 'package:sliding_sheet/sliding_sheet.dart';
import 'send_page.dart';
class MainPage extends StatefulWidget {
  MainPage({Key key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isPinVisible = true;
  bool isLockVisible = true;
   _authenticate() async {
    try {
      var localAuth = LocalAuthentication();
      bool didAuthenticate = await localAuth.authenticateWithBiometrics(
          localizedReason: 'Please authenticate to show account balance',
          useErrorDialogs: true);
         if(didAuthenticate){
           return true;
         }
         return false;
    } catch (e) {
      print(e);
      return false;
    }
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(children: [
        CustomPaintDemo(height),
        Container(
          padding: EdgeInsets.all(10),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
                width: double.infinity,
                padding: EdgeInsets.all(20),
                height: 220,
                decoration: BoxDecoration(
                    boxShadow: [BoxShadow(color: Colors.red)],
                    color: Color(0xFF652A78),
                    borderRadius: BorderRadius.circular(20)),
                child: Column(children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "N48,474.33",
                    style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF99D5E5)),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  // Text("****   *****   *****  4556")
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Text(
                        isPinVisible ? "****" : "4546",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF99D5E5)),
                      ),
                      Text(
                        isPinVisible ? "****" : "8895",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF99D5E5)),
                      ),
                      Text(
                        isPinVisible ? "****" : "9594",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF99D5E5)),
                      ),
                      Text(
                        "3884",
                        style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF99D5E5)),
                      ),
                    ],
                  ),
                ])),
            SizedBox(
              height: 12,
            ),
            Text(
              "Quick command",
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        print("called");
                        setState(() {
                          isPinVisible = !isPinVisible;
                          print(isPinVisible);
                        });
                      },
                      child: Container(
                          height: 60,
                          width: 60,
                          child: Center(
                              child: Icon(
                            isPinVisible
                                ? Icons.visibility
                                : Icons.visibility_off,
                            color: Colors.purple,
                          )),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white)),
                    ),
                    //SizedBox(height: 10,),
                    Text(
                      "Show pin",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          isLockVisible = !isLockVisible;
                        });
                      },
                      child: Container(
                          height: 60,
                          width: 60,
                          child: Center(
                              child: Icon(
                            isLockVisible ? Icons.lock : Icons.lock_open,
                            color: Colors.purple,
                            size: 30,
                          )),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white)),
                    ),
                    Text(
                      "Lock Card",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        ApiService().getData();
                      },
                      child: Container(
                          height: 60,
                          width: 60,
                          child: Center(
                              child: Icon(
                            Icons.data_usage,
                            color: Colors.purple,
                            size: 30,
                          )),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: Colors.white)),
                    ),
                    Text(
                      "Limit",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                )
              ],
            )
          ]),
          color: Colors.transparent,
        ),
        SlidingUpPanel(
          minHeight: height / 5,
          maxHeight: height - 50,
          backdropOpacity: 0,
          panel: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.arrow_drop_up,
                  color: Colors.black,
                ),
                ListTile(
                  
                  leading: Icon(
                    Icons.send,
                    color: Colors.purple,
                  ),
                  title: Text(
                    "Check balance",
                    style: TextStyle(color: Colors.purple, fontSize: 20),
                  ),
                ),
                ListTile(
                   onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeftWithFade,
                            child: SendPage())
                            );
                  },
                  leading: Icon(
                    Icons.send,
                    color: Colors.purple,
                  ),
                  title: Text(
                    "Transfer money",
                    style: TextStyle(color: Colors.purple, fontSize: 20),
                  ),
                ),
                Divider(),
                ListTile(
                  onTap: (){
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeftWithFade,
                            child: Airtime())
                            );
                  },
                  leading: Icon(
                    Icons.send,
                    color: Colors.purple,
                  ),
                  title: Text(
                    "Buy airtime",
                    style: TextStyle(color: Colors.purple, fontSize: 20),
                  ),
                ),
                Divider(),
                ListTile(
                   onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.rightToLeftWithFade,
                            child: SendPage())
                            );
                  },
                  leading: Icon(
                    Icons.send,
                    color: Colors.purple,
                  ),
                  title: Text(
                    "Pay bills",
                    style: TextStyle(color: Colors.purple, fontSize: 20),
                  ),
                ),
              
                Divider(),
              ],
            ),
          ),
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(10), topLeft: Radius.circular(10)),
        )
      ]),
    );
  }
}
