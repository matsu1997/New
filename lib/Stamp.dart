//
// import 'dart:math';
//
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
//
// import 'PassWord.dart';
// import 'SignUp.dart';
//
// class Stamp extends StatefulWidget {
//   @override
//   State<Stamp> createState() => _StampState();
// }
// class _StampState extends State<Stamp> {
//   var uid = "";
//   @override
//   void initState() {
//     super.initState();
//    aa();
//   }
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//   }
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.white,
//           title:Text("スタンプカード",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),),
//           centerTitle: true,
//           iconTheme: IconThemeData(color: Colors.black),
//           actions: <Widget>[
//             IconButton(
//                 onPressed: () {//loadData();
//                 },
//                 icon: Icon(Icons.refresh_rounded))
//           ],
//         ),
//         body: Container(
//             child: Stack(
//                 children: <Widget>[
//                   new Container(color: Colors.white,),
//                   new SingleChildScrollView(
//                       child: Column(children: <Widget>[
//                         Container(
//                           margin: EdgeInsets.only(top:20),
//                           child: Column(
//                             children: [
//                               Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                 children: [
//                                   Expanded(child:AspectRatio(aspectRatio: 1,
//                                       child:Container(margin: EdgeInsets.all(10),
//                                         decoration: BoxDecoration(
//                                           image: DecorationImage(fit: BoxFit.cover,
//                                             image: AssetImage("images/1.PNG"),),
//                                           border: Border.all(color: Colors.white),
//                                           borderRadius: BorderRadius.circular(10),
//                                           color: Colors.white,),)),),
//                                   Expanded(child:AspectRatio(aspectRatio: 1,
//                                       child:Container(margin: EdgeInsets.all(10),
//                                         decoration: BoxDecoration(
//                                           image: DecorationImage(fit: BoxFit.cover,
//                                             image: AssetImage("images/2.PNG"),),
//                                           border: Border.all(color: Colors.white),
//                                           borderRadius: BorderRadius.circular(10),
//                                           color: Colors.white,),)),),
//                                   Expanded(child:AspectRatio(aspectRatio: 1,
//                                       child:Container(margin: EdgeInsets.all(10),
//                                         decoration: BoxDecoration(
//                                           image: DecorationImage(fit: BoxFit.cover,
//                                             image: AssetImage("images/3.PNG"),),
//                                           border: Border.all(color: Colors.white),
//                                           borderRadius: BorderRadius.circular(10),
//                                           color: Colors.white,),)),),
//                                   Expanded(child:AspectRatio(aspectRatio: 1,
//                                       child:Container(margin: EdgeInsets.all(10),
//                                         decoration: BoxDecoration(
//                                           image: DecorationImage(fit: BoxFit.cover,
//                                             image: AssetImage("images/4.PNG"),),
//                                           border: Border.all(color: Colors.white),
//                                           borderRadius: BorderRadius.circular(10),
//                                           color: Colors.white,),)),),
//                                   Expanded(child:AspectRatio(aspectRatio: 1,
//                                       child:Container(margin: EdgeInsets.all(10),
//                                         decoration: BoxDecoration(
//                                           image: DecorationImage(fit: BoxFit.cover,
//                                             image: AssetImage("images/5.PNG"),),
//                                           border: Border.all(color: Colors.white),
//                                           borderRadius: BorderRadius.circular(10),
//                                           color: Colors.white,),)),),
//                                 ],),
//                               Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                                 children: [
//                                   Expanded(child:AspectRatio(aspectRatio: 1,
//                                       child:Container(margin: EdgeInsets.all(10),
//                                         decoration: BoxDecoration(
//                                           image: DecorationImage(fit: BoxFit.cover,
//                                             image: AssetImage("images/6.PNG"),),
//                                           border: Border.all(color: Colors.white),
//                                           borderRadius: BorderRadius.circular(10),
//                                           color: Colors.white,),)),),
//                                   Expanded(child:AspectRatio(aspectRatio: 1,
//                                       child:Container(margin: EdgeInsets.all(10),
//                                         decoration: BoxDecoration(
//                                           image: DecorationImage(fit: BoxFit.cover,
//                                             image: AssetImage("images/7.PNG"),),
//                                           border: Border.all(color: Colors.white),
//                                           borderRadius: BorderRadius.circular(10),
//                                           color: Colors.white,),)),),
//                                   Expanded(child:AspectRatio(aspectRatio: 1,
//                                       child:Container(margin: EdgeInsets.all(10),
//                                         decoration: BoxDecoration(
//                                           image: DecorationImage(fit: BoxFit.cover,
//                                             image: AssetImage("images/8.PNG"),),
//                                           border: Border.all(color: Colors.white),
//                                           borderRadius: BorderRadius.circular(10),
//                                           color: Colors.white,),)),),
//                                   Expanded(child:AspectRatio(aspectRatio: 1,
//                                       child:Container(margin: EdgeInsets.all(10),
//                                         decoration: BoxDecoration(
//                                           image: DecorationImage(fit: BoxFit.cover,
//                                             image: AssetImage("images/9.PNG"),),
//                                           border: Border.all(color: Colors.white),
//                                           borderRadius: BorderRadius.circular(10),
//                                           color: Colors.white,),)),),
//                                   Expanded(child:AspectRatio(aspectRatio: 1,
//                                       child:Container(margin: EdgeInsets.all(10),
//                                         decoration: BoxDecoration(
//                                           image: DecorationImage(fit: BoxFit.cover,
//                                             image: AssetImage("images/10.PNG"),),
//                                           border: Border.all(color: Colors.white),
//                                           borderRadius: BorderRadius.circular(10),
//                                           color: Colors.white,),)),),
//                                 ],),
//                               Container(
//                                 margin: EdgeInsets.only(top:20),
//                                 width: double.infinity,
//                                 height: 80,
//                                 color: Colors.grey[100],
//                                 child: Row(children: [
//                                   Container(
//                                       child: Icon(Icons.airplane_ticket, //設定したいアイコンのID
//                                           color: Colors.pink, // 色
//                                           size: 80 //サイズ
//                                       )),
//                                   Expanded(
//                                     child: Text("500円offクーポン" ,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,)),
//                                   ),
//                                   Container(
//                                       height: 80,width: 80,
//                                       child: TextButton(
//                                           onPressed: (){print("button press !!");},
//                                           child: Text('Get',style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold,)))
//                                   )
//                                 ],),
//                               )
//                             ],
//                           ),
//                         )]))])));}
//   void aa (){
//     FirebaseAuth.instance
//         .authStateChanges()
//         .listen((User? user) {
//       if (user == null) {
//         print('User is currently signed out!');
//         Future(() {
//           Navigator.push(context, MaterialPageRoute(builder: (context) {
//             return SignUp();
//           }));})
//         ;} else {
//         print('User is signed in!');
//         uid = user.uid;
//       }
//     });
//   }
// }
//
// class StampGet extends StatefulWidget {
//   @override
//   State<StampGet> createState() => _StampGetState();
// }
// class _StampGetState extends State<StampGet> {
//   String infoText = '';
//   String email = '';
//   String password = '';
//   var uid = "";
//   var name = 0;
//   var item = [];
//   var _controller = TextEditingController();
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
//       appBar: AppBar(
//         backgroundColor: Colors.white,
//         title: Text("スタンプGet",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),),
//         iconTheme: IconThemeData(color: Colors.black),
//         centerTitle: true,),
//       body: Center(
//         child: Container(
//           padding: EdgeInsets.all(24),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//               // メールアドレス入力
//               Text("現在の合計金額："+ name.toString() + "円"),
//               FittedBox(
//                 fit: BoxFit.fitWidth,
//                 child:Text("　　　　　　",style: TextStyle(color: Colors.red,),),),
//               TextFormField(
//                 keyboardType: TextInputType.number,
//                 inputFormatters: [FilteringTextInputFormatter.digitsOnly],
//                 controller: _controller,
//                 decoration: InputDecoration(labelText:"今日の値段"),
//                 onChanged: (String value) {
//                   setState(() {
//                     email = value;
//                   });
//                 },
//               ),
//               Container(
//                 width: double.infinity,
//                 child: ElevatedButton(
//                   child: Text('付与'),
//                   onPressed: ()  {
//                     // Add();
//                   },
//                 ),
//               ) ,],),),),);}
// }


import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'SignUp.dart';

class Stamp extends StatefulWidget {
  @override
  State<Stamp> createState() => _StampState();
}
class _StampState extends State<Stamp> {
  var uid = "";
  var item = [];
  var point = 0;
  var userPoint = 0;
  var index0 = 0;
  var get = false;
  @override
  void initState() {
    super.initState();
   aa();
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
          title:Text("スタンプカード",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
          actions: <Widget>[
            IconButton(onPressed: () {user1();}, icon: Icon(Icons.refresh_rounded))
          ],
        ),
        body:  Container(
            child: Column(children: <Widget>[
              Text("現在のポイント"),
              Text(userPoint.toString()),
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
                          children: [
                            Container(child:
                            Row(children: [
                              Container(
                                margin: EdgeInsets.only(top:10,left: 10,right: 5),
                                alignment: Alignment.center,
                                child: Text(item[index]["text"],style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color:Colors.black)),),
                              Container(margin: EdgeInsets.only(top:10,left: 10,right: 5),child: Text("必要ポイント:" + item[index]["ポイント"].toString(),style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey),),),
                            ],),),
                         Container(child:
                            Row(children: [Container(
                                height: 100,width: 100,
                                margin: EdgeInsets.only(top: 10,left: 10,right: 10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  image: DecorationImage(
                                    image: NetworkImage(item[index]["imageId"]),
                                    fit: BoxFit.fill,),)),
                              Expanded(child: Text(item[index]["subText"],style: TextStyle(fontWeight: FontWeight.bold,color:Colors.grey),),)],),),
                            Container(
                              margin: EdgeInsets.all(10),
                              width: double.infinity,
                              child: ElevatedButton(child: Text("Get"), onPressed: () {index0 = index;point = item[index0]["ポイント"];
                                if (point <= userPoint){get = true;}else{ get = false;}alert();
                                },),)],
                        ),),);},),),
              Container()
            ])));}
  void alert (){
    showDialog(context: context, builder: (context) =>
        AlertDialog(
          title: Text("このチケットをGETしますか？",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,),),
          actions: <Widget>[
            Column(children: [
              Container(
                margin: EdgeInsets.all(10),width: double.infinity,
                child: ElevatedButton(
                  child: Text('使う',style: TextStyle(fontWeight: FontWeight.bold),),
                  onPressed:  !get ? null : () {sum();},),)],)
          ],));
  }
  void sum (){
    var Id = randomString(20);
    setState(() {
      userPoint = userPoint - point;
      FirebaseFirestore.instance.collection('users').doc(uid).collection("データ").doc("スタンプ").update({
        "金額": userPoint});
      FirebaseFirestore.instance.collection('users').doc(uid).collection("チケット").doc(Id).set({
        "text": item[index0]["text"],
        "subText":item[index0]["subText"],
        "有効期限":item[index0]["有効期限"],
        'imageId': item[index0]["imageId"],
        "Id":Id,
        });});index0 = 0;Navigator.of(context).pop();
  }
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
    return new String.fromCharCodes(codeUnits);}

  void aa (){
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        Future(() {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return SignUp();
          }));})
        ;} else {
        uid = user.uid;
        user1();
      }});}
  void _loadData()  {
    item = [];
    FirebaseFirestore.instance.collection('スタンプ').get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        setState(() {
          item.add(doc);
          ;});});});}
  void user1()  {
    FirebaseFirestore.instance.collection('users').doc(uid).collection("データ").where("データ", isEqualTo: "スタンプ").get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        setState(() {
          userPoint = doc["金額"];
          ;});});});}
}

