import 'package:flutter/material.dart';
import 'package:media_booster/Screens/MVPlayer/provider/MVProvider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class MusicAndVideoScrenn extends StatefulWidget {
  const MusicAndVideoScrenn({Key? key}) : super(key: key);

  @override
  State<MusicAndVideoScrenn> createState() => _MusicAndVideoScrennState();
}

class _MusicAndVideoScrennState extends State<MusicAndVideoScrenn> {
  MVProvider? ProviderTrue;
  MVProvider? ProviderFalse;
  @override
  Widget build(BuildContext context) {
    ProviderTrue = Provider.of<MVProvider>(context,listen: true);
    ProviderFalse = Provider.of<MVProvider>(context,listen: false);
    return SafeArea(
      child: Scaffold(
        body: ProviderTrue!.Screens[ProviderTrue!.index],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          unselectedItemColor: Colors.grey,
          onTap: (index){
            ProviderFalse!.ChangeIndex(index);
          },
          currentIndex: ProviderTrue!.index,
          selectedItemColor: Colors.black,
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.videocam_rounded,),label: "Video Player"),
            BottomNavigationBarItem(icon: Icon(Icons.music_note,),label: " Rainbow Music"),
          ],
        ),
      ),
    );
  }
}
