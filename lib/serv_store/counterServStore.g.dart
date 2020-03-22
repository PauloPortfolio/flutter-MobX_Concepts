// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'counterServStore.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CounterServStore on ICounterServRouter, Store {
  final _$contObsvAtom = Atom(name: 'ICounterServRouter.contObsv');

  @override
  int get contObsv {
    _$contObsvAtom.context.enforceReadPolicy(_$contObsvAtom);
    _$contObsvAtom.reportObserved();
    return super.contObsv;
  }

  @override
  set contObsv(int value) {
    _$contObsvAtom.context.conditionallyRunInAction(() {
      super.contObsv = value;
      _$contObsvAtom.reportChanged();
    }, _$contObsvAtom, name: '${_$contObsvAtom.name}_set');
  }

  final _$ICounterServRouterActionController =
      ActionController(name: 'ICounterServRouter');

  @override
  void incAction() {
    final _$actionInfo = _$ICounterServRouterActionController.startAction();
    try {
      return super.incAction();
    } finally {
      _$ICounterServRouterActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'contObsv: ${contObsv.toString()}';
    return '{$string}';
  }
}
