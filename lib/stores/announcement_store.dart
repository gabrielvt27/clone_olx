import 'package:clone_olx/models/address.dart';
import 'package:clone_olx/models/category.dart';
import 'package:clone_olx/repositories/announcement_repository.dart';
import 'package:clone_olx/stores/cep_store.dart';
import 'package:clone_olx/stores/user_manager_store.dart';
import 'package:clone_olx/view_models/announcement_view_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
part 'announcement_store.g.dart';

class AnnouncementStore = _AnnouncementStoreBase with _$AnnouncementStore;

abstract class _AnnouncementStoreBase with Store {
  ObservableList images = ObservableList();

  @computed
  bool get imagesValid => images.isNotEmpty;

  @computed
  String get imagesError {
    if (!showErrors || imagesValid) {
      return '';
    } else {
      return 'Insira imagens';
    }
  }

  @observable
  String title = '';

  @action
  void setTitle(String value) => title = value;

  @computed
  bool get titleValid => title.length >= 6;

  @computed
  String? get titleError {
    if (!showErrors || titleValid) {
      return null;
    } else if (title.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Título muito curto';
    }
  }

  @observable
  String description = '';

  @action
  void setDescription(String value) => description = value;

  @computed
  bool get descriptionValid => description.length >= 10;

  @computed
  String? get descriptionError {
    if (!showErrors || descriptionValid) {
      return null;
    } else if (description.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Descrição muito curta';
    }
  }

  @observable
  Category? category;

  @action
  void setCategory(Category value) => category = value;

  @computed
  bool get categoryValid => category != null;

  @computed
  String? get categoryError {
    if (!showErrors || categoryValid) {
      return null;
    } else {
      return 'Campo obrigatório';
    }
  }

  @observable
  bool hidePhone = false;

  @action
  void setHidePhone(bool? value) => hidePhone = value!;

  CepStore cepStore = CepStore();

  @computed
  Address? get address => cepStore.address;

  @computed
  bool get addressValid => address != null;

  @computed
  String? get addressError {
    if (!showErrors || addressValid) {
      return null;
    } else {
      return 'Campo obrigatório';
    }
  }

  @observable
  String priceText = '';

  @action
  void setPrice(String value) => priceText = value;

  @computed
  num? get price {
    if (priceText.isEmpty) {
      return null;
    } else if (priceText.contains(',')) {
      return num.tryParse(priceText.replaceAll(RegExp('[^0-9]'), ''))! / 100;
    } else {
      return num.tryParse(priceText);
    }
  }

  @computed
  bool get priceValid => price != null && price! <= 9999999;

  @computed
  String? get priceError {
    if (!showErrors || priceValid) {
      return null;
    } else if (priceText.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'Preço inválido';
    }
  }

  @observable
  bool showErrors = false;

  @action
  void invalidSendPressed() => showErrors = true;

  @computed
  bool get formValid =>
      imagesValid &&
      titleValid &&
      descriptionValid &&
      categoryValid &&
      addressValid &&
      priceValid;

  VoidCallback? get sendPressed => formValid ? _send : null;

  void _send() {
    final user = GetIt.I<UserManagerStore>().user;

    final announcement = AnnouncementViewModel(
      images: images,
      title: title,
      description: description,
      category: category!,
      address: address!,
      price: price!,
      hidePhone: hidePhone,
      user: user!,
    );

    AnnouncementRepository().save(announcement);
  }
}
