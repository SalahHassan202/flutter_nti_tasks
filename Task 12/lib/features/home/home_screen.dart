import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_streaming_app/core/data/controllers/movies_controller.dart';
import 'package:movie_streaming_app/core/theme/app_colors.dart';
import 'package:movie_streaming_app/features/home/components/movies_section.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.bg,
        body: RefreshIndicator(
          color: AppColors.primary,
          onRefresh: () => context.read<MoviesController>().getData(),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 36, horizontal: 16),
            child: CustomScrollView(
              slivers: <Widget>[
                SliverAppBar(
                  title: Text(
                    "Find Movies, Tv series,\nand more..",
                    style: GoogleFonts.lato(
                      fontSize: 24,
                      color: AppColors.text1,
                    ),
                  ),
                ),
                SliverAppBar(
                  pinned: true,
                  backgroundColor: AppColors.bg,
                  elevation: 0,
                  scrolledUnderElevation: 0,
                  collapsedHeight: 70,
                  title: Consumer<MoviesController>(
                    builder: (context, p, child) {
                      return TextField(
                        controller: p.searchC,
                        cursorColor: AppColors.primary,
                        style: GoogleFonts.lato(color: AppColors.text1),
                        onChanged: (value) => p.searchFunction(value),
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.bg2,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(color: AppColors.primary),
                          ),
                          hintText: "Search ..",
                          prefixIcon: Icon(
                            Icons.search,
                            color: AppColors.text1,
                          ),
                          suffixIcon:
                              p.searchC.text.trim() != "" &&
                                  p.searchC.text.trim().isNotEmpty
                              ? GestureDetector(
                                  onTap: () => p.reset(),
                                  child: Icon(
                                    Icons.clear,
                                    color: AppColors.text1,
                                  ),
                                )
                              : SizedBox.shrink(),
                        ),
                      );
                    },
                  ),
                ),
                SliverGap(24),
                MoviesSection(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
