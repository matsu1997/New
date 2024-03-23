import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ResarvationEdite extends StatefulWidget {
  ResarvationEdite(this.uid,this.name,this.start,this.course,this.Id,this.date,this.time,this.price,this.end);
  String uid;
  String name;
  int start;
  int end;
  String course;
  String Id;
  String date;
  int time;
  int price;
  @override
  State<ResarvationEdite> createState() => _ResarvationEditeState();
}

class _ResarvationEditeState extends State<ResarvationEdite> {
  var time = "変更";
  var course = "変更";
  var date = "";
  var dateFix = "";
  var dateInt = 0;
  var timeInt = 0;
  var StartInt = 0;
  var priceFix = 0;
  var startFix  = 0;
  var selectDate = DateTime.now();
  var item = [];
  var item1 = [];
  @override
  void initState() {
    super.initState();
    setState(() {
    selectDate =  DateTime(selectDate.year, selectDate.month, selectDate.day ,0,0);
    course = widget.course;
    startFix = widget.start;
    timeInt = widget.time;
    date = widget.date;
    dateFix = date;
    priceFix = widget.price;});
    _loadData();
    _loadData1();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(widget.name + "様の予約変更", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Container(
            child: Column(children: <Widget>[
             Container(margin:EdgeInsets.all(5),width:double.infinity,child:Text("現在の予約時間",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),textAlign: TextAlign.center,)),
              Container(margin:EdgeInsets.all(5),width:double.infinity,child:Text(widget.start.toString(),style: TextStyle(color:Colors.grey,fontWeight: FontWeight.bold, fontSize: 20),textAlign: TextAlign.center,)),
              Container(child: TextButton(
                  onPressed: (){
                    showDialog(context: context, builder: (context) =>
                        AlertDialog(actions: <Widget>[
                          Column(children: [Container(
                            height: 200,width: double.infinity,alignment: Alignment.center,
                            child: Center(
                                child: CupertinoDatePicker(
                                  minuteInterval: 15,
                                  initialDateTime: selectDate,
                                  mode: CupertinoDatePickerMode.time,
                                  onDateTimeChanged: (dateTime) {
                                    setState(() => selectDate = dateTime);
                                    DateFormat outputFormat = DateFormat('HH:mm');
                                    DateFormat outputFormat1 = DateFormat('HHmm');
                                    time = outputFormat.format(selectDate);
                                    StartInt = int.parse(outputFormat1.format(selectDate));
                                    startFix  = StartInt;
                                    var sumDate1 = selectDate.add(Duration(minutes: timeInt));
                                    dateInt = int.parse(outputFormat1.format(sumDate1));
                                    setState(() {});
                                  },)),),])],));},
                  child:Text(time))),
              Container(margin:EdgeInsets.all(5),width:double.infinity,child:Text("現在の予約メニュー",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),textAlign: TextAlign.center,)),
              Container(margin:EdgeInsets.all(5),width:double.infinity,child:Text(widget.course,style: TextStyle(color:Colors.grey,fontWeight: FontWeight.bold, fontSize: 20),textAlign: TextAlign.center,)),
              Container(
                child: TextButton(
                  child: Text(course),
                  onPressed: (){
                    showDialog(context: context, builder: (context) =>
                        AlertDialog(
                          title: Text('メニュー'),
                          content: Container(
                            width: 200,
                            height: 200,
                            child: ListView.builder(
                              itemCount: item.length,
                              itemBuilder: (context, index) {
                                return GestureDetector(
                                    onTap: () {setState(() {course = item[index]["text"]; priceFix = item[index]["値段"];timeInt = item[index]["時間"];
                                    var sumDate1 = selectDate.add(Duration(minutes: timeInt));
                                    DateFormat outputFormat1 = DateFormat('HHmm');
                                    dateInt = int.parse(outputFormat1.format(sumDate1));
                                    Navigator.pop(context);});},
                                    child: ListTile(
                                      title: Text(item[index]["text"],style: TextStyle(fontWeight: FontWeight.bold),),
                                    ));},),),
                          actions: [
                            TextButton(
                              onPressed: () => Navigator.pop(context),
                              child: Text('閉じる'),
                            )],));},),),
            Container(margin: EdgeInsets.all(10),
                width: 100,
                child: ElevatedButton(
                  child: const Text('登録', style: TextStyle(
                      fontSize: 20, fontWeight: FontWeight.bold)),
                  style: ElevatedButton.styleFrom(primary: Colors.orange,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),),),
                  onPressed: () {setState(() {send();});},),),
              Container(child:Text(widget.date + "の予約", style: TextStyle(
              fontSize: 15, fontWeight: FontWeight.bold)),),
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
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [Colors.white, Colors.white],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      padding: EdgeInsets.all(16),
                      child: Row(
                        children: [
                          Container(
                              child: Text(
                            item1[index]["開始時間"].toString() + "〜" + item1[index]["終了時間"].toString() + "     " +item1[index]["名前"] + "様",
                            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)),
                          Container(margin:EdgeInsets.only(left: 10),
                              child: Text(item1[index]["text"].toString(), style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold, fontSize: 20),
                          )),
                        ],
                      )),
                );
              },
            ),
          ),
        ])));
  }
  void _loadData()  {
    item = [];
    FirebaseFirestore.instance.collection('メニュー').get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        setState(() {
          item.add(doc);
          ;});});});}
  void send(){
    FirebaseFirestore.instance.collection('予約').doc(widget.date).collection("予約").doc(widget.Id).update({
        "text":course,
        "値段":priceFix,
        "開始時間" :startFix ,
        "終了時間" :dateInt,
        "時間":timeInt,
    });
   FirebaseFirestore.instance.collection('users').doc(widget.uid).collection("予約").doc(widget.Id).update({
        "text":course,
        "値段":priceFix,
        "開始時間" :startFix ,
        "終了時間" :dateInt,
        "時間":timeInt,
   });
  }
  void _loadData1() {
    item1 = [];
    FirebaseFirestore.instance.collection('予約').doc(widget.date).collection("予約").orderBy("開始時間", descending: false).get()
        .then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        setState(() {item1.add(doc);});});});}
}
