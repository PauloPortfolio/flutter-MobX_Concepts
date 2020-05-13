// extends from MainModule
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:testemobix/view/autorrun.dart';
import 'package:testemobix/view/home.dart';

import '../app_driver.dart';
import 'appProperties.dart';

class AppModule extends MainModule {
  @override
  List<Bind> get binds => [];

  @override
  List<Router> get routers => [
        Router(HOME, child: (_, args) => Home()),
        Router(AUTORUN, child: (_, args) => Autorrun()),
      ];

  @override
  Widget get bootstrap => AppDriver();
}
