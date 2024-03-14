import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/presentation/home/widgets/text.dart';

class SearchScreen extends ConsumerWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, ref) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        elevation: 0.0,
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Stack(
          children: [
            Container(
              width: 365,
              child: TextField(
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Theme.of(context).primaryColor,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 3, horizontal: 8),
                  hintText: 'Search songs, artist, album o...',
                  hintStyle: GoogleFonts.interTight(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: Color(0xff000000),
                  ),
                  prefixIcon: Icon(Icons.search),
                  prefixIconColor: Color(0xff000000),
                ),
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 25),
            child: Row(
              children: [
                Icon(
                  Icons.trending_up_rounded,
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(
                  width: 7,
                ),
                Text(
                  'Trending artists',
                  style: TextStyles.text4(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
