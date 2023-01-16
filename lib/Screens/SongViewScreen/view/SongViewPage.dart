import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:media_booster/Screens/HomeScreen/provider/HomeProvider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class SongViewPage extends StatefulWidget {
  const SongViewPage({Key? key}) : super(key: key);

  @override
  State<SongViewPage> createState() => _SongViewPageState();
}

class _SongViewPageState extends State<SongViewPage> {
  HomeProvider? ProviderTrue;
  HomeProvider? ProviderFalse;
  @override
  void initState() {
    super.initState();
    Provider.of<HomeProvider>(context, listen: false).Music();
  }
  @override
  Widget build(BuildContext context) {
    ProviderTrue = Provider.of<HomeProvider>(context, listen: true);
    ProviderFalse = Provider.of<HomeProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: (){

              ProviderFalse!.onoff(true);
              Navigator.pop(context,'/');
            },
            icon: Icon(Icons.arrow_back,color: Colors.white,),
          ),
          title: Text(
            "Now Playing",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: Stack(
          children: [
            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  "${ProviderTrue!.h1!.m_image}",
                  fit: BoxFit.cover,
                )
            ),
            Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Colors.black54,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 30.h,
                    width: 30.h,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(21)
                    ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(21),
                        child: Image.asset(
                          "${ProviderTrue!.h1!.m_image}",
                        ),
                      )
                  ),
                  SizedBox(height: 1.5.h,),
                  Text(
                    "${ProviderTrue!.h1!.m_name}",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.sp
                    ),
                  ),
                  SizedBox(height: 0.6.h,),
                  Container(
                    height: 8.h,
                    width: 70.w,
                    alignment: Alignment.topCenter,
                    child: Text(
                        "${ProviderTrue!.h1!.m_artist}",
                        style: TextStyle(
                            color: Colors.white60,
                            fontSize: 13.sp
                        ),
                      ),
                  ),
                  Container(
                    height: 8.h,
                    width: 60.w,
                    alignment: Alignment.topCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InkWell(
                          onTap:(){
                            ProviderFalse!.onoff(true);
                            if(ProviderFalse!.on!)
                            {
                              ProviderFalse!.audioPlayer.pause();
                            }
                            else
                            {
                              ProviderFalse!.audioPlayer.play();
                            }
                             ProviderFalse!.changevalue(false,ProviderTrue!.h1!.i);
                          },
                            child: Container(
                                height: 5.h,
                                width: 5.h,
                                child: Icon(Icons.square,color: Colors.white,size: 21,)
                            )
                        ),
                        InkWell(
                        onTap: (){
                          print("${ProviderFalse!.songpath}");
                          //ProviderFalse!.changesongpath("${ProviderFalse!.h1!.m_audio}");
                          ProviderFalse!.onoff(false);
                          if(ProviderFalse!.h1!.m_play!)
                          {
                            ProviderFalse!.audioPlayer.pause();
                          }
                          else
                          {
                            ProviderFalse!.audioPlayer.play();
                          }
                          ProviderTrue!.SongSound();
                          ProviderFalse!.changevalue(!ProviderFalse!.h1!.m_play!,ProviderTrue!.h1!.i);
                        },
                        child: Container(
                            height: 8.h,
                            width: 8.h,
                            child: Icon(ProviderTrue!.h1!.m_play!?Icons.pause:Icons.play_arrow_sharp,color: Colors.white,size: 60,)
                        )
                        ),
                        InkWell(
                          onTap: (){
                            ProviderTrue!.HeadPhone();
                            ProviderTrue!.SongSound();
                          },
                          child: Container(
                            height: 5.h,
                            width: 5.h,
                              child: Icon(ProviderTrue!.sound?Icons.headphones:Icons.headset_off,color: Colors.white,size: 31,)
                          ),
                        ),
                      ],
                    ),
                  ),
                  PlayerBuilder.currentPosition(
                      player: ProviderFalse!.audioPlayer,
                      builder: (context, position) {
                        return ProviderTrue!.on
                            ?Container()
                            :Column(
                          children: [
                            Slider(
                              inactiveColor: Colors.white54,
                              value: position.inSeconds.toDouble(),
                              max: ProviderTrue!.songduration.inSeconds.toDouble(),
                              onChanged: (value){
                                ProviderFalse!.audioPlayer.seek(Duration(seconds: value.toInt()));
                              },
                              activeColor: Colors.indigo,
                            ),
                            SizedBox(height: 0.6.h,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  // "${position.inHours}:${position.inMinutes}:${position.inSeconds} / ${ProviderTrue!.songduration}",
                                  "${position.inHours}:${position.inMinutes}:${position.inSeconds.toInt()} / ${ProviderTrue!.songduration.inHours}:${ProviderTrue!.songduration.inMinutes}:${ProviderTrue!.songduration.inSeconds}",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.sp,
                                      fontWeight: FontWeight.bold

                                  ),
                                )
                              ],
                            )
                          ],
                        );
                      },
                  )
                ],
              ),
            ),

          ],
        ),
      ),
    );
  }
}
