import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Acount.dart';
import 'EditeBuy.dart';
import 'EditeColum.dart';
import 'EditeGift.dart';
import 'EditeMenu.dart';
import 'EditeNews.dart';
import 'EditeStamp.dart';
import 'EditeTicket.dart';
import 'ManegeStaff.dart';
import 'MessageAll.dart';
import 'Resarvation.dart';

class Manege extends StatefulWidget {
  @override
  State<Manege> createState() => _ManegeState();
}

class _ManegeState extends State<Manege> {
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
          title: Text("管理者画面", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),),
          centerTitle: true,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: SingleChildScrollView(
            child: Column(children: <Widget>[
          Container(width: double.infinity,height: 60,
            child:OutlinedButton.icon(icon: Icon(Icons.add_reaction),
              label: Text('顧客情報', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
              onPressed: () {  Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => Acount()),);},),),
              Container(width: double.infinity,height: 60,
                child:OutlinedButton.icon(icon: Icon(Icons.add_business),
                  label: Text('予約', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  onPressed: () {  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => Resarvation()),);},),),
              Container(width: double.infinity,height: 60,
                child:OutlinedButton.icon(icon: Icon(Icons.menu_book),
                  label: Text('メニュー編集', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  onPressed: () {  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EditeMenu()),);},),),
              Container(width: double.infinity,height: 60,
                child:OutlinedButton.icon(icon: Icon(Icons.monetization_on),
                  label: Text('物販', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  onPressed: () {  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EditeBuy()),);},),),
              Container(width: double.infinity,height: 60,
                child:OutlinedButton.icon(icon: Icon(Icons.border_color_rounded),
                  label: Text('コラム', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  onPressed: () {  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EditeColum()),);},),),
              Container(width: double.infinity,height: 60,
                child:OutlinedButton.icon(icon: Icon(Icons.airplane_ticket),
                  label: Text('チケット', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  onPressed: () {  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EditeTicket()),);},),),
              Container(width: double.infinity,height: 60,
                child:OutlinedButton.icon(icon: Icon(Icons.card_giftcard),
                  label: Text('ギフト', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  onPressed: () {  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EditeGift()),);},),),
              Container(width: double.infinity,height: 60,
                child:OutlinedButton.icon(icon: Icon(Icons.stars_sharp),
                  label: Text('スタンプ', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  onPressed: () {  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EditeStamp()),);},),),
              Container(width: double.infinity,height: 60,
                child:OutlinedButton.icon(icon: Icon(Icons.sunny),
                  label: Text('最新情報', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  onPressed: () {  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => EditeNews()),);},),),
              Container(width: double.infinity,height: 60,
                child:OutlinedButton.icon(icon: Icon(Icons.person_pin),
                  label: Text('施術者管理', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  onPressed: () {  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => ManegeST()),);},),),
              Container(width: double.infinity,height: 60,
                child:OutlinedButton.icon(icon: Icon(Icons.comment),
                  label: Text('メッセージ', style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  onPressed: () {  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => MessageAll()),);},),),
        ])));
  }
}
