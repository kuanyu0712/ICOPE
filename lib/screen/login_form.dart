import 'package:flutter/material.dart';
import 'package:icope/main.dart';
import 'package:icope/user/user.dart';
import 'package:icope/user/user_api.dart';
import '../utils/constants.dart';
import '../utils/alert_dialog.dart';

class LoginForm extends StatelessWidget {

  LoginForm({
    Key? key,
  }) : super(key: key);

  Color cursorColor = Color(0xFFD78F50);
  Color fillColor = Color(0xFFF6D9C2);
  Color loginBtnColor = Color(0xffe8ad4a);


  // listen to input text
  final TextEditingController idController=TextEditingController();
  final TextEditingController pwdController=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Form(
      child: Column(
        children: [


      Padding(
        padding: const EdgeInsets.all(defaultPadding),
        child: TextFormField(
          controller: idController,
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
              keyboardType: TextInputType.emailAddress,
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
                hintText:"你的手機",
                hintStyle: TextStyle(fontSize: 20,),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Icon(Icons.phone_android,color: Colors.white,size: 40,),
                ),
              ),
            ),
        ),

          const SizedBox(height: defaultPadding),
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: TextFormField(
              controller: pwdController,
              style: TextStyle(
                  fontSize: 30,
                  height: 30/30
              ),
              textInputAction: TextInputAction.done,
              obscureText: true,
              cursorColor: cursorColor,
              cursorWidth: 3,
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
                hintText:"你的密碼",
                hintStyle: TextStyle(fontSize: 20,),
                prefixIcon: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Icon(Icons.lock,color: Colors.white,size: 40,),
                ),
              ),
            ),
          ),

          const SizedBox(height: defaultPadding),


          Hero(
            tag: "login_btn",
            child : TextButton(
              style: ButtonStyle(
                fixedSize: MaterialStateProperty.all(const Size(330,65.0)),
                shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius:BorderRadius.circular(60))),
                backgroundColor: MaterialStateProperty.all(loginBtnColor),
              ),
              onPressed: () async{
                if(idController.text == "" || pwdController.text == ""){
                  String message = '請確認是否填寫正確手機號碼與密碼';
                  String title = '請填寫完整資料';
                  showDialog<String>(
                    context: context,
                    builder: (BuildContext context) =>ShowAlertDialog(title: title, message:message),
                  );
                }else{
                  bool exist = await UserApi.checkUser(idController.text,pwdController.text );
                  if(exist){
                    MyApp.userid = idController.text;

                    MyApp.username = await UserApi.findUserName(MyApp.userid);
                    idController.text = "";
                    pwdController.text = "";

                    Navigator.pushNamed(context, '/main');
                  }else{
                      showDialog<String>(
                        context: context,
                        builder: (BuildContext context) =>ShowAlertDialog(title: '登入資料錯誤',message:'此用戶不存在'),
                      );
                  }
                }
              },
                child: const Text('登入',style: TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Colors.white,
                    fontSize: 25
                ),),
            ),
          ),
          const SizedBox(height: defaultPadding),

          TextButton(
            onPressed: () async{

              Navigator.pushNamed(context, '/signup');
            },
            child: const Text('註冊新帳號',style: TextStyle(
                fontWeight: FontWeight.w300,
                color: Colors.orange,
                fontSize: 25
            ),),
          ),
        ],
      ),
    );
  }
}