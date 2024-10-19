import 'package:flutter/material.dart';


/*
Configures device based off of platform and specific device

- everything is built for iOS, so no android considerations are in here

 */
class DeviceConfigs {
  static TargetPlatform? platform;

  static void getPlatform(BuildContext context){
    platform = Theme.of(context).platform;
  }

  static double topOffset({bool secondary = false}){
    if(secondary){
      switch(platform){
        case TargetPlatform.iOS:
          return 10;
        default:
          return 0;
      }
    }
    switch(platform){
      case TargetPlatform.iOS:
          return 35;
      default:
        return 0;
    }
  }

  static bool bigUi(){
    switch(platform){
      case TargetPlatform.iOS:
      return true;
      default:
        return false;
    }
  }

  static EdgeInsetsGeometry? textFieldOffset(){
    switch(platform){
      case TargetPlatform.iOS:
        return EdgeInsets.only(top:6);
      default:
        return null;
    }
  }
}