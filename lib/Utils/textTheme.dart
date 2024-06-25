import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewsText {
  static final textMainSP = GoogleFonts.noticiaText(
      fontSize: 46,
      fontWeight: FontWeight.w900,
      color: Colors.blueAccent.withOpacity(.8));

  static final textMainH =
      GoogleFonts.noticiaText(fontSize: 36, fontWeight: FontWeight.bold, color: Colors.white);
  static final textH =
      GoogleFonts.newsCycle(fontSize: 16, fontWeight: FontWeight.w900);

  static final textSub =
      GoogleFonts.newsCycle(fontSize: 8, fontWeight: FontWeight.w700);

  static final textDes =
      GoogleFonts.newsCycle(fontSize: 18, fontWeight: FontWeight.bold);

  static final textCon =
      GoogleFonts.newsCycle(fontSize: 15, fontWeight: FontWeight.w500);

  static final textRdM = GoogleFonts.newsCycle(
      fontSize: 15,
      fontStyle: FontStyle.italic,
      fontWeight: FontWeight.bold,
      color: Colors.blue);
}
