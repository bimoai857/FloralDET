import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

void main() => runApp(MaterialApp(
      home: MyApp(),
    ));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List _outputs;
  File _image;

  @override
  void initState() {
    super.initState();

    loadModel().then((value) {
      setState(() {});
    });
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
      numResults: 2,
      threshold: 0.5,
      imageMean: 127.5,
      imageStd: 127.5,
    );

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
                  child: Text(
                "${_outputs[0]["label"]}",
                style: TextStyle(fontSize: 20),
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

  @override
  void dispose() {
    Tflite.close();
    super.dispose();
  }
}
