import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextStyles {
  static TextStyle text(BuildContext context) => GoogleFonts.interTight(
        fontSize: 16,
        fontWeight: FontWeight.w300,
        color: Theme.of(context).primaryColor,
      );

  static TextStyle text2(BuildContext context) => GoogleFonts.interTight(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).hintColor,
      );
  static TextStyle text4(BuildContext context) => GoogleFonts.interTight(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).primaryColor,
      );

  static TextStyle text3(BuildContext context) => GoogleFonts.interTight(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).hintColor,
      );
  static TextStyle text5(BuildContext context) => GoogleFonts.interTight(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: Colors.white,
      );

  static TextStyle smalltext(BuildContext context) => GoogleFonts.interTight(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).primaryColor,
      );
  static TextStyle smalltext2(BuildContext context) => GoogleFonts.interTight(
        fontSize: 12,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).hintColor,
      );
  static TextStyle smalltext4(BuildContext context) => GoogleFonts.interTight(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: Theme.of(context).hintColor,
      );
  static TextStyle smalltext5(BuildContext context) => GoogleFonts.interTight(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: Theme.of(context).hintColor,
      );

  static TextStyle smalltext3(BuildContext context) => GoogleFonts.interTight(
        fontSize: 12,
        fontWeight: FontWeight.w700,
        color: Theme.of(context).primaryColor,
      );

  static TextStyle medium(BuildContext context) => GoogleFonts.interTight(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).primaryColor,
      );

  static TextStyle medium2(BuildContext context) => GoogleFonts.interTight(
        fontSize: 20,
        fontWeight: FontWeight.w700,
        color: Theme.of(context).primaryColor,
      );

  static TextStyle bigtext(BuildContext context) => GoogleFonts.interTight(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).primaryColor,
      );

  static TextStyle bigtext1(BuildContext context) => GoogleFonts.interTight(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: Theme.of(context).primaryColor,
      );
  static TextStyle bigtext2(BuildContext context) => GoogleFonts.interTight(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        color: Theme.of(context).hintColor,
      );
}
