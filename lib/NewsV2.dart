import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsV2 extends StatefulWidget {
  NewsV2(this.Id);
  String Id;
  @override
  State<NewsV2> createState() => _NewsV2State();
}
class _NewsV2State extends State<NewsV2> {
  var title = "";
  var text = "";
  var date = "";
  var imageId = "";
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
          title:Text("最新情報",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
              Container(margin:EdgeInsets.all(20),width: double.infinity,child: Text(title,style: TextStyle(fontSize:20,fontWeight: FontWeight.bold )),),
              Container(margin:EdgeInsets.only(left:20),width: double.infinity,child: Text(date,style: TextStyle(fontSize:15,fontWeight: FontWeight.bold, color: Colors.grey),),),
              SingleChildScrollView(child:Column(children: <Widget>[Container(margin:EdgeInsets.all(20),width: double.infinity,child: Text(text,style: TextStyle(height: 2,fontSize:15,fontWeight: FontWeight.bold),),),
              Container(child: Image(image: NetworkImage(imageId),),)])),
            ]))
    );
  }
  void _loadData()  {
    FirebaseFirestore.instance.collection('最新情報').where("Id", isEqualTo: widget.Id).get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        setState(() {
           title = doc["title"];
           text = doc["text"];
           date = doc["date"];
           imageId = doc["ImageId"];
          ;});});});}
}