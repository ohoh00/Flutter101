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
      //ผลลัพธ์ที่responseได้กลับมาจะได้เป็น Document
      List<DocumentSnapshot> snapshots = response.documents;
      for (var snapshots in snapshots) {
        print('Name = ${snapshots.data['Name']}');
        print('Episode = ${snapshots.data['Episode']}');

        ProductModel productModel = ProductModel.fromMap(snapshots.data);
        setState(() {
          productModels.add(productModel);
        });
      }
    });
  }

  Widget showEpisode(int index) {
    return Text('Episode : ${productModels[index].episode}',
        style: TextStyle(
          fontSize: 18.0,
        ));
  }

  Widget showName(int index) {
    return Text('Name : ${productModels[index].name}',
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
          itemCount: productModels.length,
          itemBuilder: (BuildContext buildContext, int index) {
            return showListView(index);
          },
        ),
      ),
    );
  }
}

class ProductModel {
  String name, episode;

  ProductModel(this.name, this.episode);

  ProductModel.fromMap(Map<String, dynamic> map) {
    name = map['Name'];
    episode = map['Episode'];
  }
}
