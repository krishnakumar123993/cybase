import 'package:flutter/material.dart';

class design extends StatefulWidget {
  const design({Key key}) : super(key: key);

  @override
  _designState createState() => _designState();
}

class _designState extends State<design> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(


      appBar: AppBar(
        title: Text("Medfeed"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),


      body:Container(
        child: Column(
          children: [
            Container(
              height: 200,
              child: Image.network("http://143.110.240.107:8000/ads/image_1632132775456.jpg"),
              width: MediaQuery.of(context).size.width,
            )

          ],
        ),
      ),


    );
  }
}
