import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../config/appProperties.dart';
import '../serv_store/servStore.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: Text(TITLE_HOME)),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(QUESTION_PAGE),
                Text('XXXX', style: Theme.of(context).textTheme.headline3),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){},
        child: ICON_BUTTON,
      ),
    );
  }
}
