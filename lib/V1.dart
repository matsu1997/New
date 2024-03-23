import 'dart:math';

import 'package:asaminew/Greeting.dart';
import 'package:asaminew/SignUp.dart';
import 'package:asaminew/StaffInfo.dart';
import 'package:asaminew/setting.dart';
import 'package:asaminew/Stamp.dart';
import 'package:asaminew/Ticket.dart';
import 'package:asaminew/setting.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'DateSelect.dart';
import 'News.dart';
import 'ResarvationA.dart';
import 'ShopInfo.dart';
import 'Stamp.dart';
import 'Ticket.dart';
import 'buy.dart';
import 'colum.dart';
import 'manage.dart';

class V1 extends StatefulWidget {
  @override
  State<V1> createState() => _V1State();
}

class _V1State extends State<V1> {
  var visible = true;
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
          title: Text("ホーム", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
          centerTitle: true,
          actions: <Widget>[
            Visibility(visible: visible,
              child: TextButton(
                  onPressed: () {  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Manege()),);},
                 child:Text("管理者画面", style: TextStyle(fontWeight: FontWeight.bold,))))
          ],
        ),
        body: Container(
            child: Stack(children: <Widget>[
              new Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(0.3),
                      BlendMode.dstATop,
                    ),
                    image: AssetImage("images/ベッド.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              new SingleChildScrollView(
                  child: Column(children: <Widget>[
                    Container(
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(top: 30),
                            child: Text(
                              "あさみ鍼灸ボディケアにようこそ",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[800]),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 30),
                            child: Text(
                              "当院は女性専用の治療院です",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[800]),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 30, bottom: 50),
                            child: Text(
                              "お気軽にご相談ください",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue[800]),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Container(
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment
                                    .spaceEvenly,
                                children: [
                                  Expanded(
                                      child: AspectRatio(
                                        aspectRatio: 1,
                                        child: Container(
                                          margin: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey),
                                            borderRadius: BorderRadius.circular(
                                                10),
                                            color: Colors.white,
                                          ),
                                          // alignment: Alignment.center,
                                          child: MaterialButton(
                                            textColor: Colors.black,
                                            // elevation: 8.0,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(""),
                                                  fit: BoxFit.fill,
                                                ),),
                                              child: Text("ご挨拶"),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Greeting()),);
                                            },
                                          ),
                                        ),)),
                                  Expanded(
                                      child: AspectRatio(
                                        aspectRatio: 1,
                                        child: Container(
                                          margin: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey),
                                            borderRadius: BorderRadius.circular(
                                                10),
                                            color: Colors.white,
                                          ),
                                          child: MaterialButton(
                                            textColor: Colors.black,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(""),
                                                  fit: BoxFit.fill,
                                                ),),
                                              child: Text("店舗情報"),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ShopInfo()),);
                                            },
                                          ),),)),
                                  Expanded(
                                      child: AspectRatio(
                                        aspectRatio: 1,
                                        child: Container(
                                          margin: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                                color: Colors.grey),
                                            borderRadius: BorderRadius.circular(
                                                10),
                                            color: Colors.white,
                                          ),
                                          child: MaterialButton(
                                            textColor: Colors.black,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                image: DecorationImage(
                                                  image: AssetImage(""),
                                                  fit: BoxFit.fill,
                                                ),),
                                              child: Text("コラム"),
                                            ),
                                            onPressed: () {
                                              Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Colum()),);
                                            },
                                          ),),)),
                                ],), Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceEvenly,
                                  children: [
                                    Expanded(
                                        child: AspectRatio(
                                          aspectRatio: 1,
                                          child: Container(
                                            margin: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey),
                                              borderRadius: BorderRadius
                                                  .circular(10),
                                              color: Colors.white,
                                            ),
                                            // alignment: Alignment.center,
                                            child: MaterialButton(
                                              textColor: Colors.black,
                                              // elevation: 8.0,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(""),
                                                    fit: BoxFit.fill,
                                                  ),),
                                                child: Text("物販"),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Buy()),);
                                              },
                                            ),
                                          ),)),
                                    Expanded(
                                        child: AspectRatio(
                                          aspectRatio: 1,
                                          child: Container(
                                            margin: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey),
                                              borderRadius: BorderRadius
                                                  .circular(10),
                                              color: Colors.white,
                                            ),
                                            child: MaterialButton(
                                              textColor: Colors.black,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(""),
                                                    fit: BoxFit.fill,
                                                  ),),
                                                child: Text("スタッフ\n紹介",textAlign: TextAlign.center,),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          StaffInfo()),);
                                              },
                                            ),),)),
                                    Expanded(
                                        child: AspectRatio(
                                          aspectRatio: 1,
                                          child: Container(
                                            margin: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey),
                                              borderRadius: BorderRadius
                                                  .circular(10),
                                              color: Colors.white,
                                            ),
                                            child: MaterialButton(
                                              textColor: Colors.black,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(""),
                                                    fit: BoxFit.fill,
                                                  ),),
                                                child: Text("チケット"),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Ticket()),);
                                              },
                                            ),),)),
                                  ],),), Container(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceEvenly,
                                  children: [
                                    Expanded(
                                        child: AspectRatio(
                                          aspectRatio: 1,
                                          child: Container(
                                            margin: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey),
                                              borderRadius: BorderRadius
                                                  .circular(10),
                                              color: Colors.white,
                                            ),
                                            // alignment: Alignment.center,
                                            child: MaterialButton(
                                              textColor: Colors.black,
                                              // elevation: 8.0,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(""),
                                                    fit: BoxFit.fill,
                                                  ),),
                                                child: Text("最新情報"),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          News()),);
                                              },
                                            ),
                                          ),)),
                                    Expanded(
                                        child: AspectRatio(
                                          aspectRatio: 1,
                                          child: Container(
                                            margin: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey),
                                              borderRadius: BorderRadius
                                                  .circular(10),
                                              color: Colors.white,
                                            ),
                                            child: MaterialButton(
                                              textColor: Colors.black,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(""),
                                                    fit: BoxFit.fill,
                                                  ),),
                                                child: Text("HP"),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ResarvationA()),);},
                                            ),),)),
                                    Expanded(
                                        child: AspectRatio(
                                          aspectRatio: 1,
                                          child: Container(
                                            margin: EdgeInsets.all(10),
                                            decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey),
                                              borderRadius: BorderRadius
                                                  .circular(10),
                                              color: Colors.white,
                                            ),
                                            child: MaterialButton(
                                              textColor: Colors.black,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(""),
                                                    fit: BoxFit.fill,
                                                  ),),
                                                child: Text("設定"),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Setting()),);
                                              },
                                            ),),))
                                  ],),),
                            ],)),
                    )
                  ]))
            ])));
  }
}