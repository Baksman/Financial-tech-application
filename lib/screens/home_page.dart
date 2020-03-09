import 'dart:convert';
import "package:hackathon/service/network_service.dart";
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackathon/screens/main_screen.dart';
import 'package:hackathon/widget/custom_paint.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ApiService apiService = ApiService();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(children: <Widget>[
        CustomPaintDemo(height),
        Form(
          key: formKey,
          child: Container(
            padding: EdgeInsets.all(20),
            child: ListView(
        //  crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Text("Welcome to",
                  style: TextStyle(color: Colors.white, fontSize: 30)),
              Text("Koncepted bank",
                  style: TextStyle(color: Colors.white, fontSize: 30)),
              SizedBox(
                height: 30,
              ),
              Container(
                padding: EdgeInsets.all(20),
                height: height / 2 + 40,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 10),
                    TextFormField(
                      maxLength: 11,
                      validator: _bvnValidator,
                      style: TextStyle(color: Colors.purple),
                      cursorColor: Colors.purple,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
            hintText: "BVN",
            contentPadding: EdgeInsets.all(10),
            focusColor: Colors.purple,
            fillColor: Colors.purple),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextFormField(
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      validator: _accountValidator,
                      style: TextStyle(color: Colors.purple),
                      cursorColor: Colors.purple,
                      decoration: InputDecoration(
            hintText: "Account number",
            contentPadding: EdgeInsets.all(10),
            focusColor: Colors.purple,
            fillColor: Colors.purple),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: <Widget>[
                        CupertinoSwitch(
              activeColor: Colors.purple,
              value: true,
              onChanged: (_) {}),
                        SizedBox(width: 10),
                        Text(
            "Save agency and account",
            style: TextStyle(color: Colors.grey),
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Container(
                      width: width / 2,
                      child: RaisedButton(
                        shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)),
                        color: Colors.purple,
                        padding: EdgeInsets.all(15),
                        // onPressed: (){
                        //   Navigator.push(context,PageTransition(type:PageTransitionType.rightToLeftWithFade,child:MainPage()));
                        // },
                        onPressed: _submit,
                        child: Text(
            "Submit",
            style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                      ),
                    )
                  ],
                ),
              )
          ],
              ),
          ),
        )
      ]),
    );
  }

  String _bvnValidator(String value) {
    //var reg = RegExp(r"0-9");
    if (int.tryParse(value) == null) {
      return "BVN can only contain numbers";
    } else if (value.length != 11) {
      return "too short";
    }
    return null;
  }

  String _accountValidator(String value) {
    //var reg = RegExp(r"0-9");
    if (int.tryParse(value) == null) {
      return "nuban can only contain numbers";
    } else if (value.length != 10) {
      return "too short";
    }
    return null;
  }

  _submit() {
    if (formKey.currentState.validate()) {
      print("validated");
      Navigator.push(
          context,
          PageTransition(
              type: PageTransitionType.rightToLeftWithFade, child: MainPage()));
    }
  }
}
