import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Testread extends StatefulWidget {
  @override
  _TestreadState createState() => _TestreadState();
}

class _TestreadState extends State<Testread> {
  List<ProductModel> productModels = List();

  //Method
  @override
  void initState() {
    //initState() คือ Method ที่ทำงานก่อน build จะทำงาน
    super.initState();
    readAllData();
  }

  Future<void> readAllData() async {
    //call กับเครื่องมือFirestore

    Firestore firestore = Firestore.instance;
    CollectionReference collectionReference = firestore.collection('Product');
    await collectionReference.snapshots().listen((response) {
      //async เหมือนกับการ return แต่เป็นการ retrun ค่าที่ใช้ใน Future funtion ซึ่งจะรอให้ค่าที่รีreturn เรียกค่าทั้งหมดมาจนเสร็จก่อนจึงส่งค่าออกไป
      //async return(เรียก) ค่าเป็น dynamic
      //ผลลัพธ์ที่responseได้กลับมาจะได้เป็น Document

      //await หมายถึงว่าให้รอจนกว่าคำสั่งนั้นจะทำงานเสร็จแล้วค่อยส่งค่าออกไป
      List<DocumentSnapshot> snapshots = response.documents;
      for (var snapshots in snapshots) {
        print('Name = ${snapshots.data['Name']}');
        print('Episode = ${snapshots.data['Episode']}');

        ProductModel productModel = ProductModel.fromMap(snapshots.data);//เรียกข้อมูลมาเก็บ
        setState(() {
          //setState เพื่อให้พอได้ค่ามาครบสั่งให้  Widget build รันใหม่อีกที
          productModels.add(productModel);//เก็ยข้อมูลที่เรียกไว้ใน array
        });
      }
    });
  }

  Widget showEpisode(int index) {
    return Text('Episode : ${productModels[index].episode}, index : $index',
        style: TextStyle(
          fontSize: 18.0,
        ));
  }

  Widget showName(int index) {
    return Text('Name : ${productModels[index].name} , index : $index',
        style: TextStyle(
          fontSize: 18.0,
        ));
  }

  Widget showListView(int index) {
    return Container(
      child: Card(
        color: Colors.red,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,//ชิดซ้าย mainAxisAlignment: MainAxisAlignment.end ชิดขวา
          children: <Widget>[
            SizedBox(
              height: 15.0,
            ),
            showName(index),
            SizedBox(
              height: 15.0,
            ),
            showEpisode(index),
            SizedBox(
              height: 15.0,
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data'),
      ),
      body: Container(
        child: ListView.builder(
          //ListView.builder สร้างListView
          itemCount: productModels.length,
          //itemCount จำนวนของListView ที่ต้องการสร้าง
          itemBuilder: (BuildContext buildContext, int index) {
            //itemBuilder สร้างitem  buildContext คือตัวแปร 
            return showListView(index);
          },
        ),
      ),
    );
  }
}

class ProductModel {
  String name, episode;

  ProductModel(this.name,this.episode);//setter และ getter

  ProductModel.fromMap(Map<String, dynamic> map) { //funtion getter settter ของcloud firebaseในความเป็นจริง
    // **ไม่จำเป็นต้องเขียนคำว่า frommap frommapเป็นคำที่ตั้งขึ้น สุดท้ายแล้วแต่เราจะตั้ง
    //Map<String, dynamic>ชิดตัวแปร String หัวข้อหน้าหน้าเช่น name หรือ episode ที่เราตั้งใน cloud firebase
    //dynamic เป็นการตั้งที่เพื่อไว้ในอนาคตทีี่เนื้อหาข้างในname หรือ episode อาจจะชนิดไม่ใช้String อาจจะเป็น int หรือ อื่นๆ 
    name = map['Name'];
    episode = map['Episode'];
  }
}

//รูปแบบการเขียนข้อมูลชนิด map (Map<String, Object>  ตัวแปร)
