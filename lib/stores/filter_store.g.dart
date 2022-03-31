// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filter_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$FilterStore on _FilterStoreBase, Store {
  Computed<bool>? _$priceValidComputed;

  @override
  bool get priceValid =>
      (_$priceValidComputed ??= Computed<bool>(() => super.priceValid,
              name: '_FilterStoreBase.priceValid'))
          .value;
  Computed<String?>? _$priceErrorComputed;

  @override
  String? get priceError =>
      (_$priceErrorComputed ??= Computed<String?>(() => super.priceError,
              name: '_FilterStoreBase.priceError'))
          .value;

  final _$orderByAtom = Atom(name: '_FilterStoreBase.orderBy');

  @override
  OrderBy get orderBy {
    _$orderByAtom.reportRead();
    return super.orderBy;
  }

  @override
  set orderBy(OrderBy value) {
    _$orderByAtom.reportWrite(value, super.orderBy, () {
      super.orderBy = value;
    });
  }

  final _$maxPriceAtom = Atom(name: '_FilterStoreBase.maxPrice');

  @override
  int? get maxPrice {
    _$maxPriceAtom.reportRead();
    return super.maxPrice;
  }

  @override
  set maxPrice(int? value) {
    _$maxPriceAtom.reportWrite(value, super.maxPrice, () {
      super.maxPrice = value;
    });
  }

  final _$minPriceAtom = Atom(name: '_FilterStoreBase.minPrice');

  @override
  int? get minPrice {
    _$minPriceAtom.reportRead();
    return super.minPrice;
  }

  @override
  set minPrice(int? value) {
    _$minPriceAtom.reportWrite(value, super.minPrice, () {
      super.minPrice = value;
    });
  }

  final _$_FilterStoreBaseActionController =
      ActionController(name: '_FilterStoreBase');

  @override
  void setOrderBy(OrderBy val) {
    final _$actionInfo = _$_FilterStoreBaseActionController.startAction(
        name: '_FilterStoreBase.setOrderBy');
    try {
      return super.setOrderBy(val);
    } finally {
      _$_FilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMaxPrice(String val) {
    final _$actionInfo = _$_FilterStoreBaseActionController.startAction(
        name: '_FilterStoreBase.setMaxPrice');
    try {
      return super.setMaxPrice(val);
    } finally {
      _$_FilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMinPrice(String val) {
    final _$actionInfo = _$_FilterStoreBaseActionController.startAction(
        name: '_FilterStoreBase.setMinPrice');
    try {
      return super.setMinPrice(val);
    } finally {
      _$_FilterStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
orderBy: ${orderBy},
maxPrice: ${maxPrice},
minPrice: ${minPrice},
priceValid: ${priceValid},
priceError: ${priceError}
    ''';
  }
}
