import 'package:icope/utils/drawer.dart';
import '../utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../record/record_listening.dart';
import '../record/nutri_player.dart';
class Cognitive extends StatefulWidget {
  const Cognitive({Key? key}) : super(key: key);

  @override
  State<Cognitive> createState() => _Cognitive();
}

const TextStyle stringStyle=TextStyle(
    color: Color(0xFF404040),
    fontFamily: 'Akaya',
    fontSize: 20,
    fontWeight: FontWeight.bold
);

class _Cognitive extends State<Cognitive> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: UserDrawer(),
        appBar: AppBar(

          title: const Text('認知能力評估',style: TextStyle(
            color: Colors.white,
            fontSize: 30,
          ),),
          backgroundColor: Colors.deepPurpleAccent,
        ),
        body:buildlist(),
    );

  }

Widget buildlist() {

  nutriRecordState.title = '鉛筆, 手機, 電腦';

  return ListView(

    //Important :Remove any padding from the ListView
    padding: EdgeInsets.zero,
    children: <Widget>[
      SizedBox(height: 50,),
      Padding(
          padding: EdgeInsets.fromLTRB(50, 0, 20, 0),
          child: Text('請選擇今日日期', style: TextStyle(fontSize: 40),)
      ),
      SizedBox(height: 50,),
      Padding(
        padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
        child: ElevatedButton(
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(const Size(150, 65.0)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60))),
            backgroundColor: MaterialStateProperty.all(cognitiveColor),
          ),
          onPressed: () {
            showDialog<String>(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content:
                  Text('異常, 請前往鄰近醫院進行進一步檢查!!!'),
                );
              },
            );
          },
          child: const Text('1/9', style: TextStyle(
              fontWeight: FontWeight.w100,
              color: Colors.white,
              fontSize: 25
          ),
          ),
        ),
      ),
      const SizedBox(height: 30),
      Padding(
        padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
        child: ElevatedButton(
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(const Size(150, 65.0)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60))),
            backgroundColor: MaterialStateProperty.all(cognitiveColor),
          ),
          onPressed: () {
            showDialog<String>(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content:
                  Text('無異常!繼續保持!!!'),
                );
              },
            );
          },
          child: const Text('1/10', style: TextStyle(
              fontWeight: FontWeight.w100,
              color: Colors.white,
              fontSize: 25
          ),
          ),
        ),
      ),
      SizedBox(height: 30,),
      Padding(
        padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
        child: ElevatedButton(
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(const Size(150, 65.0)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60))),
            backgroundColor: MaterialStateProperty.all(cognitiveColor),
          ),
          onPressed: () {
            showDialog<String>(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content:
                  Text('異常, 請前往鄰近醫院進行進一步檢查!!!'),
                );
              },
            );
          },
          child: const Text('1/11', style: TextStyle(
              fontWeight: FontWeight.w100,
              color: Colors.white,
              fontSize: 25
          ),
          ),
        ),
      ),
      SizedBox(height: 50,),
      Padding(
          padding: EdgeInsets.fromLTRB(50, 0, 20, 0),
          child: Text('請記住以下播放的三個單詞',style: TextStyle(fontSize: 40),)
      ),
      SizedBox(height: 50,),
      Padding(
        padding: EdgeInsets.fromLTRB(200, 0, 20, 0),
        child: nutriRecord(),
      ),
      SizedBox(height: 50,),

      listenRecord(),
      SizedBox(height: 50,),
      Padding(
        padding: EdgeInsets.fromLTRB(50, 0, 50, 0),
        child: ElevatedButton(
          style: ButtonStyle(
            fixedSize: MaterialStateProperty.all(const Size(150, 65.0)),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(60))),
            backgroundColor: MaterialStateProperty.all(kPrimaryColor),
          ),
          onPressed: () {
            final contains361 = listenRecordState.recordOutput.contains('3');
            if(contains361) {
              showDialog<String>(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content:
                    Text('答對了! 認知能力正常, 請繼續保持'),
                  );
                },
              );
            }
            else{
              showDialog<String>(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    content:
                    Text('答錯了, 異常, 請前往鄰近醫院進行進一步檢查!!!'),
                  );
                },
              );
            }
          },
          child: const Text('送出三個單詞', style: TextStyle(
              fontWeight: FontWeight.w100,
              color: Colors.white,
              fontSize: 25
          ),
          ),
        ),
      ),
      SizedBox(height: 50,),
    ],
  );
}
}