import 'package:flutter/material.dart';
import 'package:media_booster/Screens/HomeScreen/provider/HomeProvider.dart';
import 'package:media_booster/Screens/HomeScreen/view/HomePage.dart';
import 'package:media_booster/Screens/MVPlayer/provider/MVProvider.dart';
import 'package:media_booster/Screens/MVPlayer/view/MusicAndVideoScreen.dart';
import 'package:media_booster/Screens/SongViewScreen/view/SongViewPage.dart';
import 'package:media_booster/Screens/VideoScreen/provider/VideoProvider.dart';
import 'package:media_booster/Screens/VideoScreen/view/CricketPage.dart';
import 'package:media_booster/Screens/VideoScreen/view/VideoPage.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

void main()
{
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => HomeProvider(),),
        ChangeNotifierProvider(create: (context) => VideoProvider(),),
        ChangeNotifierProvider(create: (context) => MVProvider(),),
      ],
      child: Sizer(
        builder: (context, orientation, deviceType) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            routes: {
              '/' : (context) => MusicAndVideoScrenn(),
              'Music' : (context) => HomePage(),
              'SongView' : (context) => SongViewPage(),
              'Video' : (context) => VideoPage(),
              'CricketPage' : (context) => CricketPage(),
            },
          );
        },
      ),
    )
  );
}