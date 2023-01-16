import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/material.dart';
import 'package:media_booster/Screens/HomeScreen/modal/HomeModal.dart';

class HomeProvider extends ChangeNotifier
{
  // only variable
  bool play=false;
  AssetsAudioPlayer audioPlayer = AssetsAudioPlayer();
  List<HomeModal> MusicList = [
    HomeModal(m_name: "Sultan",m_artist: "Mohan Krishna, Abhishek Chaithra Soman and Deepesh A K", m_image: "asset/image/sultan.jpg", m_audio: "asset/audio/sultan.mp3",m_play: false,i: 0,color: Colors.indigo),
    HomeModal(m_name: "Atak Gaya",m_artist: "Arijit Singh and Rupali Moghe", m_image: "asset/image/atak_gaya.jpg", m_audio: "asset/audio/atakgaya.mp3",m_play: false,i: 1,color: Colors.blue),
    HomeModal(m_name: "Aafat",m_artist: "Rashmi Virag, Tanishk Bagchi, and Zahrah S Khan", m_image: "asset/image/aafat.jpg",m_audio: "asset/audio/aafat.m4a",m_play: false,i: 2,color: Colors.lightBlue),
    HomeModal(m_name: "Allah Wariyah",m_artist: "Shafqat Amanat Ali", m_image: "asset/image/allah_wariyah.jpg",m_audio: "asset/audio/allah_wariyah.m4a",m_play: false,i: 3,color: Colors.green),
    HomeModal(m_name: "Biliomera",m_artist: "Otilia Bruma", m_image: "asset/image/biliomera.jpg",m_audio: "asset/audio/biliomera.m4a",m_play: false,i: 4,color: Colors.lightGreen),
    HomeModal(m_name: "Channa Ve",m_artist: "	Akhil Sachdeva, Mansheel Gujral", m_image: "asset/image/channa_ve.jpg",m_audio: "asset/audio/channa_ve.m4a",m_play: false,i: 5,color: Colors.greenAccent),
    HomeModal(m_name: "Desi Desi Na Bolya Kar Chori Hai",m_artist: "Surender Romio", m_image: "asset/image/desi_desi_na.jpg",m_audio: "asset/audio/desi_desi_na.m4a",m_play: false,i: 6,color: Colors.orange),
    HomeModal(m_name: "Hey Mama",m_artist: "David Guetta", m_image: "asset/image/hey_mama.jpg",m_audio: "asset/audio/hey_mama.m4a",m_play: false,i: 7,color: Colors.amber),
    HomeModal(m_name: "Jan Ban Jaa",m_artist: "Mithoon, Vishal Mishra & Asees Kaur", m_image: "asset/image/jan_ban_ja.jpg",m_audio: "asset/audio/jan_ban_jaa.m4a",m_play: false,i: 8,color: Colors.yellow),
    HomeModal(m_name: "Kheriyat",m_artist: "Arijit Singh", m_image: "asset/image/kheriyat.jpg",m_audio: "asset/audio/kheriyat.m4a",m_play: false,i: 9,color: Colors.red),
    HomeModal(m_name: "Maiya Menu",m_artist: "Sachet Tandon", m_image: "asset/image/maiya_menu.jpg",m_audio: "asset/audio/maiya_menu.m4a",m_play: false,i: 10,color: Colors.orange.shade900),
    HomeModal(m_name: "Mere Liya Tum Kaafi Ho",m_artist: "Ayushmann Khurrana", m_image: "asset/image/mere_liye_tum.jpg",m_audio: "asset/audio/mere_liye_tum.m4a",m_play: false,i: 11,color: Colors.orange.shade700),
    HomeModal(m_name: "Mere Samne Vali Khidki Mai",m_artist: "Ashish Patil", m_image: "asset/image/mere_samne_vali.jpg",m_audio: "asset/audio/mere_samne_vali.m4a",m_play: false,i: 12,color: Colors.purple),
    HomeModal(m_name: "Pehla Pyar",m_artist: "Armaan Malik", m_image: "asset/image/pehla_pyar.jpg",m_audio: "asset/audio/pehla_pyar.m4a",m_play: false,i: 13,color: Colors.purpleAccent),
    HomeModal(m_name: "Beleiver",m_artist: " Imagine Dragons", m_image: "asset/image/beleiver.jpg",m_audio: "asset/audio/beleiver.m4a",m_play: false,i: 14,color: Colors.purple.shade200),
  ];
  String songpath="asset/audio/atakgaya.mp3";
  Duration songduration = Duration(seconds: 0,hours: 0,minutes: 0);
  HomeModal? h1;
  bool on=true;
  bool sound = true;



  void ch(val)
  {
    play=val;
    notifyListeners();
  }
  void Data(HomeModal hh)
  {
    h1 = hh;
    notifyListeners();
  }
  void changevalue(value,index)
  {
    MusicList[index].m_play=value;
    print(index);
    notifyListeners();
  }
  void onoff(value)
  {
    on=value;
    notifyListeners();
  }
  void changesongpath(value)
  {
    songpath=value;
    notifyListeners();
  }
  void Music()
  {
    audioPlayer.open(
       Audio("$songpath",),
      showNotification: true,
      autoStart: play,
    );
    SongDuration();
    //play=true;
    notifyListeners();
  }
  void SongDuration()
  {
    audioPlayer.current.listen((event) {
      songduration = event!.audio.duration;
    });
  }
  void SongSound()
  {
    if(sound)
    {
      audioPlayer.setVolume(1.0);
    }
    else
    {
      audioPlayer.setVolume(0.0);
    }
    notifyListeners();
  }
  void HeadPhone()
  {
    sound = !sound;
    notifyListeners();
  }
}