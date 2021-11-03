import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'health_tip_model.dart';

class HealthTips extends StatefulWidget {
  const HealthTips({Key key}) : super(key: key);

  @override
  _HealthTipsState createState() => _HealthTipsState();
}

class _HealthTipsState extends State<HealthTips> {
  Future<HealthTipModel> getlist() async {
    var url = "http://143.110.240.107:8000/user/get_health_tips";
    var res = await http.post(Uri.parse(url), headers: {
      "Authorization":
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYxMjVlZjVmZTVmNWMzOTYxNDI4NDIzYyIsImlhdCI6MTYzMzcwNzA3OCwiZXhwIjoxNjM2Mjk5MDc4fQ.dvxArYOcy_JMdJtz-ypGhrP-zUAmUm8ml5pcs7ijpoY"
    });

    print(res.body);
    return HealthTipModel.fromJson(jsonDecode(res.body));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
            child: Text(
          "Health Tips",
          style: TextStyle(color: Colors.black),
        )),
        actions: [
          Icon(Icons.search),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: FutureBuilder(
          future: getlist(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data);
              List<Data> list = snapshot.data.data;
              print("hell");
              List<Tips> tips = list.elementAt(0).tips;
              return ListView.builder(
                  itemCount: tips.length,
                  itemBuilder: (context, index) {
                    return MyCard(
                      title: tips.elementAt(index).title,
                      image_url: tips.elementAt(index).image,
                      text: tips.elementAt(index).description,
                    );
                  });
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}

/// This is the stateless widget that the main application instantiates.
class MyCard extends StatelessWidget {
  String text;
  String title;
  String image_url;

  MyCard({Key key, this.text, this.image_url, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Card(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      flex: 8,
                      child: Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(flex: 2,
                      child: Container(
                        margin: EdgeInsets.all(8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Icon(
                              Icons.favorite,
                              color: Colors.red,
                            ),
                            Icon(
                              Icons.share_outlined,
                              color: Colors.black38,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.network(
                    image_url,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Expanded(
                      flex : 6,
                      child: Text(
                        title,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style:
                            TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 8.0, left: 8.0),
                child: IntrinsicHeight(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Flexible(
                        child: new Container(
                          padding: new EdgeInsets.only(right: 13.0),
                          child: new Text(
                            text,
                            overflow: TextOverflow.ellipsis,
                            style: new TextStyle(
                              fontSize: 13.0,
                              fontFamily: 'Roboto',
                              color: new Color(0xFF212121),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      // Html(
                      //   data: "<p>What is Yoga?</p>"
                      //       "<p>Yoga means different things to different people. For some, it is a fitness exercise, for some, it is something beyond one’s physical nature, and for others, it is an art form. But what exactly is it?</p>"
                      //       "<p>Yoga, A practice that involves your mind, body, and soul to transform or improve one’s inherent power in a harmonious and balanced manner. Yoga has the power to improve your posture, coordination, balance, and Its gentle ways can aid you to achieve complete self-realization.</p>"
                      //       "<p>The word yoga comes from the Sanskrit word ‘yuj’, which means union, the union of individual consciousness, and universal consciousness. The one who experiences this unity of existence is said to be a yogi. Thus yoga aims to achieve self-realization, "
                      //       "thereby overcoming all the suffering leading to the state of liberation (moksha).</p>",
                      //   padding: EdgeInsets.all(8.0),
                      //   onLinkTap: (url) {
                      //     print("Opening $url...");
                      //   },
                      //   customRender: (node, children) {
                      //     if (node is dom.Element) {
                      //       switch (node.localName) {
                      //         case "custom_tag": // using this, you can handle custom tags in your HTML
                      //           return Column(children: children);
                      //       }
                      //     }
                      //   },
                      // ),
                      // RichText(text: TextSpan(text: "<p>What is Yoga?</p><p>Yoga means different things to different people. For some, it is a fitness exercise, for some, it is something beyond one’s physical nature, and for others, it is an art form. But what exactly is it?</p><p>Yoga, A practice that involves your mind, body, and soul to transform or improve one’s inherent power in a harmonious and balanced manner. Yoga has the power to improve your posture, coordination, balance, and Its gentle ways can aid you to achieve complete self-realization.</p><p>The word yoga comes from the Sanskrit word ‘yuj’, which means union, the union of individual consciousness, and universal consciousness. The one who experiences this unity of existence is said to be a yogi. Thus yoga aims to achieve self-realization, thereby overcoming all the suffering leading to the state of liberation (moksha).</p>"))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
