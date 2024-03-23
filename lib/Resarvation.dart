

import 'dart:ffi';
import 'dart:math';

import 'package:asaminew/EditeResarvation.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

import 'Acount.dart';
import 'ResarvationAddC.dart';
import 'ResarvationEdite.dart';

/// The app which hosts the home page which contains the calendar on it.
class Resarvation extends StatefulWidget {
  @override
  State<Resarvation> createState() => _ResarvationState();
}

class _ResarvationState extends State<Resarvation> {
  var item = [];var item1 = [];
  var day = "";
  DateTime today = DateTime.now();
  var date1 = "";var date2 = "";var date3 = "";var date4 = "";
  var staff = "";
  var count1 = 0;var count2 = 1;var count3 = 2;var count4 = 3;
  var B1 = false;var B2 = true;
  var money = 0;var UidMoney = 0;
  var _controller = TextEditingController();
  @override
  void initState() {
    super.initState();
    date();
    _loadData();_loadData1();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(day,
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
          actions: <Widget>[
           IconButton(icon: Icon(Icons.calendar_month),
             onPressed: (){ _selectDate(context);},
           )],
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => ResarvationAdd(day)),);},
        ),
        body: Container(
            child: Column(children: <Widget>[
              Container(
                width: double.infinity, height: 70,
                alignment: Alignment.centerRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
                  Expanded(child: Container(margin: EdgeInsets.all(10),
                    width: double.infinity,
                    child: ElevatedButton(
                      child: const Icon(Icons.arrow_back_ios),
                      style: ElevatedButton.styleFrom(primary: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),),),
                      onPressed: !B1 ? null : () {
                        setState(() {
                          B2 = true;count1 = count1 - 1;
                          if (count1 == 0) {B1 = false;}
                          date();
                        });
                      },),),),
                  Expanded(child: Container(margin: EdgeInsets.all(10),
                    width: double.infinity,
                    child: ElevatedButton(
                      child: const Text('今日', style: TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                      style: ElevatedButton.styleFrom(primary: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),),),
                      onPressed: () {
                        setState(() {
                          today = DateTime.now();
                          B2 = true;count1 = 0;B1 = false;
                          date();});
                      },),),),
                  Expanded(child: Container(margin: EdgeInsets.all(10),
                    width: double.infinity,
                    child: ElevatedButton(
                      child: Icon(Icons.arrow_forward_ios),
                      style: ElevatedButton.styleFrom(primary: Colors.orange,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),),),
                      onPressed: !B2 ? null : () {
                        setState(() {B1 = true;count1 = count1 + 1;
                        if (count1 == 28) {B2 = false;}
                        date();});
                      },),),),
                ],),
              ),
          Expanded(
            child: ListView.builder(
              itemCount: item.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {
                      FirebaseFirestore.instance.collection("users").doc(item[index]["uid"]).collection("データ").where("データ",isEqualTo: "スタンプ").get()
                          .then((QuerySnapshot snapshot) {
                        snapshot.docs.forEach((doc) {setState(() {UidMoney = doc["金額"];});});});
                      showDialog(context: context, builder: (context) =>
                          AlertDialog(actions: <Widget>[
                            Column(children: [
                              Container(
                                  margin: EdgeInsets.all(10),alignment: Alignment.center,
                               child:TextButton(
                                 onPressed: (){ Navigator.of(context).pop(); Navigator.of(context).push(
                                   MaterialPageRoute(builder: (context) => AcountDetail(item[index]["uid"],item[index]["名前"])),).then((value) {_loadData();});},
                                 child:Text("情報をみる",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)
                               )),
                              Container(
                                margin: EdgeInsets.all(10),alignment: Alignment.center,
                                  child:TextButton(onPressed: (){    Navigator.of(context).pop();   Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) => ResarvationEdite(item[index]["uid"],item[index]["名前"],item[index]["開始時間"],item[index]["text"].toString(),item[index]["Id"],day,item[index]["時間"],item[index]["値段"],item[index]["終了時間"])),).then((value) {_loadData();});},
                                      child:Text("予約変更",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)
                                  )),
                              Container(
                                  margin: EdgeInsets.all(10),alignment: Alignment.center,
                                  child:TextButton(onPressed: (){  Navigator.of(context).pop();
                                  showDialog(
                                      context: context,
                                      builder: (context) =>
                                          AlertDialog(
                                            title: Text("施術完了!" ,textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                                            content: Text(item[index]["名前"]+ "様",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                                            actions: <Widget>[
                                                              Column(
                                                                children: [Container(child: TextButton(child: Text("担当"),
                                                                          onPressed: () {Staff();})),
                                                                  Text(staff,style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                                                                  Text("お会計",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
                                                  Container(
                                                    child:TextFormField(
                                                      controller: _controller,
                                                      keyboardType: TextInputType.number,
                                                      decoration: InputDecoration(labelText: '金額'),
                                                      onChanged: (String value) {
                                                        setState(() {money = int.parse(value);});},),),
                                                  Container(
                                                    child: ElevatedButton(child: Text('完了'),
                                                      onPressed: ()  {
                                                      var Id = randomString(20);
                                                        FirebaseFirestore.instance.collection('users').doc(item[index]["uid"]).collection("来院履歴").doc(Id).set({
                                                          "スタッフ":staff,"text":item[index]["text"],"uid":item[index]["uid"],"Id":Id, "決算":money,"createdAt": Timestamp.now(),});
                                                        FirebaseFirestore.instance.collection('予約').doc(day).collection("予約").doc(item[index]["Id"]).update({
                                                          "完了":"済", "決算":money,});
                                                        FirebaseFirestore.instance.collection('users').doc(item[index]["uid"]).collection("予約").doc(item[index]["Id"]).update({
                                                          "完了":"済", "決算":money,});
                                                      FirebaseFirestore.instance.collection('users').doc(item[index]["uid"]).collection("データ").doc("スタンプ").update({
                                                        "金額":UidMoney + money});
                                                        Navigator.pop(context, '');},
                                                    ),
                                                  ),
                                                  CupertinoButton(
                                                    child: Text("キャンセル"),
                                                    onPressed: () {
                                                      Navigator.pop(context, 'cancel');
                                                    },
                                                  )
                                                ],)],));
                                    },
                                      child:Text("施術完了!",style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)
                                  )),
                            ])],));},
                child:  Card(
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
                          Expanded(
                              child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  child: Text(
                                item[index]["開始時間"].toString() + "〜" + item[index]["終了時間"].toString()+"        "+item[index]["名前"] + "様",
                                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                              )),
                              Container(margin: EdgeInsets.only(top: 10),
                                  child: Row(
                                children: [
                                  Expanded(
                                      child: Text("コース: " + item[index]["text"].toString(),
                                    style: TextStyle(color:Colors.grey,fontWeight: FontWeight.bold,),)),
                                  Expanded(
                                    //  margin: EdgeInsets.only( left: 10),
                                      child: Text(item[index]["値段"].toString() + "円",
                                    style: TextStyle(color:Colors.grey,fontWeight: FontWeight.bold),
                                  )),
                                  Container(
                                      margin: EdgeInsets.only( left: 10),
                                      child: Text(item[index]["完了"] ,
                                        style: TextStyle(color:Colors.red,fontWeight: FontWeight.bold,),
                                      )),
                                ],
                              )),
                            ],
                          )),
                        ],
                      )),
                ));
              },
            ),
          ),
          Container()
        ])));
  }
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: today,
        firstDate: new DateTime(2016),
        lastDate: new DateTime.now().add(new Duration(days: 360))
    );
    if(picked != null) setState(() => today = picked);
    date();
  }
  void date() {
    setState(() {
    DateFormat outputFormat = DateFormat('MM月dd');
    day = outputFormat.format(DateTime(today.year, today.month, today.day + count1));
    date1 = outputFormat.format(
        DateTime(today.year, today.month, today.day + count1));});
    _loadData();
  }
  void Staff (){
    showDialog(context: context, builder: (context) =>
        AlertDialog(
          title: Text('スタッフ'),
          content: Container(
            width: 200,
            height: 200,
            child: ListView.builder(
              itemCount: item1.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                    onTap: () {setState(() {staff = item1[index];
                    Navigator.pop(context);});},
                    child: ListTile(
                      title: Text(item1[index],style: TextStyle(fontWeight: FontWeight.bold),),
                    ));},),),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('閉じる'),
            )],));
  }
  void _loadData() {
    item = [];
    FirebaseFirestore.instance.collection('予約').doc(day).collection("予約").orderBy("開始時間", descending: false).get()
        .then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        setState(() {item.add(doc);});});});}
  void _loadData1() {
    item1 = [];
    FirebaseFirestore.instance.collection('スタッフ').get()
        .then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        setState(() {item1.add(doc["名前"]);});});});}
  String randomString(int length) {
    const _randomChars =
        "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
    const _charsLength = _randomChars.length;
    final rand = new Random();
    final codeUnits = new List.generate(
      length,
          (index) {
        final n = rand.nextInt(_charsLength);
        return _randomChars.codeUnitAt(n);
      },);
    return new String.fromCharCodes(codeUnits);
  }
}




