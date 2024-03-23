
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'SignUp.dart';


class V3Resarvation extends StatefulWidget {
  @override
  State<V3Resarvation> createState() => _V3ResarvationState();
}
class _V3ResarvationState extends State<V3Resarvation> {
  var item = [];
  var uid = "";
  @override
  void initState() {
    super.initState();
    aa();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title:Text("予約履歴",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Container(
            child: Column(children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: item.length,
                  itemBuilder: (context, index) {
                    return Card(
                      shadowColor: Colors.grey[100],
                      elevation: 8,
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Container(
                        margin: EdgeInsets.all(10),
                        child: Column(
                          children: [Row(
                        children: [Expanded(
                            child: Text(item[index]["text"],style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color:Colors.black),textAlign: TextAlign.center,),),
                            Container(width:10,margin: EdgeInsets.only(right: 5),child: Text(item[index]["完了"],style: TextStyle(fontWeight: FontWeight.bold,color:Colors.red),textAlign: TextAlign.center,),)],),
                              Container(width: double.infinity,margin: EdgeInsets.only(right: 15),child: Text(item[index]["日"].toString()+"日" +item[index]["開始時間"].toString()+ "~"+item[index]["開始時間"].toString(),style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey),textAlign: TextAlign.center,),)],),),
                     );},),),
              Container()
            ])));
  }
  void _loadData()  {
    item = [];
    FirebaseFirestore.instance.collection('users').doc(uid).collection("予約").orderBy('createdAt', descending: true).get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        setState(() {
          item.add(doc);
          ;});});});}
  void aa (){
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Future(() {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return SignUp();
          }));})
        ;} else {uid = user.uid;_loadData();
      }});}
}