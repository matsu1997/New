import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:time_range_picker/time_range_picker.dart';
class EditeResarvation extends StatefulWidget {
  @override
  State<EditeResarvation> createState() => _EditeResarvationState();
}

class _EditeResarvationState extends State<EditeResarvation> {
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
          title: Text(
            "受付時間",
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: Container(
            child: Column(children: <Widget>[
          Container(height:20,width: double.infinity,child: Text("受付時間"),),
          Container(color:Colors.red,height:200,width:double.infinity,
            child: Column(children: [
              Row(children: [Container(width: 40,height: 40,),Container(width: 80,height: 40,alignment:Alignment.center,child: Text("開始")),Container(width: 80,height: 40,alignment:Alignment.center,child: Text("終了")),Expanded(child: Container()),],),
              Row(children: [Container(width: 40,height: 40,child: Icon(Icons.looks_one_outlined),),Container(width: 80,height: 40,alignment:Alignment.center,child: Text("開始")),Container(width: 80,height: 40,alignment:Alignment.center,child: Text("終了")),Expanded(child: Container()),],),
              Row(children: [Container(width: 40,height: 40,child: Icon(Icons.looks_two_outlined),),Container(width: 80,height: 40,alignment:Alignment.center,child: Text("開始")),Container(width: 80,height: 40,alignment:Alignment.center,child: Text("終了")),Expanded(child: Container()),],),


            ],),),
              Expanded(child: Container())
        ])));
  }
}


class Sample extends StatefulWidget {
  Sample({Key? key}) : super(key: key);

  @override
  _SampleState createState() => _SampleState();
}

class _SampleState extends State<Sample> {
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(selectedTime != null
              ? "${selectedTime!.hour}:${selectedTime!.minute}"
              : "Time"),
          SizedBox(
            height: 20,
          ),
          ElevatedButton(
              onPressed: () => _pickTime(context),
              child: const Text("Pick Date"))
        ],
      ),
    );
  }

  Future _pickTime(BuildContext context) async {
    final initialTime = TimeOfDay(hour: 10, minute: 0);

    final newTime =
    await showTimePicker(context: context, initialTime: initialTime);

    if (newTime != null) {
      setState(() => selectedTime = newTime);
    } else {
      return;
    }
  }
}