import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:music_app/presentation/home/screens/search_screen/cards.dart';
import 'package:music_app/presentation/home/screens/search_screen/search_bar_list.dart';
import 'package:music_app/presentation/home/screens/search_screen/tranding_artists_page.dart';
import 'package:music_app/presentation/home/widgets/buttons/buttom_nav_bar.dart';
import 'package:music_app/presentation/home/widgets/text.dart';
import 'package:music_app/service/search_page_api/trending_artistd_api/search_api.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  late TextEditingController _searchController;
  late String _searchQuery;

  @override
  void initState() {
    super.initState();
    _searchController = TextEditingController();
    _searchQuery = '';
  }

  @override
  Widget build(BuildContext context) {
    final searchService = ref.read(searchProvider);
    final List<String> cardTexts = [
      'TAMIL',
      'INTERNATIONAL',
      'POP',
      'HIP-HOP',
      'DANCE',
      'COUNTRY',
      'INDIE',
      'JAZZ',
      'PUNK',
      'R&B',
    ];
    final List<String> cardImages = [
      'assets/image 29.png',
      'assets/image 28.png',
      'assets/image 33.png',
      'assets/Hippop.png',
      'assets/image 31.png',
      'assets/image 32.png',
      'assets/image 30.png',
      'assets/Jazz.png',
      'assets/Punk.png',
      'assets/R&B.png'
    ];

    return LayoutBuilder(
      builder: (context, constraints) {
        return Scaffold(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          appBar: AppBar(
            surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
            automaticallyImplyLeading: false,
            elevation: 0.0,
            centerTitle: true,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            title: SingleChildScrollView(
              child: Stack(
                children: [
                  Container(
                    width: 365,
                    child: TextField(
                      controller: _searchController,
                      onChanged: (value) {
                        setState(() {
                          _searchQuery = value;
                        });
                      },
                      onSubmitted: (value) {
                        searchService.searchTracks(_searchQuery);
                      },
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
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (_searchQuery.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 10, left: 25),
                    child: Container(
                        height: 270,
                        child: SearchResultsList(searchQuery: _searchQuery)),
                  ),
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
                        'Trending songs',
                        style: TextStyles.text4(context),
                      ),
                    ],
                  ),
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30, left: 15),
                    child: TrandingArtists(),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    top: 40,
                    left: 15,
                  ),
                  child: Text(
                    'Browse',
                    style: TextStyles.text4(context),
                  ),
                ),
                SizedBox(
                  height: 600,
                  child: GridView.builder(
                    itemCount: 10,
                    padding: EdgeInsets.all(18),
                    scrollDirection: Axis.vertical,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: constraints.maxWidth > 600 ? 2 : 2,
                      mainAxisSpacing: constraints.maxWidth > 600 ? 20 : 20,
                      crossAxisSpacing: constraints.maxWidth > 600 ? 20 : 20,
                      mainAxisExtent: constraints.maxWidth > 600 ? 100 : 100,
                    ),
                    itemBuilder: (BuildContext context, int index) {
                      return CardScreen2(
                        text: cardTexts[index],
                        image: cardImages[index],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
          bottomNavigationBar: ButtomNavBar(),
        );
      },
    );
  }
}
