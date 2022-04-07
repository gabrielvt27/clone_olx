// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'myads_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$MyAdsStore on _MyAdsStoreBase, Store {
  Computed<List<Announcement>>? _$activeAdsComputed;

  @override
  List<Announcement> get activeAds => (_$activeAdsComputed ??=
          Computed<List<Announcement>>(() => super.activeAds,
              name: '_MyAdsStoreBase.activeAds'))
      .value;
  Computed<List<Announcement>>? _$pendingAdsComputed;

  @override
  List<Announcement> get pendingAds => (_$pendingAdsComputed ??=
          Computed<List<Announcement>>(() => super.pendingAds,
              name: '_MyAdsStoreBase.pendingAds'))
      .value;
  Computed<List<Announcement>>? _$soldAdsComputed;

  @override
  List<Announcement> get soldAds =>
      (_$soldAdsComputed ??= Computed<List<Announcement>>(() => super.soldAds,
              name: '_MyAdsStoreBase.soldAds'))
          .value;

  final _$allAdsAtom = Atom(name: '_MyAdsStoreBase.allAds');

  @override
  List<Announcement> get allAds {
    _$allAdsAtom.reportRead();
    return super.allAds;
  }

  @override
  set allAds(List<Announcement> value) {
    _$allAdsAtom.reportWrite(value, super.allAds, () {
      super.allAds = value;
    });
  }

  final _$_getMyAdsAsyncAction = AsyncAction('_MyAdsStoreBase._getMyAds');

  @override
  Future<void> _getMyAds() {
    return _$_getMyAdsAsyncAction.run(() => super._getMyAds());
  }

  @override
  String toString() {
    return '''
allAds: ${allAds},
activeAds: ${activeAds},
pendingAds: ${pendingAds},
soldAds: ${soldAds}
    ''';
  }
}
