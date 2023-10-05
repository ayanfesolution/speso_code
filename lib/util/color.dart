import 'package:flutter/material.dart';

const kPRYCOLOUR = Color(0xFF6F5DE7);
const kSECCOLOUR = Color(0xFF0A6375);
const kBLKCOLOUR = Color(0xff111827);
const kWHTCOLOUR = Color(0xFFFFFFFF);
const kREDCOLOUR = Color(0xFFC60F0F);
const kTransperent = Color(0x00FFFFFF);
const kLightGray = Color(0xFF6B7280);
const kLIGHTINACTIVE = Color(0xFFE5E7EB);
const kTEXTFIELDBACKGROUND = Color(0xFFF9FAFB);
const kBorderLineColor = Color(0xFFE5E7EB);
const kLightButton = Color(0xFF727272);
const kINACTIVECOLOR = Color(0xB1111827);

Map<int, Color> kPrimaryColorMap = {
  50: const Color.fromRGBO(111, 93, 231, .1),
  100: const Color.fromRGBO(111, 93, 231, .2),
  200: const Color.fromRGBO(111, 93, 231, .3),
  300: const Color.fromRGBO(111, 93, 231, .4),
  400: const Color.fromRGBO(111, 93, 231, .5),
  500: const Color.fromRGBO(111, 93, 231, .6),
  600: const Color.fromRGBO(111, 93, 231, .7),
  700: const Color.fromRGBO(111, 93, 231, .8),
  800: const Color.fromRGBO(111, 93, 231, .9),
  900: const Color.fromRGBO(111, 93, 231, 1),
};

MaterialColor customKPrimaryColor = MaterialColor(0xFF111827, kPrimaryColorMap);
