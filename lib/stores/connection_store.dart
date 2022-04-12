import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:mobx/mobx.dart';
part 'connection_store.g.dart';

class ConnectionStore = _ConnectionStoreBase with _$ConnectionStore;

abstract class _ConnectionStoreBase with Store {
  _ConnectionStoreBase() {
    setupListener();
  }

  void setupListener() {
    InternetConnectionChecker().checkInterval = const Duration(seconds: 10);
    InternetConnectionChecker().onStatusChange.listen((event) {
      setConnected(event == InternetConnectionStatus.connected);
    });
  }

  @observable
  bool connected = true;

  @action
  void setConnected(bool val) => connected = val;
}
