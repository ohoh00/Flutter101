import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Register extends StatefulWidget {
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final fromkey = GlobalKey<FormState>();
  String names, emails, passwords;

  Widget registerButtor() {
    return IconButton(
        icon: Icon(Icons.cloud_upload),
        onPressed: () {
          print('you click');
          if (fromkey.currentState.validate()) {
            //fromkey.currentState.validate() เป็นการเช็คว่ากรอกทุกช่องไหม
            fromkey.currentState.save();
            print('name = $names , email = $emails , password = $passwords');
            registerThread();
          }
        });
  }

  //<void> ฟังชั่นประเภท void
  //registerThread เป็นฟังชั่นโยนข้อมูลเข้า firebase
  //await รอจนกว่าจะทำงานสำเร็จ
  //.then จะทำงานเมื่อส่งข้อมูลเข้าสำเร็จ
  Future<void> registerThread() async {
    FirebaseAuth firebaseAuth = FirebaseAuth.instance; //เรียกใช้ FirebaseAuth
    await firebaseAuth.createUserWithEmailAndPassword(
        email: emails, password: passwords).then((response){
          print('Register Success for Email = $emails');
        }).catchError((response){ 
          String title = response.code;
          String message = response.message;
          print('title = $title , message = $message');
        });
  }

  //Wicget Field
  Widget nameText() {
    return TextFormField(
      style: TextStyle(color: Colors.purple),
      decoration: InputDecoration(
          icon: Icon(
            Icons.face,
            color: Colors.purple,
            size: 48.0,
          ),
          labelText: 'Name :',
          labelStyle:
              TextStyle(color: Colors.purple, fontWeight: FontWeight.bold),
          helperText: 'Type Your Nick Name for Display',
          helperStyle:
              TextStyle(color: Colors.purple, fontStyle: FontStyle.italic)),
      validator: (String value) {
        //ตรวจสอบการกรอก
        if (value.isEmpty) {
          //.isEmptyเป็นการเช็คว่าค่าว่างเปล่าไหม
          return 'Please Fill Youe Name in the Blank';
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        names = value
            .trim(); //.trim() ถ้าการกรอกมีช่องว่างข้างหน้า ข้างหลังจะทำการตัดทิ้งอัตโนมัติ
      },
    );
  }

  Widget emailText() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      style: TextStyle(color: Colors.blue.shade800),
      decoration: InputDecoration(
          icon: Icon(
            Icons.email,
            color: Colors.blue.shade800,
            size: 48.0,
          ),
          labelText: 'Email :',
          labelStyle: TextStyle(
              color: Colors.blue.shade800, fontWeight: FontWeight.bold),
          helperText: 'Type Your Email',
          helperStyle:
              TextStyle(color: Colors.purple, fontStyle: FontStyle.italic)),
      validator: (String value) {
        if (!((value.contains('@')) && (value.contains('.')))) {
          return 'Please Type Email in Exp. You@email.com';
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        emails = value.trim();
      },
    );
  }

  Widget passwordText() {
    return TextFormField(
      style: TextStyle(color: Colors.green.shade700),
      decoration: InputDecoration(
          icon: Icon(
            Icons.lock,
            color: Colors.green.shade700,
            size: 48.0,
          ),
          labelText: 'Password :',
          labelStyle: TextStyle(
              color: Colors.green.shade700, fontWeight: FontWeight.bold),
          helperText: 'Type Your Password',
          helperStyle: TextStyle(
              color: Colors.green.shade700, fontStyle: FontStyle.italic)),
      validator: (String value) {
        if (value.length < 6) {
          return 'Password More 6 Charactor';
        } else {
          return null;
        }
      },
      onSaved: (String value) {
        passwords = value.trim();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.yellow.shade600,
          title: Text(
            'Register',
            style: TextStyle(color: Colors.black),
          ),
          actions: <Widget>[registerButtor()],
        ),
        body: Form(
          key: fromkey,
          child: ListView(
            padding: EdgeInsets.all(30.0),
            children: <Widget>[
              nameText(),
              emailText(),
              passwordText(),
            ],
          ),
        ));
  }
}
//key: fromkey เอาเก็บค่าที่กรอกลงหน้า ui
//padding: EdgeInsets.all(30.0) สร้างระยะห่างทั้งด้านบน ด้านข้าง และ ข้างล่าง
//helperText เหมือนการสร้างคำอธิบายไว้ใต้ TextField
//keyboardType ให้เพิ่มความสะดวกสะบายให้ user เช่น TextInputType.emailAddress ก็จะมีพวก @ กับ .com หรืออาจขึ้นอย่างใดอย่างหนึ่ง ขึ้นมาตรงkeyborad
