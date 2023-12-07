import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class UrlPath extends StatelessWidget {
  final String UrlPath1;
  const UrlPath({super.key, required this.UrlPath1});

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(UrlPath1);
  }
}