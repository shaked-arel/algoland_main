import 'package:binary/backButton.dart';
import 'package:binary/openNumber.dart';
import 'package:binary/searchNumber.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'level1c.dart';

class Level1bPage extends StatefulWidget {
  @override
  State<Level1bPage> createState() => _Level1bPageState();
}

class _Level1bPageState extends State<Level1bPage>
    with TickerProviderStateMixin {
  bool isVisibleGood = false;
  bool isVisible = false;
  bool isVisibleBad = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("binary game"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            openNumber(number: '22'),
            openNumber(number: '29'),
            searchNumber(number: '46'),
            openNumber(number: '83'),
            openNumber(number: '94'),
          ],
        ),
        Text("you are searching for 71 press if you should look right or left"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    isVisibleBad = !isVisibleBad;
                  });
                },
                child: Text('Left')),
            SizedBox(
              width: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    isVisibleGood = !isVisibleGood;
                    isVisible = !isVisible;
                  });
                },
                child: Text('Right')),
          ],
        ),
        Visibility(
            visible: isVisibleGood,
            child: Lottie.network(
                'https://assets10.lottiefiles.com/packages/lf20_oaw8d1yt.json',
                height: 200,
                repeat: false)),
        Visibility(
            visible: isVisibleBad,
            child: Lottie.network(
                'https://assets10.lottiefiles.com/private_files/lf30_jq4i7W.json',
                height: 200,
                repeat: false)),
        Visibility(
            visible: isVisible,
            child: ElevatedButton(
              child: Text("continue"),
              onPressed: () {
                Navigator.push(
                    context,
                    new MaterialPageRoute(
                      builder: (context) => Level1cPage(),
                    ));
              },
            )),
        AllBackButton(),
      ]),
    );
  }
}
