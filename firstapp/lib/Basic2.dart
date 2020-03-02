void main(){

  // Class (named constructor, Getter Setter, Callable)
  var obj1 = PersonV1(); //สามารถใส่ค่าให้ตัวแปรในclass ได้จาก main
  obj1.fName = "MeiKi";
  obj1.lName = "Smaile";
  obj1.display();

  var obj2 = PersonV2();
  obj2.display();
  
  //named constructor
  var obj3 = PersonV2.CM_Name("sujira" , "oh");
  obj3.display();

  //getter setter
  var obj4 = PersonV3();
  obj4.nameMale = "supakorn";
  obj4.display();
  print(obj4.vipMenber);

  //Callable
  var obj5 = PersonV4();
  obj5.namefeMale = "sujira";
  print(obj5()); //เข้า function call

  // END CLASS

  //  Exception ทำเพื่อไม่ให้โปรแกรมหยุดการทำงานเมื่อโปรแกรม ERROR
  try{ //ทำไปก่อน
   //ตัวอย่าง
   int aaa; //ถ้าใส่ aaa = 1 มันก็จะไม่เข้า catch มันจะข้ามไปเข้า finally เลย
   aaa++; //จงใจให้ error
   var bbb = [2,3];
   bbb[9];
  }on NoSuchMethodError{ //คำสั่งทำให้กรณีที่มี error หลายอันแล้วต้องการรู้ว่าเป็นตือ error อะไร
    print('NoSuchMethodError');
  }on RangeError{ //ถ้ามี on รองรับ error มันจะไม่เข้า catch
    print('RangeError');
  }catch (e , s){ //ถ้าเกิด error มันจะมาเข้าตัว catch
    print('error: $e \n');
    print('stack: $s \n');
  }finally{ //เป็นตัวที่ไม่ว่าจะเข้า catch หรือไม่เข้าก็จะมาเข้าที่ตัวนี้อยู่ดี
    print('finally \n');
  }
  
}
class PersonV1{
  String fName;
  String lName;

  void display(){
    print("Fname : $fName , Lname: $lName");
  }

}
class PersonV2{
  String fName; //คือตัวแปรที่พอเวลาเอาไปใช้ให้ใส่ this.
  String lName;

  PersonV2(){ //คือการทำ default constructor
    this.fName = "nana";
    this.lName = "zaza";
  }
  
  //constructor overloading ในภาษาdartไม่สามารถอยู่รวมกับ default constructor ได้ดังนั้นจึงต้องตั้งชื่อใหม่
  PersonV2.CM_Name(String fName , String lName){ 
     this.fName = fName;
     this.lName = lName;
  }
  void display(){
    print("Fname : $fName , Lname: $lName");
  }
}
class PersonV3{
  String fName; //คือตัวแปรที่พอเวลาเอาไปใช้ให้ใส่ this.
  String lName;

  PersonV3(){ //คือการทำ default constructor
    this.fName = "nana";
    this.lName = "zaza";
  }
  
  //constructor overloading ในภาษาdartไม่สามารถอยู่รวมกับ default constructor ได้ดังนั้นจึงต้องตั้งชื่อใหม่
  PersonV3.CM_Name(String fName , String lName){ 
     this.fName = fName;
     this.lName = lName;
  }

  //setter 
  void set nameMale(String fName){
    this.fName = "Mr. ${fName}";
  }

  void set namefeMale(String fName){
    this.fName = "Mrs. ${fName}";
  }
  //getter
  String get vipMenber{
    return "[VIP] $fName $lName";
  }

  void display(){
    print("Fname : $fName , Lname: $lName");
  }
}

class PersonV4{
  String fName; //คือตัวแปรที่พอเวลาเอาไปใช้ให้ใส่ this.
  String lName;

  PersonV4(){ //คือการทำ default constructor
    this.fName = "nana";
    this.lName = "zaza";
  }
  
  //constructor overloading ในภาษาdartไม่สามารถอยู่รวมกับ default constructor ได้ดังนั้นจึงต้องตั้งชื่อใหม่
  PersonV4.CM_Name(String fName , String lName){ 
     this.fName = fName;
     this.lName = lName;
  }

  //setter 
  void set nameMale(String fName){
    this.fName = "Mr. ${fName}";
  }

  void set namefeMale(String fName){
    this.fName = "Mrs. ${fName}";
  }
  //getter
  String get vipMenber{
    return "[VIP] $fName $lName";
  }

  void display(){
    print("Fname : $fName , Lname: $lName");
  }

  String call(){
    return fName;
  }
}

