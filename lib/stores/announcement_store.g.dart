// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'announcement_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$AnnouncementStore on _AnnouncementStoreBase, Store {
  Computed<bool>? _$imagesValidComputed;

  @override
  bool get imagesValid =>
      (_$imagesValidComputed ??= Computed<bool>(() => super.imagesValid,
              name: '_AnnouncementStoreBase.imagesValid'))
          .value;
  Computed<String>? _$imagesErrorComputed;

  @override
  String get imagesError =>
      (_$imagesErrorComputed ??= Computed<String>(() => super.imagesError,
              name: '_AnnouncementStoreBase.imagesError'))
          .value;
  Computed<bool>? _$titleValidComputed;

  @override
  bool get titleValid =>
      (_$titleValidComputed ??= Computed<bool>(() => super.titleValid,
              name: '_AnnouncementStoreBase.titleValid'))
          .value;
  Computed<String?>? _$titleErrorComputed;

  @override
  String? get titleError =>
      (_$titleErrorComputed ??= Computed<String?>(() => super.titleError,
              name: '_AnnouncementStoreBase.titleError'))
          .value;
  Computed<bool>? _$descriptionValidComputed;

  @override
  bool get descriptionValid => (_$descriptionValidComputed ??= Computed<bool>(
          () => super.descriptionValid,
          name: '_AnnouncementStoreBase.descriptionValid'))
      .value;
  Computed<String?>? _$descriptionErrorComputed;

  @override
  String? get descriptionError => (_$descriptionErrorComputed ??=
          Computed<String?>(() => super.descriptionError,
              name: '_AnnouncementStoreBase.descriptionError'))
      .value;
  Computed<bool>? _$categoryValidComputed;

  @override
  bool get categoryValid =>
      (_$categoryValidComputed ??= Computed<bool>(() => super.categoryValid,
              name: '_AnnouncementStoreBase.categoryValid'))
          .value;
  Computed<String?>? _$categoryErrorComputed;

  @override
  String? get categoryError =>
      (_$categoryErrorComputed ??= Computed<String?>(() => super.categoryError,
              name: '_AnnouncementStoreBase.categoryError'))
          .value;
  Computed<Address?>? _$addressComputed;

  @override
  Address? get address =>
      (_$addressComputed ??= Computed<Address?>(() => super.address,
              name: '_AnnouncementStoreBase.address'))
          .value;
  Computed<bool>? _$addressValidComputed;

  @override
  bool get addressValid =>
      (_$addressValidComputed ??= Computed<bool>(() => super.addressValid,
              name: '_AnnouncementStoreBase.addressValid'))
          .value;
  Computed<String?>? _$addressErrorComputed;

  @override
  String? get addressError =>
      (_$addressErrorComputed ??= Computed<String?>(() => super.addressError,
              name: '_AnnouncementStoreBase.addressError'))
          .value;
  Computed<num?>? _$priceComputed;

  @override
  num? get price => (_$priceComputed ??= Computed<num?>(() => super.price,
          name: '_AnnouncementStoreBase.price'))
      .value;
  Computed<bool>? _$priceValidComputed;

  @override
  bool get priceValid =>
      (_$priceValidComputed ??= Computed<bool>(() => super.priceValid,
              name: '_AnnouncementStoreBase.priceValid'))
          .value;
  Computed<String?>? _$priceErrorComputed;

  @override
  String? get priceError =>
      (_$priceErrorComputed ??= Computed<String?>(() => super.priceError,
              name: '_AnnouncementStoreBase.priceError'))
          .value;
  Computed<bool>? _$formValidComputed;

  @override
  bool get formValid =>
      (_$formValidComputed ??= Computed<bool>(() => super.formValid,
              name: '_AnnouncementStoreBase.formValid'))
          .value;

  final _$titleAtom = Atom(name: '_AnnouncementStoreBase.title');

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$descriptionAtom = Atom(name: '_AnnouncementStoreBase.description');

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  final _$categoryAtom = Atom(name: '_AnnouncementStoreBase.category');

  @override
  Category? get category {
    _$categoryAtom.reportRead();
    return super.category;
  }

  @override
  set category(Category? value) {
    _$categoryAtom.reportWrite(value, super.category, () {
      super.category = value;
    });
  }

  final _$hidePhoneAtom = Atom(name: '_AnnouncementStoreBase.hidePhone');

  @override
  bool get hidePhone {
    _$hidePhoneAtom.reportRead();
    return super.hidePhone;
  }

  @override
  set hidePhone(bool value) {
    _$hidePhoneAtom.reportWrite(value, super.hidePhone, () {
      super.hidePhone = value;
    });
  }

  final _$priceTextAtom = Atom(name: '_AnnouncementStoreBase.priceText');

  @override
  String get priceText {
    _$priceTextAtom.reportRead();
    return super.priceText;
  }

  @override
  set priceText(String value) {
    _$priceTextAtom.reportWrite(value, super.priceText, () {
      super.priceText = value;
    });
  }

  final _$showErrorsAtom = Atom(name: '_AnnouncementStoreBase.showErrors');

  @override
  bool get showErrors {
    _$showErrorsAtom.reportRead();
    return super.showErrors;
  }

  @override
  set showErrors(bool value) {
    _$showErrorsAtom.reportWrite(value, super.showErrors, () {
      super.showErrors = value;
    });
  }

  final _$_AnnouncementStoreBaseActionController =
      ActionController(name: '_AnnouncementStoreBase');

  @override
  void setTitle(String value) {
    final _$actionInfo = _$_AnnouncementStoreBaseActionController.startAction(
        name: '_AnnouncementStoreBase.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$_AnnouncementStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(String value) {
    final _$actionInfo = _$_AnnouncementStoreBaseActionController.startAction(
        name: '_AnnouncementStoreBase.setDescription');
    try {
      return super.setDescription(value);
    } finally {
      _$_AnnouncementStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCategory(Category value) {
    final _$actionInfo = _$_AnnouncementStoreBaseActionController.startAction(
        name: '_AnnouncementStoreBase.setCategory');
    try {
      return super.setCategory(value);
    } finally {
      _$_AnnouncementStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHidePhone(bool? value) {
    final _$actionInfo = _$_AnnouncementStoreBaseActionController.startAction(
        name: '_AnnouncementStoreBase.setHidePhone');
    try {
      return super.setHidePhone(value);
    } finally {
      _$_AnnouncementStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPrice(String value) {
    final _$actionInfo = _$_AnnouncementStoreBaseActionController.startAction(
        name: '_AnnouncementStoreBase.setPrice');
    try {
      return super.setPrice(value);
    } finally {
      _$_AnnouncementStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void invalidSendPressed() {
    final _$actionInfo = _$_AnnouncementStoreBaseActionController.startAction(
        name: '_AnnouncementStoreBase.invalidSendPressed');
    try {
      return super.invalidSendPressed();
    } finally {
      _$_AnnouncementStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
title: ${title},
description: ${description},
category: ${category},
hidePhone: ${hidePhone},
priceText: ${priceText},
showErrors: ${showErrors},
imagesValid: ${imagesValid},
imagesError: ${imagesError},
titleValid: ${titleValid},
titleError: ${titleError},
descriptionValid: ${descriptionValid},
descriptionError: ${descriptionError},
categoryValid: ${categoryValid},
categoryError: ${categoryError},
address: ${address},
addressValid: ${addressValid},
addressError: ${addressError},
price: ${price},
priceValid: ${priceValid},
priceError: ${priceError},
formValid: ${formValid}
    ''';
  }
}
