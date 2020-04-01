import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../appProperties.dart';
import '../serv_store/counterServStore.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //instancia o service_store, dever ser feito em DI
  final store = CounterServStore();

  //Lista de reactions, que e coletada, para ao fechar a view,
  //ser disposada
  List<ReactionDisposer> disposers;

  @override
  void initState() {
    disposers = [
      //REACTION 01: ACONTECE NA CONDICAO, E DEPOIS APOS SE REPETIR
      reaction<int>((fn) => store.contObsv, (contagem) {
        if (contagem % 2 == 0)
          Flushbar(
                  title: "Opa",
                  message: "E par. Acontece na condicao e depois",
                  duration: Duration(milliseconds: 700))
              .show(context);
      }),

//      // REACTION 02: ACONTECE UMA VEZ, E AUTODISPOSE
      // RETORNA 'BOOLEANA'
//      when(
//          (r) => store.contObsv >= 10,
//          () => Flushbar(
//                  icon: Icon(Icons.notifications_active),
//                  title: "Opa",
//                  message: "E' maior ou igual ao NUMERO 10!!!. Acontece somente no ato da condicao",
//                  duration: Duration(milliseconds: 700))
//              .show(context)),

      // REACTION 03: DISPARA NA ALTERACAO DO OBSERVABLE
      //autorun((r) => showFlushBar(context))
    ];

    super.initState();
  }

//  @override
//  void didChangeDependencies() {
//    autorun((r) => showFlushBar(context));
//    super.didChangeDependencies();
//  }

  @override
  void dispose() {
    //disposando as reactions no fechamento desta view
    disposers.forEach((dispose) => dispose());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print('BuildHome');

    return Scaffold(
      appBar: AppBar(title: Text(TITLE_APP)),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Text(QUESTION),
          Observer(
            builder: (BuildContext context) =>
                Text('${store.contObsv} buildObs', style: Theme.of(context).textTheme.display1),
          )
        ]),
      ),
      floatingActionButton: FloatingActionButton(onPressed: store.incAction, child: ICON_BUTTON),
    );
  }

  void showFlushBar(BuildContext context) {
    Flushbar(
        title: "AUTORUN",
        icon: Icon(Icons.notifications_active),
        message: "AUTORUN -> '${store.contObsv}",
        duration: Duration(milliseconds: 700))
      ..show(context);
  }
}
