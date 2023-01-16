import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:media_booster/Screens/VideoScreen/provider/VideoProvider.dart';
import 'package:provider/provider.dart';

class CricketPage extends StatefulWidget {
  const CricketPage({Key? key}) : super(key: key);

  @override
  State<CricketPage> createState() => _CricketPageState();
}

class _CricketPageState extends State<CricketPage> {
  VideoProvider? ProviderTrue;
  VideoProvider? ProviderFalse;
  @override
  void initState() {
    super.initState();
    Provider.of<VideoProvider>(context,listen: false).loadVideo();
  }
  @override
  Widget build(BuildContext context) {
    ProviderTrue = Provider.of<VideoProvider>(context,listen: true);
    ProviderFalse = Provider.of<VideoProvider>(context,listen: false);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context,'/');
              ProviderFalse!.videoPlayerController!.pause();
            },
            icon: Icon(Icons.arrow_back_ios_new,color: Colors.white,),
          ),
          title: Text("${ProviderTrue!.v1!.tital}",style: TextStyle(color: Colors.white),),
          backgroundColor: Colors.black,
        ),
        backgroundColor: Colors.black,
        body: Chewie(controller:  ProviderTrue!.loadVideo()),
      ),
    );
  }
}
