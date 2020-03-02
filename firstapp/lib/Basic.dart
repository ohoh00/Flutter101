void main(){
  // -----------------Variable Declaration--------------------//

    //ประเภทตัวแปร(variable)
    //ตัวแปรไม่ระบุtype มันจะรู้typeของมันเอง
    var tmp1 = "codeding";
    var tmp2 = 1234;
    var tmp3 = true;
    
    //ตัวแปรระบุtype
    String tmp4 = "Dart";
    int tmp5 = 7777;
    bool tmp6 = false;
    double tmp7 = 48.5;
    //และอื่นๆ

    //การprint
    print("dart101"); //แสดงข้อความธรรมกา
    print("$tmp1 , $tmp2 , $tmp3 ,$tmp4 , $tmp5 , $tmp6 , $tmp7"); 
    // ใส่ $ เป็นการระบุว่าเป็นตัวแปรต้องอยู่ใน ""

    const tmp8 = "code"; // เป็นตัวแปรไม่ระบุtype และ ไม่สามารถเปลี่ยนแปลงค่าไม่ได้(ค่าคงที่)
    final tmp9 = "d101"; // ตัวแปรไม่ระบุtypeตัวแปรที่ไม่สามารถเปลี่ยนแปลงค่าได้

    //const กับ final แต่งต่างกันที่ const จะในตัวแปรเริ่มต้น แต่ final จะใช้ในตัวแปรที่รับค่ามาจากที่อื่น

    final tmp10 = tmp9;
    final tmp11 = tmp8;
    //สามารถทำได้
    // const tmp12 = tmp9; ไมสามารถทำได้
    //สรุป ค่ากำหนดด้วยconst ต้องเป็นค่าที่เรารู้อยู่แน่ๆแล้วว่ามันจะมีค่าเท่าไร 
    //สรุป final คือการที่เราไม่อยากให้ค่าที่เรารับมานั้นมีการเปลี่ยนแปลง  
   // ------------------------END-----------------------------//

   // ------------------------ Dynamic Variable -------------------- //

   // dynamic , object

   dynamic dm1 = "meiki";
   print("tmp11: $dm1 is ${dm1.runtimeType}"); // .runtimeType ไว้ใช้บอกประเภทตัวแปร
   //ลองเปลี่ยนแปลงค่า
   //dm1 = 5555;
   //print("tmp11: $dm1 is ${dm1.runtimeType}");
   //สามารถทำได้

   print("${dm1.length}"); //.length ไว้ใช้หาความยาวของ string

   //ข้อควรระวัง ตัวแปรแบบdynamicจะไม่แปรerrorตอนเขียนแต่จะไปแสดง error ตอนอยู่บน runtime

   Object ob1 = "smile";
   print("ob1: $ob1 is ${ob1.runtimeType}"); 

   //ob1 = 66666;
   //print("ob1: $ob1 is ${ob1.runtimeType}"); //สามารถทำได้

   //print("${ob1.length}"); object จะมีการแสดง error ออกมาเพราะไม่รู้จักtypeของตัว object 

   //ตัวอย่าง
  dynamic dm2 = 500;
  dm2 = dm2 + 500;
  print("$dm2");

  //เกิดสมมุติทำแบบนี้
  //dm2 = dm2 + "555"; แบบนี้มันไม่ขึ้นฟ้องerror จะขึ้นตอนเรา run เป็นข้อควรระวังของ dynamic

  //ถ้าเราไม่ระบุค่าให้กับตัวแปร
  int n;
  bool bl;
  String str;
  print("$n , $bl , $str"); //มันจะกลายเป็นค่า null

  // -----------------------------END--------------------//

  //-----------------------Function Declaration------------------//
  //function
  normalFun();
  argsFun("coding" , 5555); //มีการส่งค่า
  
  var sm1 = sum1(1,2);
  var sm2 = sum2(3,4);
  var sm3 = sum3(5,6);
  var sm4 = sum4(7,8);
  print("$sm1 , $sm2 , $sm3 , $sm4");

  //Optional named, positional, default value function เป็นฟังก์ชั่นในอีกรูปแบบนึงของภาษาdart
  mul1(x2: 6, x1: 2); //เป็นการระบุชื่อตัวแปรที่จะส่ง ทำให้ตำเเหน่งเช่น (x1: 2 , x2 : 6) ก็จะไม่สำคัญอีกต่อไปเพราะเราระบุชื่อของตัวแปรที่จะส่ง
  mul2(x2: 5); //ถ้าเราเพิ่ม x1: 10 มันจะยึดค่าที่ส่ง ดังนั้น x1 จะไม่เท่ากับ 0 แต่จะเท่ากับ 10
  mul3(3); //เมื่อขี้เกียจใส่ชื่อตัวแปร
  // end function

  // List มี2แบบ(Fixed-length, Growable) ทำงานเหมือนอาเรย์
  //Fixed-length
  List<int> list1 = List<int>(3); //กำหนดให้มีขนาดให้รับค่าได้ 3 ค่า ไม่สามารถใช้ add ได้
  list1[0] = 1111;
  list1[1] = 22;
  list1[2] = 333;
  print("List1 : $list1");
  print("List1 : ${list1[2]}"); //แบบเจาะจงค่า ใส่ {}
  list1[2] = 999; //สามารถเปลี่ยนแปลงค่าข้างในได้ *สามารถใส่ null ได้
  print("List1 : ${list1[2]}");

  //แบบไม่ Fixed
  List<int> list2 = List<int>(); //สามารถ add ค่าได้เรื่อยๆ
  list2.add(5555);
  list2.add(1111);
  list2.add(588);
  list2.add(5699); //ใช้คำสั่งอื่นได้ เช่น remove()
  print("List2 : ${list2[3]}");
  list2[3] = 999;
  print("List2 : ${list2[3]}");

  //แบบเปลี่ยนแปลงค่าไม่ได้
  List<String> list3 = const ["a" , "b" , "c"];
  //ถ้าจะทำการเปลี่ยนค่าเช่น list3[0] = "z"; มันจะ error
  print("List3: $list3");
  print("List3: ${list3[0]}");
  
  // End List
}

void mul3([int x1 = 0, int x2 = 0]){ //ต้องใส่ [] ค่ามันจะvalueเข้ามาตามลำดับ
    print("mul3: $x1 , $x2");
    var result = x1 * x2;
    print("mul3: $result");
}

void mul2({int x1 = 0, int x2}){ //ต้องใส่{}
  var result = x1 * x2;
  print("mul2: $result");
}

void mul1({int x1, int x2}){ //ต้องใส่{}
  print("mul1: $x1 , $x2");
  var result = x1 * x2;
  print("mul1: $result");
}

//functionที่ไม่มีการ return ค่า
void normalFun(){ 
  print("normalfun");
}
void argsFun(String title , int x){
   print("$title , $x");
}
//function แบบ return ค่าในหลายๆแบบ เลือกได้ตามความสบายใจ
int sum1(int x1 , int x2){
   return x1 + x2;
}

sum2(x1 , x2){
  return x1 + x2;
}

sum3(int x1 , int x2) => x1 + x2;

sum4(x1 , x2) => x1 + x2;
// ----------------------End funtion-----------------//



