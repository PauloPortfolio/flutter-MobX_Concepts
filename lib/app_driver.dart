import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:testemobix/view/home.dart';

import 'config/appProperties.dart';

class AppDriver extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: APP_DEB_CHECK,
      theme: ThemeData(primarySwatch: Colors.blue),
      navigatorKey: Modular.navigatorKey,
      initialRoute: HOME,
      onGenerateRoute: Modular.generateRoute,
    );
  }
}
