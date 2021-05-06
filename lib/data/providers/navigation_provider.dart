
import 'package:flutter/foundation.dart';

enum PageName { home, settings }

class NavigationProvider with ChangeNotifier {
  PageName _pageName = PageName.home;

  void setPageName(PageName name) {
    _pageName = name;
    notifyListeners();
  }

  void updateState() {
    notifyListeners();
  }

  PageName get currentName => _pageName;

}
