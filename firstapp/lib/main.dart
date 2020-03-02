import 'package:firstapp/Register.dart';
import 'package:flutter/material.dart';

void main() => runApp(
    Myapp()); //runapp ซึ่งจะรันได้ต้องเลือกของในวงเล็บเป็น object เท่านั้น

//Stateless Widget คือ ส่วนตั้งต้นของการแสดงผลบนหน้าจอ จะยึดตามค่าเริ่มต้น ใช้เหมือนเราจะทำหน้าที่ไม่มีจะไม่มีการเปี่ยนแปลงข้อมูล
//StateFul Widget  คือ ส่วนที่ทำหน้าที่แสดงผลหน้าจอ แต่เปลี่ยนแปลงคา่ได้ เมื่อมีการเปลี่ยนแปลงก็จะอัพเดตที่หน้า ui ทันที
class Myapp extends StatelessWidget {
  @override //return MaterialApp คือการเรียกเอา import material มาใช้
  Widget build(BuildContext context) {
    //ข้างใน return ใช้ widget ในการทำงานเช่น Text คือ widget ตัวนึง
    return MaterialApp(
        title: "Flutter101",
        // Scaffold เปรียบเสมือนธีมของแอพ ช่วยเรื่องความสวยงามของแอพ
        // SafeArea คือสิ่งที่ไม่ทำให้ข้อความหรืออะไรก็แล้วแต่ไม่ขึ้นไปอยู่ตรงพวกแท็บที่มีสัญลักษณ์ แบต wifi
        // ข้างใน SafeArea จะมี child
        home: Scaffold(
          /* appBar: AppBar(
              title: Center(
            child: Text('HOME'),
          ) // Center ทำให้อยู่ตรงกลางแต่ในCenter ต้องมี child ประกอบ
            ),
          body: Center(
            child: Text('Hello World',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20 )),
          ),*/
          body: Loginpage(),
        ));
  }
}

class Loginpage extends StatefulWidget {
  @override
  _LoginpageState createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  Widget showlogo() {
    return Container(
      child: Image.asset('images/shop.png'),
      width: 120.0,
      height: 120.0,
    );
  }

  Widget showname() {
    return Text(
      ' Shopping Mall',
      style: TextStyle(
          fontSize: 30.0,
          color: Colors.blue.shade600,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic),
    );
  }

  Widget signIn() {
    return RaisedButton(
      child: Text(
        'Sign In',
        style: TextStyle(color: Colors.white),
      ),
      color: Colors.blue,
      onPressed: () {},
    );
  }

  Widget signUp() {
    return OutlineButton(
      child: Text('Sign Up'),
      onPressed: () {
        MaterialPageRoute materialPageRoute = MaterialPageRoute(builder: (BuildContext context) => Register()); 
        Navigator.of(context).push(materialPageRoute); 
      },//ใน {} คือส่วนของ Action , BuildContext คือการสร้างสะพานเชื่อม
    );
  }

  Widget showButton() {
    return Row(
      children: <Widget>[
        signIn(),
        SizedBox(
          width: 4.0,
        ),
        signUp()
      ],
      mainAxisSize: MainAxisSize.min,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          //RadialGradient คือการไล่สี
          child: Container(
        decoration: BoxDecoration(
            gradient: RadialGradient(
                colors: [Colors.blue.shade50, Colors.yellow.shade600],
                radius: 0.8)),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              showlogo(),
              showname(),
              SizedBox(
                height: 8.0,
              ),
              showButton(),
            ],
            //sizebox ช่วยเพิ่มระยะให้มีการห่างกัน สูง กว้าง แล้วแต่กำหนด
          ),
        ),
      )),
    );
  }
}
