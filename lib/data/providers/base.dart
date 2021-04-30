import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

enum Status { init, loading, error, loaded, update }

abstract class BaseProvider with ChangeNotifier {
  final BuildContext context;
  String errText = '';

  Status _status = Status.init;

  BaseProvider([this.context]);

  Future<void> loadData();

  Future<void> refreshData(int arg);

  bool get isInit => _status == Status.init;
  bool get isLoading => _status == Status.loading;
  bool get loadingFailed => _status == Status.error;
  bool get isLoaded => _status == Status.loaded;

  void startLoading() {
    _status = Status.loading;
    notifyListeners();
  }

  void finishLoading() {
    _status = Status.loaded;
    notifyListeners();
  }

  void receivedError(String text) {
    _status = Status.error;
    if (text != null)
      errText = text;
    notifyListeners();
  }

  void initProvider() {
    _status = Status.init;
  }

  void update() {
    _status = Status.update;
    notifyListeners();
  }
}
