import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'orderDetails.dart';
import 'preference.dart';
import 'Preferences/main.dart';
import 'tagPage.dart';
import 'package:http/http.dart' as http;

class LandingPage extends StatefulWidget {
static String tag="landing-Page";
  @override
 State<StatefulWidget> createState() {
    return new LandingPageState();
  }
 
}
class LandingPageState extends State<LandingPage>{
   
  void clickOrder(){
  Navigator.of(context).pushNamed(Preferences.tag);
  }
  void clickTag(){
    Navigator.of(context).pushNamed(TagPage.tag);
  }

  Future<String> getPnrDetails() async{
    http.Response response = await http.get(
      Uri.encodeFull("http://businesstravel20180603032656.azurewebsites.net/api/Values"),
      headers:{
        "Accept" : "application/json"
      }
    );
    print(response.body);
  }
  void clickDStore(){
    getPnrDetails();
    Navigator.of(context).pushNamed(OrderDetails.tag);
  }
 @override
  Widget build(BuildContext context) {
      final logo = Hero(
        tag: "tcsLogo",
        child: CircleAvatar(backgroundColor: Colors.transparent, radius: 50.0, child: Image.asset('assets/logo.png'),
        ),
      );

      final orderButton = Padding(
        padding: EdgeInsets.symmetric(vertical:16.0,),
        child: Material(
            borderRadius:  BorderRadius.circular(18.0),
            shadowColor: Colors.lightBlueAccent.shade100,
            elevation: 5.0,
            child: MaterialButton(
              minWidth: 200.0,
              height: 42.0,
              onPressed: (){
                Navigator.of(context).pushNamed(MyPreferences.tag);
              },
              color: Colors.lightBlueAccent,
              child: Text('Orders', style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold)),
              ),
        ),

      );

final tagButton = Padding(
        padding: EdgeInsets.symmetric(vertical:16.0,),
        child: Material(
            borderRadius:  BorderRadius.circular(18.0),
            shadowColor: Colors.lightBlueAccent.shade100,
            elevation: 5.0,
            child: MaterialButton(
              minWidth: 200.0,
              height: 42.0,
              onPressed: (){
                Navigator.of(context).pushNamed(TagPage.tag);
              },
              color: Colors.lightBlueAccent,
              child: Text('Tag', style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold)),
              ),
        ),

      );

final dStoreButton = Padding(
        padding: EdgeInsets.symmetric(vertical:16.0,),
        child: Material(
            borderRadius:  BorderRadius.circular(18.0),
            shadowColor: Colors.lightBlueAccent.shade100,
            elevation: 5.0,
            child: MaterialButton(
              minWidth: 200.0,
              height: 42.0,
              onPressed: (){
                clickDStore();
                
               },
              color: Colors.lightBlueAccent,
              child: Text('D Store', style: TextStyle(color: Colors.white, fontSize: 30.0, fontWeight: FontWeight.bold)),
              ),
        ),

      );
  
    var listView = new ListView();
    var drawer = new Drawer();
    return new Scaffold( // 1
    drawer: drawer,
      appBar: new AppBar(
      title: new Text("Business Travel Supporting System"), // screen title,
      ),
    body: Center(
      child: ListView(
        shrinkWrap: true,
        padding: EdgeInsets.only(left: 24.0, right:24.0),
        children: <Widget>[
          logo, 
          SizedBox(height: 48.0),
          orderButton,
          SizedBox(height: 48.0),
          tagButton,
          SizedBox(height: 48.0),
          dStoreButton,
        ],
      )
    ),
    );
  }
}
void orderDetailsClick(BuildContext context){
  Navigator.of(context).pushNamed('/OrderDetails');
}




