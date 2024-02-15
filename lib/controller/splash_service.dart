import 'dart:async';

import 'package:flutter/material.dart';
import 'package:news/views/screen_home.dart';

class SplashService{
  void islogin(BuildContext context){




Timer(const Duration(seconds: 5), ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>const ScreenHome())));




  }
}