import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Greeting extends StatefulWidget {
  @override
  State<Greeting> createState() => _GreetingState();
}

class _GreetingState extends State<Greeting> {
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
          title: Text(
            "ご挨拶",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Container(
            child: Stack(children: <Widget>[
              new Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    colorFilter: ColorFilter.mode(
                      Colors.white.withOpacity(0.5),
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
                      child: Container(
                          // height: 100,
                           width: 300,
                          margin: EdgeInsets.all(30),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white.withOpacity(1),),
                          child: Column(children: [
                            Container(
                                margin: EdgeInsets.all(20),
                                height: 120,width: 120,
                                decoration: new BoxDecoration(
                                    shape: BoxShape.circle,
                                    image: new DecorationImage(
                                      fit: BoxFit.fill,
                                      image: AssetImage("images/asami.png"),
                                    ))
                            ),
                            Container(child: Text("院長：金森明咲美",style: TextStyle(fontWeight: FontWeight.bold,),))])),
                    ),
                    Container(
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                              margin: EdgeInsets.all(5),
                              child: Text(
                                "「美」は内側から変える",
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.all(20),
                              child: Text(
                                "こんにちは。ビファイン下北沢本院、院長の藤本です。高校時代に、鍼治療に救われた経験と、その感動から、今こうして鍼で仕事をしています。中学当時、テニスの部活に入れ込んでいたのですが、練習のしすぎで腰を大きく痛めてしまい、整形外科医からは「今後競技としてテニスに取り組むことは難しい」と言われ絶望的な気分を味わいました。しかし、すがる思いで受診した鍼灸院で、劇的な回復があり、大学卒業までテニス競技を続けることができました。今でも本当に感謝しています。鍼は、一般的な整体よりも体の深部にアプローチする技術です。ですから、１回の施術でも、驚くような変化を体験できます。デスクワークの疲れでも、不眠症でもどんなカラダの悩みでも、悩んでいないでご相談ください。必ず「受診してよかった！」と思っていただけるはずです。",
                                style: TextStyle(
                                  // fontSize: 20,
                                    height: 2,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.grey),
                              ),
                            ),
                          ],
                        ),
                      ),
                    )
                  ]))
            ])));
  }
}

