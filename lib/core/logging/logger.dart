import 'dart:developer';
import 'package:flutter/foundation.dart';

void printOut(String? msg, {int? colorCode}) async {
  if (msg != null && msg.isNotEmpty && kDebugMode) {
    try {
      if (colorCode != null) {
        final coloredMsg = '\u001b[$colorCode' 'm' '$msg' '\u001b[0m';
        log('::: $coloredMsg');
      } else {
        log('::: $msg');
      }
    } catch (error) {
      log(msg);
    }
  } else {
    log('S.O.S => printing a null value');
  }
}


/*
some examples of color code:
30: black
31: red
32: green
33: yellow
34: system blue
35: purple
36: cyan
37: white
38: system yellow


the color of js console is defined here:
https://github.com/mochajs/mocha/blob/9e95d36e4b715380cef573014dec852bded3f8e1/lib/reporters/base.js#L48
*/