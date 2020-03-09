import 'package:flutter/material.dart';
import 'package:hackathon/widget/custom_paint.dart';
import "package:local_auth/local_auth.dart";
import 'dart:async';

class SendPage extends StatefulWidget {
  @override
  _SendPageState createState() => _SendPageState();
}

class _SendPageState extends State<SendPage> {
  bool isAuthenticated  = false;
  bool isLoading = false;
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
  final formKey = GlobalKey<FormState>();
  String _accountValidator(String value) {
    //var reg = RegExp(r"0-9");
    if (int.tryParse(value) == null) {
      return "nuban can only contain numbers";
    } else if (value.length != 10) {
      return "too short";
    }
    return null;
  }
   String _amountValidator(String value) {
    //var reg = RegExp(r"0-9");
    if (int.tryParse(value) == null) {
      return "amount can only contain numbers";
    } 
   
    return null;
  }
   String _otpValidator(String value) {
    //var reg = RegExp(r"0-9");
    if (int.tryParse(value) == null) {
      return "amount can only contain numbers";
    } 
   
    return null;
  }
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
     double width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: <Widget>[
          CustomPaintDemo(height),
          Form(
            key: formKey,
                      child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: ListView(children: <Widget>[
                SizedBox(height:20,),
                TextFormField(
                  keyboardType: TextInputType.number,
                  maxLength: 10,
                  validator: _accountValidator,
                  style: TextStyle(color: Colors.white,fontSize: 20),
                    decoration: InputDecoration(
                      labelText: "account no",
                    //  hintText: "account number",
                      fillColor: Colors.white,
                      focusColor: Colors.white,
                      hintStyle: TextStyle(color: Colors.white),
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                         borderSide: BorderSide(color: Colors.white)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(20)
                      )

                    ),
                ),
                SizedBox(height:10),
               TextFormField(
                  keyboardType: TextInputType.number,
                 validator: _amountValidator,
                  style: TextStyle(color: Colors.white,fontSize: 20),
                  maxLength: 8,
                    decoration: InputDecoration(
                      labelText: "amount",
                    //  hintText: "amount",
                      fillColor: Colors.white,
                      focusColor: Colors.white,
                      hintStyle: TextStyle(color: Colors.white),
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                         borderSide: BorderSide(color: Colors.white)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(20)
                      )

                    ),
                ),
                SizedBox(height: 20,),
                TextFormField(
                   keyboardType: TextInputType.number,
                  maxLength: 8,
                  validator: _otpValidator,
                  style: TextStyle(color: Colors.white,fontSize: 20),
                    decoration: InputDecoration(
                      labelText: "OTP",
                     // hintText: "OTP",
                      fillColor: Colors.white,
                      focusColor: Colors.white,
                      hintStyle: TextStyle(color: Colors.white),
                      labelStyle: TextStyle(color: Colors.white),
                      enabledBorder: OutlineInputBorder(
                         borderSide: BorderSide(color: Colors.white)
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.circular(20)
                      )

                    ),
                ),
               SizedBox(height: 10,),
               Container(width:width/2,
               child: RaisedButton(
                    color: Colors.white,
                    padding: EdgeInsets.all(20),
                    shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)),
                  onPressed: ()async{
                    if(formKey.currentState.validate()){
                      isAuthenticated =await _authenticate();
                    if(isAuthenticated){
                      setState((){
                        isLoading = true;
                      });
                        await Future.delayed(Duration(milliseconds: 1000));
                        setState(() {
                       isLoading =   false;
                        });
                        showDialog(context: context, barrierDismissible: false,
                        builder: (context){
                          return AlertDialog(
                            content: 
                                Text("Transfer done sucessfully",style: TextStyle(color:Colors.purple),),
                              actions: <Widget>[
                                    FlatButton(
                                      child: Text("Ok",style: TextStyle(color:Colors.purple),),
                                      onPressed: (){
                                        Navigator.pop(context);
                                      },
                                    )
                              ],
                          );
                        }
                        );
                    }
                    }
                   
                  },
                    child: Text("Send", style:TextStyle(color: Colors.purple,fontSize: 20)),
               ),
               ),
               isLoading ? Center(child: CircularProgressIndicator(backgroundColor: Colors.white,
               valueColor: AlwaysStoppedAnimation(Colors.purple),),): SizedBox.shrink()
              ],),
            ),
          )
        ],
      ),
    );
  }
}