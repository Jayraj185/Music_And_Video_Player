import 'package:flutter/material.dart';
import 'package:media_booster/Screens/HomeScreen/provider/HomeProvider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
            title: Text(
              "RAINBOW MUSIC",
              style: TextStyle(color: Colors.white),
            ),
            centerTitle: true,
            backgroundColor: Colors.black,
          ),
          backgroundColor: Colors.black,
          body: ListView.builder(
            itemCount: ProviderTrue!.MusicList.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: (){
                  ProviderFalse!.Data(ProviderFalse!.MusicList[index]);
                  if(ProviderTrue!.h1!.m_play!)
                    {

                    }
                  else
                    {
                      ProviderFalse!.changevalue(false,index);
                    }
                  ProviderFalse!.changesongpath("${ProviderTrue!.MusicList[index].m_audio}");
                  Navigator.pushNamed(context, 'SongView');
                },
                child: Container(
                  height: 12.h,
                  width: MediaQuery.of(context).size.width,
                  margin: EdgeInsets.only(left:2.h,right: 2.h,top: 1.5.h),
                  decoration: BoxDecoration(
                      color: ProviderTrue!.MusicList[index].color,
                      borderRadius: BorderRadius.circular(15)
                  ),
                  alignment: Alignment.center,
                  child: ListTile(
                    leading: Container(
                      height: 6.h,
                      width: 6.h,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.red
                      ),
                      child: ClipRRect(borderRadius: BorderRadius.circular(60),child: Image.asset("${ProviderTrue!.MusicList[index].m_image}",fit: BoxFit.cover,)),
                    ),
                    title: Padding(
                      padding: EdgeInsets.only(bottom: 0.6.h),
                      child: Text("${ProviderTrue!.MusicList[index].m_name}",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15.sp),),
                    ),
                    subtitle: Text("${ProviderTrue!.MusicList[index].m_artist}",style: TextStyle(color: Colors.white60,fontSize: 10.sp)),
                    trailing: IconButton(
                      onPressed: (){
                        ProviderFalse!.changevalue(!ProviderFalse!.MusicList[index].m_play!,index);
                        //ProviderFalse!.Data(ProviderFalse!.MusicList[index]);
                        ProviderFalse!.changesongpath("${ProviderTrue!.MusicList[index].m_audio}");
                        ProviderFalse!.ch(!ProviderFalse!.play);
                        ProviderFalse!.Music();
                        print("${ProviderFalse!.songpath}");
                        if(ProviderFalse!.MusicList[index].m_play!)
                        {
                          ProviderFalse!.audioPlayer.pause();
                        }
                        else
                        {
                          ProviderFalse!.audioPlayer.play();
                        }
                        //ProviderTrue!.songpath="${ProviderTrue!.MusicList[index].m_audio}";
                        //print(ProviderTrue!.songpath);
                      },
                      icon: Icon(ProviderFalse!.MusicList[index].m_play!?Icons.pause:Icons.play_arrow_sharp,color: Colors.white,size: 30,),
                    ),
                  ),
                ),
              );
            },
          )),
    );
  }
}
