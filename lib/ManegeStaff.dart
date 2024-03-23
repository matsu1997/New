import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'StaffAdd.dart';

class ManegeST extends StatefulWidget {
  @override
  State<ManegeST> createState() => _ManegeSTState();
}

class _ManegeSTState extends State<ManegeST> {
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            title:Text("店舗管理",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),),
            iconTheme: IconThemeData(color: Colors.black),
            centerTitle: true,
            actions: <Widget>[],
            bottom: const TabBar(
              tabs: [
                Tab(child: Text("店舗管理",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),),
                Tab(child: Text("スタッフ管理",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),),),
              ],),),
          body: TabBarView(children: [ManegeShop(), ManegeStaff(),],),
        ),),);}
}


class ManegeShop extends StatefulWidget {
  @override
  State<ManegeShop> createState() => _ManegeShopState();
}
class _ManegeShopState extends State<ManegeShop> {
  @override
  void initState() {
    super.initState();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
                      child: Column(children: <Widget>[
                        Container(margin: EdgeInsets.all(10), decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                            boxShadow: [BoxShadow(color: Colors.grey.shade300,spreadRadius: 5, blurRadius: 5, offset: Offset(1.5, 1.5),),],
                            color: Colors.white,),
                          child: Column(children:[Container(width: double.infinity,height: 200,child: Text("営業時間"),)]),),
                        Container(margin: EdgeInsets.all(10), decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                          boxShadow: [BoxShadow(color: Colors.grey.shade300,spreadRadius: 5, blurRadius: 5, offset: Offset(1.5, 1.5),),],
                          color: Colors.white,),
                          child: Column(children:[Container(width: double.infinity,height: 200,child: Text("スタンプカード"),)]),),
                        Container(margin: EdgeInsets.all(10), decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                          boxShadow: [BoxShadow(color: Colors.grey.shade300,spreadRadius: 5, blurRadius: 5, offset: Offset(1.5, 1.5),),],
                          color: Colors.white,),
                          child: Column(children:[Container(width: double.infinity,height: 200,child: Text("売上"),)]),),
                        Container(margin: EdgeInsets.all(10), decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                          boxShadow: [BoxShadow(color: Colors.grey.shade300,spreadRadius: 5, blurRadius: 5, offset: Offset(1.5, 1.5),),],
                          color: Colors.white,),
                          child: Column(children:[Container(width: double.infinity,height: 200,child: Text("営業時間"),)]),)
                      ])));
  }
}

class ManegeStaff extends StatefulWidget {
  @override
  State<ManegeStaff> createState() => _ManegeStaffState();
}
class _ManegeStaffState extends State<ManegeStaff> {
  var item = [];
  final tags = [];
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
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => StaffAdd()),);},
        ),
        body:Container(
            child: Column(children: <Widget>[
              Expanded(
                child: ListView.builder(
                  itemCount: item.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => StaffEdite()),).then((value) {_loadData();});
                          },
                    child:  Card(
                      shadowColor: Colors.grey[100],
                      elevation: 8,
                      clipBehavior: Clip.antiAlias,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      child: Container(
                        margin: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(1),),
                        child: Column(
                          children: [Container(
                            margin: EdgeInsets.only(top:10,left: 10,right: 5),
                            child: Text(item[index]["名前"],style: TextStyle(fontSize:20,fontWeight: FontWeight.bold,color:Colors.black)),),
                           Container( margin: EdgeInsets.only(top:10),child:Text("出勤日")),
                            Container(child:GridView.count(
                                padding: EdgeInsets.all(1.0),
                                crossAxisCount: 7,
                                shrinkWrap: true,
                                children: List.generate(item[index]["出勤日"].length, (index1) {
                                  return Container(
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: Column(children: <Widget>[
                                        Container(
                                          child: FittedBox(
                                              fit: BoxFit.fitWidth,
                                              child:Text(item[index]["出勤日"][index1],style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold,fontSize: 20),)
                                          ),),
                                      ]));})))
                          ]))));},),),
            ])));
  }
  void _loadData()  {
    item = [];
    FirebaseFirestore.instance.collection('スタッフ').get().then((QuerySnapshot snapshot) {
      snapshot.docs.forEach((doc) {
        setState(() {
          item.add(doc);
          print(doc["出勤日"]);
          ;});});});}
}


// class StaffAdd extends StatefulWidget {
//   @override
//   State<StaffAdd> createState() => _StaffAddState();
// }
// class _StaffAddState extends State<StaffAdd> {
//   var name = "";
//   final tags = ["月","火","水","木","金","土","日"];
//   var selectedTags = <String>[];
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
//           title:Text("追加",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),),
//           iconTheme: IconThemeData(color: Colors.black),
//           centerTitle: true,
//         ),
//         body: Container(
//             child: Column(children: <Widget>[
//               Container(margin: EdgeInsets.only(left: 20,right: 20,top: 20),
//                 child: TextFormField(
//                   decoration: InputDecoration(labelText: '名前'),
//                   onChanged: (String value) {
//                     setState(() {name = value;});},
//                 ),),
//               Container(margin: EdgeInsets.only(left: 20,right: 20,top: 20),
//                child: Text("出勤日"),),
//               Container(margin: EdgeInsets.only(left: 20,right: 20,top: 20),
//                 child: Wrap(
//                   runSpacing: 7, spacing: 7,
//                   children: tags.map((tag) {
//                     // selectedTags の中に自分がいるかを確かめる
//                     final isSelected = selectedTags.contains(tag);
//                     return InkWell(
//                       borderRadius: const BorderRadius.all(Radius.circular(32)),
//                       onTap: () {
//                         if (isSelected) {// すでに選択されていれば取り除く
//                           selectedTags.remove(tag);
//                         } else {// 選択されていなければ追加する
//                           selectedTags.add(tag);
//                         }setState(() {});
//                       },
//                       child: AnimatedContainer(
//                         duration: const Duration(milliseconds: 200),
//                         padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
//                         decoration: BoxDecoration(
//                           borderRadius: const BorderRadius.all(Radius.circular(32)),
//                           border: Border.all(width: 2, color: Colors.orange,),
//                           color: isSelected ? Colors.orange : null,
//                         ),
//                         child: Text(tag, style: TextStyle(
//                           color: isSelected ? Colors.white : Colors.orange, fontWeight: FontWeight.bold,
//                         ),),),);}).toList(),
//                 ),),
//               Container(
//                 margin: EdgeInsets.only(top:50),
//                 child: ElevatedButton(
//                   child: const Text('登録'),
//                   style: ElevatedButton.styleFrom(
//                     primary: Colors.blue,
//                     onPrimary: Colors.white,
//                     shape: const StadiumBorder(),),
//                   onPressed: () {send();},
//                 ),),
//             ])));
//   }
//   String randomString(int length) {
//     const _randomChars =
//         "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789";
//     const _charsLength = _randomChars.length;
//     final rand = new Random();
//     final codeUnits = new List.generate(
//       length,
//           (index) {
//         final n = rand.nextInt(_charsLength);
//         return _randomChars.codeUnitAt(n);
//       },);
//     return new String.fromCharCodes(codeUnits);
//   }
//   void send(){
//     var Id = randomString(20);
//     FirebaseFirestore.instance.collection('スタッフ').doc(Id).set({
//       "名前":name,
//       "Id":Id,
//       "出勤日":selectedTags,
//     });;Navigator.of(context).pop();}
// }


class StaffEdite extends StatefulWidget {
  @override
  State<StaffEdite> createState() => _StaffEditeState();
}
class _StaffEditeState extends State<StaffEdite> {
  @override
  void initState() {
    super.initState();
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title:Text("編集",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),),
          iconTheme: IconThemeData(color: Colors.black),
          centerTitle: true,
        ),
        body: Container(
            child: Column(children: <Widget>[
              Expanded(
                child: Text(""),),
              Container()
            ])));
  }
}