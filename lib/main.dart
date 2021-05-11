import 'dart:io';
import 'package:flutter/material.dart';
//import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';
// ignore: unused_import
import "database_helper.dart";

void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List _outputs = [];
  File _image;
  List attributes = [
    "Name: ",
    "Kingdom: ",
    "Genus: ",
    "Color: ",
    "No of Species: ",
    "Found in: ",
    "Description: ",
    "About: "
  ];

  @override
  void initState() {
    super.initState();

    loadModel().then((value) {
      setState(() {});
    });
    initDB();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "FloralDET",
            style: TextStyle(fontWeight: FontWeight.normal),
          ),
          backgroundColor: Colors.lightGreen[800],
          centerTitle: true,
        ),
        body: Card(
          margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
          elevation: 4,
          child: Container(
            height: 600,
            width: 400,
            margin: EdgeInsets.all(8),
            child: Column(
              children: [
                _image == null
                    ? (Container(
                        height: 420,
                        width: 300,
                        decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.lightGreen[800], width: 2),
                        ),
                      ))
                    : Container(
                        height: 420, width: 300, child: Image.file(_image)),
                Container(
                  height: 70,
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  child: Card(
                    elevation: 4,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: Icon(
                              Icons.camera,
                              size: 40,
                            ),
                            onPressed: fromCamera,
                            color: Colors.lightGreen[800],
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.search,
                              color: Colors.lightGreen[800],
                              size: 40,
                            ),
                            onPressed: () => _bottomSheet(),
                            color: Colors.lightGreen[800],
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.collections,
                              size: 40,
                            ),
                            onPressed: fromGallery,
                            color: Colors.lightGreen[800],
                          ),
                        ]),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  fromGallery() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    if (image == null) return null;
    setState(() {
      _image = image;
    });
  }

  fromCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    if (image == null) return null;
    setState(() {
      _image = image;
    });
  }

  classifyImage(File image) async {
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults: 1,
      threshold: 0.0,
      imageMean: 127.5,
      imageStd: 127.5,
    );
    print(output);
    setState(() {
      _outputs = output;
    });
  }

  loadModel() async {
    await Tflite.loadModel(
      model: "assets/model.tflite",
      labels: "assets/labels.txt",
    );
  }

  void _bottomSheet() async {
    await classifyImage(_image);
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Color(0xff757575),
            child: Container(
              height: 100,
              child: Center(
                  child: TextButton(
                child: Text(
                  "${_outputs[0]["label"]} ${((_outputs[0]["confidence"]) * 100).toStringAsFixed(2)} %",
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
                onPressed: () => _bottomSheetDB(),
              )),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30))),
            ),
          );
        });
  }

  void _bottomSheetDB() async {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return FutureBuilder(
              future: allProducts(_outputs[0]["index"]),
              builder: (context, AsyncSnapshot snapshot) {
                if (!snapshot.hasData) {
                  return Center(child: CircularProgressIndicator());
                } else {
                  return Container(
                      color: Color(0xff757575),
                      child: Container(
                          child: ListView.builder(
                              itemCount: 1,
                              itemBuilder: (context, index) {
                                return Container(
                                  child: Column(
                                    children: [
                                      ListTile(
                                          title: RichText(
                                              text: new TextSpan(
                                                  style: new TextStyle(
                                                    fontSize: 14.0,
                                                    color: Colors.black,
                                                  ),
                                                  children: <TextSpan>[
                                            new TextSpan(
                                                text: '${attributes[0]}',
                                                style: new TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            new TextSpan(
                                                text:
                                                    "${snapshot.data[0].name}")
                                          ]))),
                                      ListTile(
                                          title: RichText(
                                              text: new TextSpan(
                                                  style: new TextStyle(
                                                    fontSize: 14.0,
                                                    color: Colors.black,
                                                  ),
                                                  children: <TextSpan>[
                                            new TextSpan(
                                                text: '${attributes[1]}',
                                                style: new TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            new TextSpan(
                                                text:
                                                    "${snapshot.data[0].kingdom}")
                                          ]))),
                                      ListTile(
                                          title: RichText(
                                              text: new TextSpan(
                                                  style: new TextStyle(
                                                    fontSize: 14.0,
                                                    color: Colors.black,
                                                  ),
                                                  children: <TextSpan>[
                                            new TextSpan(
                                                text: '${attributes[2]}',
                                                style: new TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            new TextSpan(
                                                text:
                                                    "${snapshot.data[0].genus}")
                                          ]))),
                                      ListTile(
                                          title: RichText(
                                              text: new TextSpan(
                                                  style: new TextStyle(
                                                    fontSize: 14.0,
                                                    color: Colors.black,
                                                  ),
                                                  children: <TextSpan>[
                                            new TextSpan(
                                                text: '${attributes[3]}',
                                                style: new TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            new TextSpan(
                                                text:
                                                    "${snapshot.data[0].color}")
                                          ]))),
                                      ListTile(
                                          title: RichText(
                                              text: new TextSpan(
                                                  style: new TextStyle(
                                                    fontSize: 14.0,
                                                    color: Colors.black,
                                                  ),
                                                  children: <TextSpan>[
                                            new TextSpan(
                                                text: '${attributes[4]}',
                                                style: new TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            new TextSpan(
                                                text:
                                                    "${snapshot.data[0].noofspecies}")
                                          ]))),
                                      ListTile(
                                          title: RichText(
                                              text: new TextSpan(
                                                  style: new TextStyle(
                                                    fontSize: 14.0,
                                                    color: Colors.black,
                                                  ),
                                                  children: <TextSpan>[
                                            new TextSpan(
                                                text: '${attributes[5]}',
                                                style: new TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            new TextSpan(
                                                text:
                                                    "${snapshot.data[0].foundin}")
                                          ]))),
                                      ListTile(
                                          title: RichText(
                                              text: new TextSpan(
                                                  style: new TextStyle(
                                                    fontSize: 14.0,
                                                    color: Colors.black,
                                                  ),
                                                  children: <TextSpan>[
                                            new TextSpan(
                                                text: '${attributes[6]}',
                                                style: new TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            new TextSpan(
                                                text:
                                                    "${snapshot.data[0].description}")
                                          ]))),
                                      ListTile(
                                          title: RichText(
                                              text: new TextSpan(
                                                  style: new TextStyle(
                                                    fontSize: 14.0,
                                                    color: Colors.black,
                                                  ),
                                                  children: <TextSpan>[
                                            new TextSpan(
                                                text: '${attributes[7]}',
                                                style: new TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            new TextSpan(
                                                text:
                                                    "${snapshot.data[0].about}")
                                          ]))),
                                    ],
                                  ),
                                );
                              }),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(0),
                                  topRight: Radius.circular(0)))));
                }
              });
        });
  }

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }
}
