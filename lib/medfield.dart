import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'health_tips.dart';
import 'medfield_model.dart';

class medfield extends StatefulWidget {
  const medfield({Key key}) : super(key: key);

  @override
  _medfieldState createState() => _medfieldState();
}

class _medfieldState extends State<medfield> {
  Future<ModelApi> getlist() async {
    var url = "http://143.110.240.107:8000/user/get_medfeed_home";
    var res = await http.get(Uri.parse(url), headers: {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYxMjVlZjVmZTVmNWMzOTYxNDI4NDIzYyIsImlhdCI6MTYzMzcwNzA3OCwiZXhwIjoxNjM2Mjk5MDc4fQ.dvxArYOcy_JMdJtz-ypGhrP-zUAmUm8ml5pcs7ijpoY"
    });

    print(res.body);
    return ModelApi.fromJson(jsonDecode(res.body));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Medfeed"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: getlist(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<Banners> banner = snapshot.data.data.banner;
                var arr = snapshot.data.data;
                List<Category> category = snapshot.data.data.category;

                return Column(
                  children: [
                    Container(
                      child: ListView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemCount: banner.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 170,
                                child: Image.network(banner[index].image),
                              ),
                            );
                          }),

                      // color: Colors.red,
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                    ),
                    SizedBox(
                      height: 45,
                    ),
                    GridView.builder(
                        shrinkWrap: true,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemCount: category.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: InkWell(
                              onTap: () {
                                if (index == 0) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HealthTips()),
                                  );
                                }
                              },
                              child: Card(
                                child: Image.network(
                                  category[index].image,
                                  height: 20,
                                ),
                              ),
                            ),
                          );
                        }),
                  ],
                );
              } else {
                return CircularProgressIndicator();
              }
            }),

        ///aaa
      ),
    );
  }
}
