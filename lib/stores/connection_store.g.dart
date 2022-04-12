// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'connection_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ConnectionStore on _ConnectionStoreBase, Store {
  final _$connectedAtom = Atom(name: '_ConnectionStoreBase.connected');

  @override
  bool get connected {
    _$connectedAtom.reportRead();
    return super.connected;
  }

  @override
  set connected(bool value) {
    _$connectedAtom.reportWrite(value, super.connected, () {
      super.connected = value;
    });
  }

  final _$_ConnectionStoreBaseActionController =
      ActionController(name: '_ConnectionStoreBase');

  @override
  void setConnected(bool val) {
    final _$actionInfo = _$_ConnectionStoreBaseActionController.startAction(
        name: '_ConnectionStoreBase.setConnected');
    try {
      return super.setConnected(val);
    } finally {
      _$_ConnectionStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
connected: ${connected}
    ''';
  }
}
