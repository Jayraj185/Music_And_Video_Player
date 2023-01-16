import 'package:flutter/material.dart';

class HomeModal {
  String? m_name, m_artist, m_image, m_audio;
  bool? m_play;
  int i=0;
  Color? color;

  HomeModal({this.m_name, this.m_artist, this.m_image, this.m_audio, this.m_play,required this.i,this.color});
}
