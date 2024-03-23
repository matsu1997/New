
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Acount.dart';
import 'SignUp.dart';


class MessageAll extends StatefulWidget {
  @override
  State<MessageAll> createState() => _MessageAllState();
}
class _MessageAllState extends State<MessageAll> {
  var item = [];
  var uid = "";

  @override
  void initState() {
    super.initState();
    _loadData();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title:Text("メッセージ",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Container(
            child: Column(children: <Widget>[
              Container(height:50,child:Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                Row(children: [Container(child: Icon(Icons.circle,color: Colors.red,),),Container(child:Text("初回",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),textAlign: TextAlign.center,))],),
                Row(children: [Container(child: Icon(Icons.circle,color: Colors.green,),),Container(child:Text("未読",style: TextStyle(fontSize:20,fontWeight: FontWeight.bold),textAlign: TextAlign.center,))],),
               ])),
              Expanded(
              child: ListView.builder(
                  itemCount: item.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () { Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AcountDetailV3(item[index]["uid"])),).then((value) {_loadData();});},
                    child: Card(
                      shadowColor: Colors.grey[100],
                      elevation: 8,
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        margin: EdgeInsets.all(20),
                        child: Column(
                          children: [Row(children: [
                              Container(child: Icon(Icons.account_circle_outlined,color: Colors.orange,),),
                              Container(margin:EdgeInsets.only(left: 10),child: Text(item[index]["userName"],style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color:Colors.black),textAlign: TextAlign.center,),),
                              Expanded(child: Text(item[index]["date"],style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey),textAlign: TextAlign.right,),),
                              Container(width: 30,margin:EdgeInsets.only(left: 10),child: Icon(Icons.circle,color:Color(item[index]["既読"])),),
                          ],),
                    ],),),
                    ));},),),
              Container()
            ])));
  }
  void _loadData()  {
    item = [];
    FirebaseFirestore.instance.collection('メッセージ').orderBy('createdAt', descending: true).get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        setState(() {
          item.add(doc);
          ;});});});}
}