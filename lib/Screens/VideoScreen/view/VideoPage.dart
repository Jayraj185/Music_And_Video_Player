import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:media_booster/Screens/VideoScreen/provider/VideoProvider.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class VideoPage extends StatefulWidget {
  const VideoPage({Key? key}) : super(key: key);

  @override
  State<VideoPage> createState() => _VideoPageState();
}

class _VideoPageState extends State<VideoPage> {
  VideoProvider? ProviderTrue;
  VideoProvider? ProviderFalse;
  // @override
  // void initState() {
  //   super.initState();
  //   Provider.of<VideoProvider>(context,listen: false).loadVideo();
  // }
  @override
  Widget build(BuildContext context) {
    ProviderTrue = Provider.of<VideoProvider>(context,listen: true);
    ProviderFalse = Provider.of<VideoProvider>(context,listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: Text("Video Player",style: TextStyle(color: Colors.black),),
          centerTitle: true,
          // bottom: ,
          backgroundColor: Colors.white,
        ),
        backgroundColor: Colors.white,
        body: ListView.builder(
          itemCount: ProviderTrue!.videoList.length,
          // itemCount: 1,
          itemBuilder: (context, index) {
          return Padding(
            padding: EdgeInsets.only(top: 4.h,right: 4.w,left: 4.w),
            child: InkWell(
              onTap: (){
                ProviderFalse!.changepath(ProviderFalse!.data[index],index);
                Navigator.pushNamed(context, 'CricketPage');
                print("============>>>>>>>> ${ProviderFalse!.data[index].video}");
              },
              child: Container(
                height: 23.h,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(21)
                ),
                child: Stack(
                  children: [
                    //Chewie(controller:  ProviderTrue!.loadVideo(index)),
                    ClipRRect(borderRadius: BorderRadius.circular(21),child: Image.asset("${ProviderFalse!.data[index].image}",fit: BoxFit.fill,height: MediaQuery.of(context).size.height,width: MediaQuery.of(context).size.width,)),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 0.6.h),
                        child: Text(
                          "${ProviderFalse!.data[index].tital}",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 21.sp,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          );
        },)
      ),
    );
  }
}
