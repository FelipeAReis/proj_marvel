// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_page_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomePageController on _HomePageController, Store {
  final _$resultAtom = Atom(name: '_HomePageController.result');

  @override
  double get result {
    _$resultAtom.reportRead();
    return super.result;
  }

  @override
  set result(double value) {
    _$resultAtom.reportWrite(value, super.result, () {
      super.result = value;
    });
  }

  final _$convertMoedaAsyncAction =
      AsyncAction('_HomePageController.convertMoeda');

  @override
  Future<void> convertMoeda(
      String valor, String moedaOrigem, String moedaDestino) {
    return _$convertMoedaAsyncAction
        .run(() => super.convertMoeda(valor, moedaOrigem, moedaDestino));
  }

  @override
  String toString() {
    return '''
result: ${result}
    ''';
  }
}
