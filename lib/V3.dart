//
// import 'dart:math';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
//
// class V3 extends StatefulWidget {
//   @override
//   State<V3> createState() => _V3State();
// }
// class _V3State extends State<V3> {
//   @override
//   void initState() {
//     super.initState();
//   }
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//   }
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           title:Text("",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),),
//           centerTitle: true,
//         ),
//         body: Container(
//             child: Column(children: <Widget>[
//               Expanded(
//                 child: Text(""),),
//               Container()
//             ])));
//   }
// }


import 'dart:math';

import 'package:asaminew/Message.dart';
import 'package:asaminew/V3Resarvation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Stamp.dart';
import 'Ticket.dart';


class V3 extends StatefulWidget {
  @override
  State<V3> createState() => _V3State();
}
class _V3State extends State<V3> {
  @override
  void initState() {
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title:Text("マイページ",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
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
                    fit: BoxFit.cover,),),),
              new Container(
                  child: Column(children: <Widget>[
                    SingleChildScrollView(
                      child: Container(
                          child: Column(
                            children: [
                              Container(
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
                                            child: MaterialButton(
                                              textColor: Colors.black,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(""),
                                                    fit: BoxFit.fill,
                                                  ),),
                                                child: Text("スタンプ"),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Stamp()),);
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
                                            child: MaterialButton(
                                              textColor: Colors.black,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  image: DecorationImage(
                                                    image: AssetImage(""),
                                                    fit: BoxFit.fill,
                                                  ),),
                                                child: Text("予約履歴"),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          V3Resarvation()),);},
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
                                                child: Text("メッセージ"),
                                              ),
                                              onPressed: () {
                                                Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Message()),);
                                              },
                                            ),),)),
                                  ],),),

                            ],)),
                    )
                  ]))
            ])));
  }
}