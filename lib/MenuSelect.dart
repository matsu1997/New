import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'SignUp.dart';

class MenuSelect extends StatefulWidget {
  MenuSelect(this.day,this.Menuitem,this.item,this.start,this.date);
  String day;
  List item;
  List Menuitem;
  int start;
  DateTime date;
  @override
  State<MenuSelect> createState() => _MenuSelectState();
}

class _MenuSelectState extends State<MenuSelect> {
  var item = [];
  var item1 = [];
  var menu = [];
  var start = 0;
  var end = 0;
  var name = "";
  var uid = "";
  DateTime da = DateTime.now();
  @override
  void initState() {
    super.initState();
    aa();
    set();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text("メニュー選択", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Container(
            child: Column(children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: item1.length,
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
                          children: [Container(
                            margin: EdgeInsets.only(top:10,left: 10,right: 5),
                            alignment: Alignment.center,
                            child: Text(item1[index]["text"],style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color:Colors.black)),),
                            Container(child:
                            Row(children: [Container(
                                height: 100,width: 100,
                                margin: EdgeInsets.only(top: 10,left: 10,right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: NetworkImage(item1[index]["imageId"]),
                                    fit: BoxFit.fill,),)),
                              Expanded(child: Text(item1[index]["subText"],style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey),),)],),),
                            Container(
                              margin: EdgeInsets.all(10),
                              width: double.infinity,
                              child: ElevatedButton(child: Text("予約する"), onPressed: () {    showDialog(context: context, builder: (context) =>
                                  AlertDialog(
                                    actions: <Widget>[
                                      Column(children: [
                                        Container(
                                          margin: EdgeInsets.all(10),width: double.infinity,
                                          child: Text("予約を確定しますか？",style: TextStyle(fontWeight: FontWeight.bold),),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(10),width: double.infinity,
                                          child: Text(widget.day,style: TextStyle(fontWeight: FontWeight.bold),),
                                        ),
                                        Container(
                                          margin: EdgeInsets.all(10),width: double.infinity,
                                          child: Text(item1[index]["text"],style: TextStyle(fontWeight: FontWeight.bold),),
                                        ),
                                        Container(
                                            margin: EdgeInsets.all(10),width: double.infinity,
                                            child: ElevatedButton(
                                                child: Text('確定',style: TextStyle(fontWeight: FontWeight.bold),),
                                                onPressed: () {
                              var sumDate1 = widget.date.add(Duration(minutes: item1[index]["時間"]));
                              DateFormat outputFormat1 = DateFormat('Hmm');
                              var dateInt = outputFormat1.format(sumDate1);
                                                  var Id = randomString(20);
                                                  FirebaseAuth.instance.authStateChanges().listen((User? user) async {
                                                    await FirebaseFirestore.instance.collection('予約').doc(widget.day).collection("予約").doc(Id).set({
                                                      "text":item1[index]["text"],
                                                      "値段":item1[index]["値段"],
                                                      "開始時間" : widget.start,
                                                      "終了時間" :  int.parse(dateInt),
                                                      "時間":item1[index]["時間"],
                                                      "完了":"",
                                                      "名前":name,
                                                      "uid":uid,
                                                      "Id":Id,
                                                      "createdAt": Timestamp.now(),});});
                                                    FirebaseFirestore.instance.collection('users').doc(uid).collection("予約").doc(Id).set({
                                                      "text":item1[index]["text"],
                                                      "値段":item1[index]["値段"],
                                                      "開始時間" : widget.start,
                                                      "終了時間" :  int.parse(dateInt),
                                                      "時間":item1[index]["時間"],
                                                      "完了":"",
                                                      "名前":name,
                                                      "uid":uid,
                                                      "Id":Id,
                                                      "日":widget.day,
                                                      "createdAt": Timestamp.now(),}
                                                  );
                                                  Navigator.of(context).pop();})),
                                        Container(
                                            margin: EdgeInsets.all(10),width: double.infinity,
                                            child: TextButton(
                                                child: Text('いいえ',style: TextStyle(fontWeight: FontWeight.bold),),
                                                onPressed: () {Navigator.of(context).pop();}))
                                      ])],));},),)],
                        ),),);},),),
              Container()
            ])));}
  void set() {
    for (var i = 0; i < widget.item.length; i++) {
      if (int.parse(widget.item[i][1]) <= widget.start == true && widget.start < int.parse(widget.item[i][2]) == true) {
      end = int.parse(widget.item[i][2]);
      print(widget.item);
      } ;}set1();
  }
  void set1(){
      for (var co = 0; co < widget.Menuitem.length  ; co++) {
       var sumDate = widget.date.add(Duration(minutes: widget.Menuitem[co]["時間"]));
       DateFormat outputFormat1 = DateFormat('Hmm');
       var dateInt = outputFormat1.format(sumDate);
          if (int.parse(dateInt) <=  end  == true) {
            setState(() {  item1.add(widget.Menuitem[co]);});
          }}}
  String randomString(int length) {
    const _randomChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    const _charsLength = _randomChars.length;
    final rand = new Random();
    final codeUnits = new List.generate(
      length, (index) {
      final n = rand.nextInt(_charsLength);
      return _randomChars.codeUnitAt(n);},);
    return new String.fromCharCodes(codeUnits);}

  void aa (){
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Future(() {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return SignUp();}));})
        ;} else {
        uid = user.uid;
        _acount();
      }});}
  void _acount() {
    FirebaseFirestore.instance.collection('users').where('uid', isEqualTo: uid).get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        setState(() {
          name = doc["userName"];
        });});});
  }

}



