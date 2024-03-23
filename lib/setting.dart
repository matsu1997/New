
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Acount.dart';
import 'AcountEdite.dart';
import 'EditeBuy.dart';
import 'EditeColum.dart';
import 'Resarvation.dart';

class Setting extends StatefulWidget {
  @override
  State<Setting> createState() => _SettingState();
}
class _SettingState extends State<Setting> {
  @override
  void initState() {
    super.initState();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title:Text("設定",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Container(
            child: Stack(
                children: <Widget>[
                  new SingleChildScrollView(
                      child: Column(children: <Widget>[
                        Container(width: double.infinity,height: 60,
                          child:OutlinedButton.icon(icon: Icon(Icons.bookmarks),
                            label: Text('利用規約', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                            onPressed: () {  Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Acount()),);},),),
                        Container(width: double.infinity,height: 60,
                          child:OutlinedButton.icon(icon: Icon(Icons.bookmarks),
                            label: Text('プライバシーポリシー', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                            onPressed: () {  Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Resarvation()),);},),),
                        Container(width: double.infinity,height: 60,
                          child:OutlinedButton.icon(icon: Icon(Icons.person),
                            label: Text('アカウント情報', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                            onPressed: () {  Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => AcountEdite("","","")),);},),),
                        Container(width: double.infinity,height: 60,
                          child:OutlinedButton.icon(icon: Icon(Icons.mail),
                            label: Text('友達にアプリを教える', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),
                            onPressed: () {  Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => EditeColum()),);},),),
                      ]))

                ]))
    );
  }
}