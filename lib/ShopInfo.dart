
import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.Dart';
class ShopInfo extends StatefulWidget {
  @override
  State<ShopInfo> createState() => _ShopInfoState();
}
class _ShopInfoState extends State<ShopInfo> {
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
          title:Text("店舗情報",style: TextStyle(fontWeight: FontWeight.bold,color:Colors.black),),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: Container(
            child: Stack(
                children: <Widget>[
                  new Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        colorFilter: ColorFilter.mode(
                          Colors.white.withOpacity(0.5),
                          BlendMode.dstATop,
                        ),
                        image: AssetImage("images/ベッド.jpg"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  new SingleChildScrollView(
                      child: Column(children: <Widget>[
                        Container(color:Colors.white,width: double.infinity, child: Column(children: [Container(margin:EdgeInsets.all(5),child: Text("店舗名",style: TextStyle(fontWeight: FontWeight.bold,),),),Container(margin:EdgeInsets.all(5),child: Text("あさみ鍼灸ボディケア",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey)))],)),
                        new Divider(height:1,color: Colors.black),
                        Container(color:Colors.white,width: double.infinity,  child: Column(children: [Container(margin:EdgeInsets.all(5),child: Text("電話番号",style: TextStyle(fontWeight: FontWeight.bold,)),),Container(margin:EdgeInsets.all(5), child: TextButton(onPressed: (){_open();},
                            child: Text('090-9649-0107',style: TextStyle(color:Colors.blue, fontWeight: FontWeight.bold,))))],))
                        ,new Divider(height:1,color: Colors.black),
                        Container(color:Colors.white,width: double.infinity,  child: Column(children: [Container(margin:EdgeInsets.all(5),child: Text("営業時間",style: TextStyle(fontWeight: FontWeight.bold,)),),Container(margin:EdgeInsets.all(5),child: Text("10:00 - 18:00",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey)))],))
                        ,new Divider(height:1,color: Colors.black),
                        Container(
                            color:Colors.white,width: double.infinity,
                            child: Stack(children: <Widget>[Container(color:Colors.white,width: double.infinity,child: Column(children: [Container(margin:EdgeInsets.all(5),child: Text("住所",style: TextStyle(fontWeight: FontWeight.bold,)),),Container(margin:EdgeInsets.all(5),child: Text("神奈川県秦野市入船町3-10",style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey))),],)),Container(width: 70, color:Colors.white,alignment: Alignment.centerRight, child: IconButton(icon: Icon(Icons.pin_drop), onPressed: () {},),)],)),
                        Container(child: Divider(height:1,color: Colors.black)),
                        Container(color:Colors.white,width: double.infinity,  child: Column(children: [Container(margin:EdgeInsets.all(5),child: Text("アクセス",style: TextStyle(fontWeight: FontWeight.bold,)),),Container(margin:EdgeInsets.all(5),child: Text("秦野駅から徒歩15分\nイオン秦野店から徒歩２分",textAlign: TextAlign.center,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.grey)))],))
                        ,new Divider(height:1,color: Colors.black),
                      ]))]))
    );
  }
  void _open() {
    const tel = '09096490107';
    _launchURL('tel:' + tel,);}
  Future<void> _launchURL(String url) async {
    if (await canLaunch(url)) {await launch(url);
    } else {final Error error = ArgumentError('Could not launch $url');throw error;}}
  void map(){
    final url =
        'https://www.google.com/maps/search/?api=1&query=${"35.378038"},${"139.230758"}';
    // if (await canLaunch(url)) {
    //   launch(url, forceSafariVC: false);
    // }
  }

}