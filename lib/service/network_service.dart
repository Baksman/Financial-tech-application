import 'dart:convert';

import 'package:hackathon/constant.dart';
import 'package:http/http.dart' as http;
import "dart:convert" as convert;

class ApiService {

   Future<void> getData() async {
   
    try {
      //https://sandboxapi.fsi.ng/atlabs/messaging
      final message = convert.jsonEncode(
          {'to': '+2347030467685', 'from': 'FSI', "message": "Baksman"});
      http.Response uriResponse = await http.post(
          'https://sandboxapi.fsi.ng/atlabs/messaging',
          headers: {"Content-Type": "application/json", "Sandbox-Key": API_KEY},
          body: message);
      var jsonResponse = convert.jsonDecode(uriResponse.body);
      print("$jsonResponse");
      print("yeah baksman");
      print(uriResponse.statusCode.toString());
       print(uriResponse.headers);
      if (uriResponse.statusCode == 200) {
       print("succes");
      }
    } catch (e) {
      print("error ocure");
      print(e.toString());
    } finally {
      //client.close();
    }
  }
 encrypter() {
    String orgCode = "1996";
    List<int> bytes = utf8.encode(orgCode);
    var encoded = base64.encode(bytes);
    return encoded;
  }
   Future<void>login() async {
    
    print("Heyyyy");
    var value = encrypter();
    print(value);
    try {
      //https://sandboxapi.fsi.ng/atlabs/messaging
      http.Response uriResponse = await http.post(
          'https://sandboxapi.fsi.ng/nibss/bvnr/Reset',
          headers: {"OrganisationCode": value, "Sandbox-Key": API_KEY},
         // body: {'name': 'doodle', 'color': 'blue'}
          );
          print("yeah baksman");
          print(uriResponse.headers);
      if (uriResponse.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(uriResponse.body);
        print("hey ibrahim");
        print(jsonResponse["Ivkey"] ?? "");
        print(jsonResponse["Aes_Key"] ?? "");
        print(jsonResponse["Password"] ?? "");
        print(jsonResponse["Ivkey"] ?? "");
        print("end");
      }

    } catch(e){
      print("error ocurred");
      print(e.toString());
    }
    finally {
      //client.close();
    }
  }



 

}
