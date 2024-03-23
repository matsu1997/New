//
// import 'dart:math';
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
//
// class DateSelect extends StatefulWidget {
//   @override
//   State<DateSelect> createState() => _DateSelectState();
// }
//
// class _DateSelectState extends State<DateSelect> {
//   var item = ["","","","","","","","",""];
//   var item1 = ["9:00","9:10","9:20","9:30","9:40","9:50","10:00","10:10","10:20","10:30","10:40","10:50","11:00","11:10","11:20"];
//   DateTime today = DateTime.now();
//   var date1 = "";
//   var date2 = "";
//   var date3 = "";
//   var date4 = "";
//   var count1 = 0;
//   var count2 = 1;
//   var count3 = 2;
//   var count4 = 3;
//   var B1 = false;
//   var B2 = true;
//   @override
//   void initState() {
//     super.initState();
//     date();
//   }
//
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//   }
//
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: Text(
//           "曜日指定",
//           style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
//         ),
//         centerTitle: true,
//         iconTheme: IconThemeData(color: Colors.black),
//       ),
//       body: Column(
//         children: [
//           Container(
//            width: double.infinity,height: 70,
//             alignment:Alignment.centerRight ,
//             child: Row( mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
//               Expanded(child: Container(margin:EdgeInsets.all(10),width:double.infinity,child: ElevatedButton(
//                 child: const Icon(Icons.arrow_back_ios), style: ElevatedButton.styleFrom(primary: Colors.orange,
//                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),),
//                 onPressed :! B1 ? null :  () {setState(() { B2 = true;count1 = count1 - 4;count2 = count2 - 4;count3 = count3 - 4;count4 = count4 - 4;
//                   if (count1 == 0){B1 = false;}date();});},),),),
//               Expanded(child: Container(margin:EdgeInsets.all(10),width:double.infinity,child: ElevatedButton(
//                 child: const Text('今日',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)), style: ElevatedButton.styleFrom(primary: Colors.orange,
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),),
//                 onPressed: () {setState(() {B2 = true;count1 = 0;count2 = 1;count3 = 2;count4 = 3;B1 = false;date(); });
//                   },),),),
//               Expanded(child: Container(margin:EdgeInsets.all(10),width:double.infinity,child: ElevatedButton(
//                 child:Icon(Icons.arrow_forward_ios), style: ElevatedButton.styleFrom(primary: Colors.orange,
//                 shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10),),),
//                 onPressed:! B2 ? null :() {
//                   setState(() { B1 = true;count1 = count1 + 4;count2 = count2 + 4;count3 = count3 + 4;count4 = count4 + 4;if (count1 == 28){B2 = false;}date();
//                   });},),),),
//             ],),
//           ),
//           Container(
//             margin: EdgeInsets.only(left: 4,right: 4),
//             height: 40,width: double.infinity,
//             child: Row(children: [
//               Container(width: 50,),
//               Expanded(child: Text(date1,textAlign: TextAlign.center,style: TextStyle(
//                   fontSize: 20, fontWeight: FontWeight.bold),)),
//               Expanded(child: Text(date2,textAlign: TextAlign.center,style: TextStyle(
//                   fontSize: 20, fontWeight: FontWeight.bold))),
//               Expanded(child: Text(date3,textAlign: TextAlign.center,style: TextStyle(
//                   fontSize: 20, fontWeight: FontWeight.bold))),
//               Expanded(child: Text(date4,textAlign: TextAlign.center,style: TextStyle(
//                   fontSize: 20, fontWeight: FontWeight.bold))),
//          ],),),
//           Expanded(child: ListView.builder(
//             itemCount: item1.length,
//             itemBuilder: (context, index) {
//               return Card(
//                 child: Container(
//                    // padding: EdgeInsets.all(16),
//                     child: Row(
//                       children: [
//                         Container(margin:EdgeInsets.only(left:5 ,right:5 ),width: 40,child: Text(item1[index],textAlign: TextAlign.center,style: TextStyle(
//                             fontSize: 15, fontWeight: FontWeight.bold)),),
//                         Expanded(
//                             child:Align(
//                               alignment: Alignment.center,
//                                 child: IconButton(
//                                     onPressed: () {print(item1[index] + date1);},
//                                     icon: Icon(Icons.circle))),
//                             ),
//                         Expanded(
//                           child:Align(
//                               alignment: Alignment.center,
//                               child: IconButton(
//                                   onPressed: () {},
//                                   icon: Icon(Icons.circle))),),
//                         Expanded(
//                           child:Align(
//                               alignment: Alignment.center,
//                               child: IconButton(
//                                   onPressed: () {},
//                                   icon: Icon(Icons.circle))),),
//                         Expanded(
//                           child:Align(
//                               alignment: Alignment.center,
//                               child: IconButton(
//                                   onPressed: () {},
//                                   icon: Icon(Icons.circle))),),
//                       ],
//                     )),);},),)
//         ],
//       ),);}
//   void date(){
//     today = DateTime.now();
//     DateFormat outputFormat = DateFormat('MM/dd');
//     date1 = outputFormat.format(DateTime(today.year, today.month, today.day + count1));
//     date2 = outputFormat.format(DateTime(today.year, today.month, today.day + count2));
//     date3 = outputFormat.format(DateTime(today.year, today.month, today.day + count3));
//     date4 = outputFormat.format(DateTime(today.year, today.month, today.day + count4));
//   }
// }



import 'dart:ffi';
import 'dart:math';

import 'package:asaminew/MenuSelect.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import 'SignUp.dart';

class V2DateSelect extends StatefulWidget {
  V2DateSelect(this.time,this.price,this.text,);
  int time;
  int price;
  String text;
  @override
  State<V2DateSelect> createState() => _V2DateSelectState();
}

class _V2DateSelectState extends State<V2DateSelect> {
  var item = [];
  var item1 = [];
  var itemS = [];
  var itemE = [];
  var itemS2 = [];
  var itemE2 = [];
  var itemS3 = [];
  var itemE3 = [];
  var itemS4 = [];
  var itemE4 = [];
  var item2 = [];
  var item3 = [];
  var item4 = [];
  var item10 = [];
  var item22 = [];
  var item33 = [];
  var item44 = [];
  var date1 = "";
  var date2 = "";
  var date3 = "";
  var date4 = "";
  var coun = 708;
  var count1 = 0;
  var count2 = 1;
  var count3 = 2;
  var count4 = 3;
  var index1 = 0;
  var start = 0;
  var end = 0;
  var day = "";
  var B1 = false;
  var B2 = true;
  DateTime today = DateTime.now();
  DateTime hour = DateTime.now();
  DateTime da = DateTime(0, 0, 0, 9, 0);
  var dateString ;
  var dateInt ;
  var dateIntE ;
  var da1 = DateTime(0, 0, 0, 22, 0);
  var difference ;
  var sec ;
  var sum ;
  var uid = "";
  var name = "";
  DateFormat outputFormat = DateFormat('H:mm');
  DateFormat outputFormat1 = DateFormat('Hmm');
  @override
  void initState() {
    super.initState();
    aa();
    date();
    dateSet();
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
        title: Text(
          "曜日指定",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: Column(
        children: [
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
                      B2 = true;count1 = count1 - 4;count2 = count2 - 4;count3 = count3 - 4;count4 = count4 - 4;
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
                      B2 = true;count1 = 0;count2 = 1;count3 = 2;count4 = 3;B1 = false;
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
                    setState(() {B1 = true;count1 = count1 + 4;count2 = count2 + 4;count3 = count3 + 4;count4 = count4 + 4;
                    if (count1 == 28) {B2 = false;}
                    date();});
                  },),),),
            ],),
          ),
          Container(
            margin: EdgeInsets.only(left: 4, right: 4),
            height: 40, width: double.infinity,
            child: Row(children: [
              Container(width: 50,),
              Expanded(child: Text(
                date1, textAlign: TextAlign.center, style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold),)),
              Expanded(child: Text(
                  date2, textAlign: TextAlign.center, style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold))),
              Expanded(child: Text(
                  date3, textAlign: TextAlign.center, style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold))),
              Expanded(child: Text(
                  date4, textAlign: TextAlign.center, style: TextStyle(
                  fontSize: 20, fontWeight: FontWeight.bold))),
            ],),),
          Expanded(child: ListView.builder(
            itemCount: item10.length,
            itemBuilder: (context, index) {
              return Card(
                child: Container(
                  // padding: EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Container(margin: EdgeInsets.only(left: 5, right: 5),
                          width: 40,
                          child: Text(
                              item10[index][1], textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold)),),
                        Expanded(
                          child: Align(
                              alignment: Alignment.center,
                              child: (item10[index][3]) ?
                              IconButton(
                                  onPressed: () {index1 = index;day = date1;send();},
                                   icon: Icon(Icons.circle)) :
                              Icon(Icons.clear)),),
                        Expanded(
                          child: Align(
                              alignment: Alignment.center,
                              child: (item22[index][3]) ?
                              IconButton(
                                  onPressed: () {index1 = index;day = date2;send();
                                     },
                                  icon: Icon(Icons.circle)) :
                              Icon(Icons.clear)),),
                        Expanded(
                          child: Align(
                              alignment: Alignment.center,
                              child: (item33[index][3]) ?
                              IconButton(
                                  onPressed: () {index1 = index;day = date3;send();
                                     },
                                  icon: Icon(Icons.circle)) :
                              Icon(Icons.clear)),),
                        Expanded(
                          child: Align(
                              alignment: Alignment.center,
                              child: (item44[index][3]) ?
                              IconButton(
                                  onPressed: () {index1 = index;day = date4;send();
                                     },
                                  icon: Icon(Icons.circle)) :
                              Icon(Icons.clear)),),
                      ],
                    )),);
            },),)
        ],
      ),);
  }
  void send(){
    showDialog(context: context, builder: (context) =>
        AlertDialog(
          actions: <Widget>[
            Column(children: [
              Container(
                margin: EdgeInsets.all(10),width: double.infinity,
                child: Text("予約を確定しますか？",style: TextStyle(fontWeight: FontWeight.bold),),
              ),
              Container(
                margin: EdgeInsets.all(10),width: double.infinity,
                child: Text(day,style: TextStyle(fontWeight: FontWeight.bold),),
              ),
              Container(
                margin: EdgeInsets.all(10),width: double.infinity,
                child: Text(widget.text,style: TextStyle(fontWeight: FontWeight.bold),),
              ),
              Container(
                  margin: EdgeInsets.all(10),width: double.infinity,
                  child: ElevatedButton(
                      child: Text('確定',style: TextStyle(fontWeight: FontWeight.bold),),
                      onPressed: () {
                        var sumDate1 = item10[index1][0].add(Duration(minutes: widget.time));
                        DateFormat outputFormat1 = DateFormat('Hmm');
                        var dateInt = outputFormat1.format(sumDate1);
                        var Id = randomString(20);
                          FirebaseFirestore.instance.collection('予約').doc(day).collection("予約").doc(Id).set({
                            "text":widget.text,
                            "値段":widget.price,
                            "開始時間" :int.parse(item10[index1][2]),
                            "終了時間" : int.parse(dateInt),
                            "時間":widget.time,
                            "完了":"",
                            "名前":name,
                            "uid":uid,
                            "Id":Id,
                            "createdAt": Timestamp.now(),});
                          FirebaseFirestore.instance.collection('users').doc(uid).collection("予約").doc(Id).set({
                            "text":widget.text,
                            "値段":widget.price,
                            "開始時間" : int.parse(item10[index1][2]),
                            "終了時間" : int.parse(dateInt),
                            "時間":widget.time,
                            "完了":"",
                            "名前":name,
                            "uid":uid,
                            "Id":Id,
                            "日":day,
                            "createdAt": Timestamp.now(),});
                        Navigator.of(context).pop();Navigator.of(context).pop();})),
              Container(
                  margin: EdgeInsets.all(10),width: double.infinity,
                  child: TextButton(
                      child: Text('いいえ',style: TextStyle(fontWeight: FontWeight.bold),),
                      onPressed: () {Navigator.of(context).pop();}))
            ])],));
  }
  void date() {
    today = DateTime.now();
    DateFormat outputFormat = DateFormat('MM月dd');
    date1 = outputFormat.format(
        DateTime(today.year, today.month, today.day + count1));
    date2 = outputFormat.format(
        DateTime(today.year, today.month, today.day + count2));
    date3 = outputFormat.format(
        DateTime(today.year, today.month, today.day + count3));
    date4 = outputFormat.format(
        DateTime(today.year, today.month, today.day + count4));
    dateSet();
    _loadData1();
    _loadData2();
    _loadData3();
    _loadData4();
  }

  void _loadData1() {
    item1 = [];
    FirebaseFirestore.instance.collection('予約').doc(date1).collection("予約").get().then((
        QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        setState(() {
          item1.add(doc);
          a1();
        });});});}

  void _loadData2() {
    item2 = [];
    FirebaseFirestore.instance.collection('予約').doc(date2).collection("予約").get().then((
        QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        setState(() {
          item2.add(doc);
          a2();
        });});});
  }

  void _loadData3() {
    item3 = [];
    FirebaseFirestore.instance.collection('予約').doc(date3).collection("予約").get().then((
        QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        setState(() {
          item3.add(doc);
          a3();
        });});});
  }

  void _loadData4() {
    item4 = [];
    FirebaseFirestore.instance.collection('予約').doc(date4).collection("予約").get().then((
        QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        setState(() {
          item4.add(doc);
          a4();
        });});});
  }
  void dateSet(){
    da = DateTime(0, 0, 0, 9, 0);
    dateString = outputFormat.format(da);
    dateInt = outputFormat1.format(da);
    da1 = DateTime(0, 0, 0, 22, 0);
    dateIntE = outputFormat1.format(da1);
    difference = da1.difference(da);
    sec = difference.inMinutes;
    sum = sec / 15;
    itemS = [[da,dateInt,dateIntE]];
    itemS2 = [[da,dateInt,dateIntE]];
    itemS3 = [[da,dateInt,dateIntE]];
    itemS4 = [[da,dateInt,dateIntE]];
    item10 = [];item22 = [];item33 = [];item44 = [];
    for (var i = 0; i <= sum; i++) {
      dateString = outputFormat.format(da);
      dateInt = outputFormat1.format(da);
      item10.add([da,dateString, dateInt, true, true, true, true]);
      item22.add([da,dateString, dateInt, true, true, true, true]);
      item33.add([da,dateString, dateInt, true, true, true, true]);
      item44.add([da,dateString, dateInt, true, true, true, true]);
      da = da.add(Duration(minutes: 15));
    }

  }

  void a1() {
    setState(() {
      if (item1.length != 0) {
        itemS = [];
        itemE = [];
        for (var co = 0; co < item10.length; co++) {
          for (var i = 0; i < item1.length; i++) {
            if (item1[i]["開始時間"] <= int.parse(item10[co][2]) == true &&
                int.parse(item10[co][2]) < item1[i]["終了時間"] == true) {
              item10[co][3] = false;
            }}}set();set1();}});
  }
  void a2() {
    setState(() {
      if (item2.length != 0) {
        itemS2 = [];
        for (var co = 0; co < item22.length; co++) {
          for (var i = 0; i < item2.length; i++) {
            if (item2[i]["開始時間"] <= int.parse(item22[co][2]) == true &&
                int.parse(item22[co][2]) < item2[i]["終了時間"] == true) {
              item22[co][3] = false;
            }}}set2();set22();}});  }
  void a3() {
    setState(() {
      if (item3.length != 0) {
        itemS3 = [];
        for (var co = 0; co < item33.length; co++) {
          for (var i = 0; i < item3.length; i++) {
            if (item3[i]["開始時間"] <= int.parse(item33[co][2]) == true &&
                int.parse(item33[co][2]) < item3[i]["終了時間"] == true) {
              item33[co][3] = false;
            }}}set3();set33();}});  }
  void a4() {
    setState(() {
      if (item4.length != 0) {
        itemS4 = [];
        for (var co = 0; co < item44.length; co++) {
          for (var i = 0; i < item4.length; i++) {
            if (item4[i]["開始時間"] <= int.parse(item44[co][2]) == true &&
                int.parse(item44[co][2]) < item4[i]["終了時間"] == true) {
              item44[co][3] = false;
            }}}set4();set44();}});  }

  void set(){
    if (item10[0][3] == true){itemS.add([item10[0][0],item10[0][2]]);}
    for (var co = 1; co < item10.length ; co++) {
      if(item10[co -1][3] == false && item10[co][3] == true){
        itemS.add([item10[co][0],item10[co][2],]);
      }}
  }
  void set1(){
    for (var co = 1; co < item10.length ; co++) {
      if(item10[co -1][3] == true && item10[co][3] == false){
        itemE.add(item10[co][2]);
      }}
    if (item10[item10.length -1][3] == true){itemE.add(item10[item10.length -1][2]);};
    for (var co = 0; co < itemS.length; co++) {
      itemS[co].add(itemE[co]);if(co == itemS.length -1){test1();}
    };}
  void test1() {setState(() {
    for (var co = 0; co < item10.length; co++) {
      for (var i = 0; i < itemS.length; i++) {
        var sum  = outputFormat1.format(item10[co][0].add(Duration(minutes: widget.time)));
        if (int.parse(itemS[i][1]) <= int.parse(item10[co][2]) == true &&int.parse(itemS[i][2]) >= int.parse(item10[co][2]) == true &&
            int.parse(sum) > int.parse(itemS[i][2])  == true) {item10[co][3] = false;}}}});}
  void set2(){
    if (item22[0][3] == true){itemS2.add([item22[0][0],item22[0][2]]);}
    for (var co = 1; co < item22.length; co++) {
      if(item22[co -1][3] == false && item22[co][3] == true){
        itemS2.add([item22[co][0],item22[co][2],]);
      }}
  }
  void set22(){
    for (var co = 1; co < item22.length; co++) {
      if(item22[co -1][3] == true && item22[co][3] == false){
        itemE2.add(item22[co][2]);
      }}
    if (item22[item22.length -1][3] == true){itemE2.add(item22[item22.length -1][2]);};
    for (var co = 0; co < itemS2.length; co++) {
      itemS2[co].add(itemE2[co]);;if(co == itemS2.length -1){test2();}
    }}
  void test2() {setState(() {
    for (var co = 0; co < item22.length; co++) {
      for (var i = 0; i < itemS2.length; i++) {
        var sum  = outputFormat1.format(item22[co][0].add(Duration(minutes: widget.time)));
        if (int.parse(itemS2[i][1]) <= int.parse(item22[co][2]) == true &&int.parse(itemS2[i][2]) >= int.parse(item22[co][2]) == true &&
            int.parse(sum) > int.parse(itemS2[i][2])  == true) {item22[co][3] = false;}}}});}
  void set3(){
    if (item33[0][3] == true){itemS3.add([item33[0][0],item33[0][2]]);}
    for (var co = 1; co < item33.length; co++) {
      if(item33[co -1][3] == false && item33[co][3] == true){
        itemS3.add([item33[co][0],item33[co][2],]);
      }}
  }
  void set33(){
    for (var co = 1; co < item33.length; co++) {
      if(item33[co -1][3] == true && item33[co][3] == false){
        itemE3.add(item33[co][2]);
      }}
    if (item33[item33.length -1][3] == true){itemE3.add(item33[item33.length -1][2]);};
    for (var co = 0; co < itemS3.length; co++) {
      itemS3[co].add(itemE3[co]);;if(co == itemS3.length -1){test3();}
    }}
  void test3() {setState(() {
    for (var co = 0; co < item33.length; co++) {
      for (var i = 0; i < itemS3.length; i++) {
        var sum  = outputFormat1.format(item33[co][0].add(Duration(minutes: widget.time)));
        if (int.parse(itemS3[i][1]) <= int.parse(item33[co][2]) == true &&int.parse(itemS3[i][2]) >= int.parse(item33[co][2]) == true &&
            int.parse(sum) > int.parse(itemS3[i][2])  == true) {item33[co][3] = false;}}}});}
  void set4(){
    if (item44[0][3] == true){itemS4.add([item44[0][0],item4[0][2]]);}
    for (var co = 1; co < item44.length; co++) {
      if(item44[co -1][3] == false && item44[co][3] == true){
        itemS4.add([item44[co][0],item44[co][2],]);
      }}
  }
  void set44(){
    for (var co = 1; co < item44.length; co++) {
      if(item44[co -1][3] == true && item44[co][3] == false){
        itemE4.add(item44[co][2]);
      }}
    if (item44[item44.length -1][3] == true){itemE4.add(item44[item44.length -1][2]);};
    for (var co = 0; co < itemS4.length; co++) {
      itemS4[co].add(itemE4[co]);;if(co == itemS4.length -1){test4();}
    }}
  void test4() {setState(() {
    for (var co = 0; co < item44.length; co++) {
      for (var i = 0; i < itemS4.length; i++) {
        var sum  = outputFormat1.format(item44[co][0].add(Duration(minutes: widget.time)));
        if (int.parse(itemS4[i][1]) <= int.parse(item44[co][2]) == true &&int.parse(itemS4[i][2]) >= int.parse(item44[co][2]) == true &&
            int.parse(sum) > int.parse(itemS4[i][2])  == true) {item44[co][3] = false;}}}});}
  void _loadData()  {
    item = [];
    FirebaseFirestore.instance.collection('メニュー').get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        setState(() {
          item.add(doc);
          ;});});});}
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