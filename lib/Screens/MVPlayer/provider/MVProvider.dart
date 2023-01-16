import 'package:flutter/cupertino.dart';
import 'package:media_booster/Screens/HomeScreen/view/HomePage.dart';
import 'package:media_booster/Screens/VideoScreen/view/VideoPage.dart';

class MVProvider extends ChangeNotifier
{
  int index=0;
  void ChangeIndex(inde)
  {
    index=inde;
    notifyListeners();
  }
  List Screens = [
    VideoPage(),
    HomePage(),
  ];
}