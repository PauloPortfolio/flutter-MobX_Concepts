import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../config/appProperties.dart';
import '../serv_store/servStore.dart';

class Whenn extends StatefulWidget {
  @override
  _WhennState createState() => _WhennState();
}

class _WhennState extends State<Whenn> {
  //instancia o service_store, dever ser feito em DI
  final store = ServStore();

  //Lista de reactions, que e coletada, para ao fechar a view,
  //ser disposada
  List<ReactionDisposer> disposers;

  @override
  void initState() {
    disposers = [
      // REACTION 02: EXECUCAO UNICA C/ "AUTO DISPOSE"
      // RETORNA 'BOOLEANA'
      when(
          (r) => store.contObsv >= 10,
          () => Flushbar(
                  icon: Icon(Icons.notifications_active),
                  title: "Opa",
                  message: "E' maior ou igual ao NUMERO 10!!!",
                  duration: Duration(milliseconds: 700))
              .show(context)),
    ];

    super.initState();
  }

  @override
  void dispose() {
    //DISPOSANDO A "REACTION 01" QUE POSSUI "DEPENDENCIA DE DISPOSE"
    disposers.forEach((dispose) => dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(TITLE_WHENN)),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(QUESTION_PAGE_WHENN),
          Observer(
            builder: (BuildContext context) =>
                Text('${store.contObsv} buildObs', style: Theme.of(context).textTheme.headline3),
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: store.incrementAction,
        child: ICON_BUTTON,
      ),
    );
  }
}
