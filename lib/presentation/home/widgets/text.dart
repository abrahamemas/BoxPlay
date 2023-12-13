import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static TextStyle text(BuildContext context) => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w300,
        color: Theme.of(context).primaryColor,
      );

  static TextStyle text2(BuildContext context) => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).primaryColor,
      );

  static TextStyle text3(BuildContext context) => GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: Theme.of(context).primaryColor,
      );

  static TextStyle smalltext(BuildContext context) => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).primaryColor,
      );

  static TextStyle smalltext1(BuildContext context) => GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: Theme.of(context).primaryColor,
      );

  static TextStyle medium(BuildContext context) => GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).primaryColor,
      );

  static TextStyle medium2(BuildContext context) => GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Theme.of(context).primaryColor,
      );

  static TextStyle bigtext(BuildContext context) => GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).primaryColor,
      );

  static TextStyle bigtext1(BuildContext context) => GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: Theme.of(context).primaryColor,
      );
}