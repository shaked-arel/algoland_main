import 'package:binary/backButton.dart';
import 'package:binary/openNumber.dart';
import 'package:binary/searchNumber.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import 'level1/level1b.dart';

class Level1Page extends StatefulWidget {
  @override
  State<Level1Page> createState() => _Level1PageState();
}

class _Level1PageState extends State<Level1Page> with TickerProviderStateMixin {
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
            openNumber(number: '4'),
            openNumber(number: '18'),
            searchNumber(number: '32'),
            openNumber(number: '37'),
            openNumber(number: '45'),
          ],
        ),
        Text("you are searching for 4 press if you should look right or left"),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    isVisibleGood = !isVisibleGood;
                    isVisible = !isVisible;
                  });
                },
                child: Text('Left')),
            SizedBox(
              width: 10,
            ),
            ElevatedButton(
                onPressed: () {
                  setState(() {
                    isVisibleBad = !isVisibleBad;
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
                      builder: (context) => Level1bPage(),
                    ));
              },
            )),
        AllBackButton(),
      ]),
    );
  }
}
