
import 'package:flutter/material.dart';
import 'package:icope/utils/drawer.dart';
import 'package:icope/utils/alert_dialog.dart';

import '../record/record.dart';
import '../timer_model.dart';
import 'dart:async';
import 'package:flutter/services.dart';


Color cursorColor = Color(0xFFD78F50);
Color fillColor = Color(0xFFF6D9C2);
Color loginBtnColor = Color(0xffe8ad4a);
final TextEditingController timesController=TextEditingController();
class Ability extends StatefulWidget {
  const Ability({Key? key}) : super(key: key);

  @override
  State<Ability> createState() => _Ability();
}

const TextStyle stringStyle=TextStyle(
    color: Color(0xFF404040),
    fontFamily: 'Akaya',
    fontSize: 20,
    fontWeight: FontWeight.bold
);



class _Ability extends State<Ability> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: UserDrawer(),
        appBar: AppBar(
          title: const Text('行動能力評估',style: TextStyle(
            color: Colors.black87,
            fontSize: 30,
          ),),
          backgroundColor: Color(0xFFFEE9F2),
          // actions: [
          //   IconButton(
          //     iconSize: 35,
          //     color: Colors.white,
          //     onPressed: () {
          //       Navigator.pushNamed(context, '/favorite');
          //     },
          //     icon: const Icon(Icons.settings),
          //   ),
          // ],
        ),
        body: Column(

          children: [

            SizedBox(height: 50,),
            Padding(
                padding: EdgeInsets.fromLTRB(30, 0, 30, 30),
                child: Text('請在12秒內雙手抱胸起立坐下15次',style: TextStyle(fontSize: 40),)
            ),
            TimerModel(),

            Padding(
              padding: EdgeInsets.fromLTRB(30, 20, 30, 30),
              child: TextFormField(
                controller: timesController,
                onChanged: (String text){
                  if(text==""){

                  }
                },
                style: TextStyle(
                    fontSize: 30,
                    height: 30/30
                ),
                cursorColor: cursorColor,
                cursorWidth: 3,
                keyboardType: TextInputType.number,
                inputFormatters: <TextInputFormatter>[
                  FilteringTextInputFormatter.digitsOnly
                ],
                textInputAction: TextInputAction.next,
                // cursorColor: kPrimaryColor,
                onSaved: (email) {},
                decoration: InputDecoration(
                  filled: true,
                  fillColor: fillColor,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.transparent,
                    ),
                    borderRadius: BorderRadius.circular(50.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(50.0),
                    borderSide: BorderSide(color: Colors.transparent), ),
                  hintText:"輸入完成幾次",
                  hintStyle: TextStyle(fontSize: 20,),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Icon(Icons.add_box_rounded ,color: Colors.white,size: 40,),
                  ),
                ),
              ),
            ),
            Hero(
              tag: "login_btn",
              child: ElevatedButton(
                style: ButtonStyle(
                  fixedSize: MaterialStateProperty.all(const Size(330,65.0)),
                  shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius:BorderRadius.circular(60))),
                  backgroundColor: MaterialStateProperty.all(loginBtnColor),
                ),
                onPressed: (){
                  if(int.parse(timesController.text) >= 15){
                    showDialog<String>(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text('很棒!繼續保持'),
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
                          Text('行動能力異常:\n世界衛生組織關於身體活動的全球建議\n1. 每周運動至少10分鐘\n2. 每周進行兩天或更多的肌力運動\n3. 若不能按照建議運動,那就盡可能地多運動'),
                        );
                      },
                    );
                  }
                },
                child: const Text('送出',style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                    fontSize: 25
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }


}