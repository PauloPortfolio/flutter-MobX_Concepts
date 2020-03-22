import 'package:mobx/mobx.dart';

//Este part deve ter EXATAMENTE o mesmo nome deste arquivo STORE
part 'counterServStore.g.dart';

class CounterServStore = ICounterServRouter with _$CounterServStore;

abstract class ICounterServRouter with Store {
  @observable
  int contObsv = 0;

  @action
  void incAction() {
    contObsv++;
  }

  //A cada alteracao, rebuildar usando o: flutter packages pub run build_runner build
  //ou acionar o watch, par anao ficar rebuldando: flutter packages pub run build_runner watch

}
