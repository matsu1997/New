
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'SignUp.dart';


class Message extends StatefulWidget {
  @override
  State<Message> createState() => _MessageState();
}
class _MessageState extends State<Message> {
  var _controller = TextEditingController();
  var uid = "";
  var text = "";
  var item = [];
  var date = DateTime.now();
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
          title:Text("メッセージ",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
          actions: [Icon(Icons.upgrade)],
        ),
        body:GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child:  Container(
          color: Colors.blue[100],
            child: Column(children: <Widget>[
              Expanded(
                child: Container(margin: EdgeInsets.only(top: 10,bottom: 20,left: 10,right: 10),
                  child:ListView.builder(
                  itemCount: item.length,
                  itemBuilder: (context, index) {
                    return Card(
                      // shadowColor: Colors.grey[100],
                      elevation: 8,
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(margin: EdgeInsets.all(10),child:
                      Row(children: [Column(children: [Container(
                      margin: EdgeInsets.only(top:5,bottom: 5,left: 5,right: 10),
                      child: Icon(Icons.account_circle_rounded,color:Color(item[index]["Color"])),), Container(child: Text(item[index]["人"],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 10,color: Colors.grey[500]),))]),
                      Expanded(child: Text(item[index]["text"],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15, letterSpacing:2,height:1.3),),)],),));},),)),
              Container(color: Colors.white,alignment: Alignment.bottomCenter,width:double.infinity,height:60,child: Row(children: [
                Expanded(child:Container(margin: EdgeInsets.only(bottom: 5,left: 5),
                  child:TextFormField(
                    controller: _controller,
                  decoration: InputDecoration(labelText:"message"),
                  onChanged: (String value) {
                    setState(() {text = value;});
                  },),)),
                Container(width:50,height:50,child:IconButton(onPressed: () {send();},
               //   child: Text("cdsd"))),
                   icon:Icon(Icons.send,color: Colors.blue,)))
              ],),),
            ]))));
  }
  void _loadData()  {
    item = [];
    FirebaseFirestore.instance.collection('users').doc(uid).collection("メッセージ").orderBy('createdAt', descending: true).get().then((QuerySnapshot snapshot) {
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
        ;} else {uid = user.uid;print(uid);_loadData();
      }});}
  void send() {
    DateFormat outputFormat = DateFormat('MM月dd日HH時m分');
    var day = outputFormat.format(date);
    print(text);
    if (text != ""){
    FirebaseFirestore.instance.collection('users').doc(uid).collection("メッセージ").doc().set({
      "Color":int.parse("0xFF4CAF50"),
       "人":"",
      "text":text,
      "createdAt": Timestamp.now(),});
    FirebaseFirestore.instance.collection('メッセージ').doc(uid).update({
      "既読":int.parse("0xff008000"),
      "date":day,
      "createdAt": Timestamp.now(),});
    _loadData();FocusScope.of(context).unfocus();_controller.clear();
 }
  }
}