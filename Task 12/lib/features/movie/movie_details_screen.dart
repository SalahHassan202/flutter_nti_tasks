import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_streaming_app/core/data/controllers/movies_controller.dart';
import 'package:movie_streaming_app/core/data/models/movies_model.dart';
import 'package:movie_streaming_app/core/theme/app_colors.dart';
import 'package:movie_streaming_app/features/home/components/movie_card.dart';
import 'package:provider/provider.dart';

class MovieDetailsScreen extends StatelessWidget {
  const MovieDetailsScreen({super.key, required this.movie});
  final MoviesModel movie;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: Stack(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height * 0.3,
                  child: CachedNetworkImage(
                    imageUrl: movie.movieBanner,
                    placeholder: (context, url) => Container(
                      width: double.infinity,
                      height: 150,
                      color: AppColors.bg2,
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 40,
                  left: 24,
                  child: IconButton.filled(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: IconButton.styleFrom(
                      backgroundColor: AppColors.bg2,
                      foregroundColor: AppColors.primary,
                    ),
                    icon: Icon(Icons.arrow_back_ios_new),
                  ),
                ),
              ],
            ),
          ),
          SliverGap(24),
          SliverPadding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    "${movie.title}  (${movie.releaseDate})",
                    style: GoogleFonts.lato(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: AppColors.text1,
                    ),
                  ),
                  Gap(10),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              color: AppColors.text2,
                              size: 18,
                            ),
                            Gap(6),
                            Text(
                              "${movie.runningTime} minutes",
                              style: GoogleFonts.lato(
                                color: AppColors.text2,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Row(
                          children: [
                            Icon(Icons.star, color: AppColors.text2, size: 18),
                            Gap(6),
                            Text(
                              movie.rtScore,
                              style: GoogleFonts.lato(
                                color: AppColors.text2,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverGap(16),
          SliverToBoxAdapter(
            child: Divider(
              // ignore: deprecated_member_use
              color: AppColors.text2.withOpacity(0.5),
              thickness: 0.5,
            ),
          ),
          SliverGap(16),
          SliverPadding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 6,
                children: [
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          "Release Year",
                          style: GoogleFonts.lato(
                            color: AppColors.text1,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Text(
                          movie.releaseDate,
                          style: GoogleFonts.lato(
                            color: AppColors.text2,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          "Director",
                          style: GoogleFonts.lato(
                            color: AppColors.text1,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Text(
                          movie.director,
                          style: GoogleFonts.lato(
                            color: AppColors.text2,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(
                        flex: 3,
                        child: Text(
                          "Producer",
                          style: GoogleFonts.lato(
                            color: AppColors.text1,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 5,
                        child: Text(
                          movie.producer,
                          style: GoogleFonts.lato(
                            color: AppColors.text2,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SliverGap(16),
          SliverToBoxAdapter(
            child: Divider(
              // ignore: deprecated_member_use
              color: AppColors.text2.withOpacity(0.5),
              thickness: 0.5,
            ),
          ),
          SliverGap(16),
          SliverPadding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 6,
                children: [
                  Text(
                    "Description",
                    style: GoogleFonts.lato(
                      color: AppColors.text1,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    movie.description,
                    style: GoogleFonts.lato(
                      color: AppColors.text2,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverGap(16),
          SliverToBoxAdapter(
            child: Divider(
              // ignore: deprecated_member_use
              color: AppColors.text2.withOpacity(0.5),
              thickness: 0.5,
            ),
          ),
          SliverGap(16),
          SliverPadding(
            padding: EdgeInsetsGeometry.symmetric(horizontal: 24),
            sliver: SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                spacing: 12,
                children: [
                  Text(
                    "Related Movies",
                    style: GoogleFonts.lato(
                      color: AppColors.text1,
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Consumer<MoviesController>(
                    builder: (context, p, child) {
                      return SizedBox(
                        height: 300,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          separatorBuilder: (context, index) => Gap(16),
                          itemCount: p.mainMoviesList.length,
                          itemBuilder: (BuildContext context, int index) {
                            final MoviesModel moviesModel =
                                p.mainMoviesList[index];
                            return SizedBox(
                              width: 140,
                              child: MovieCard(movie: moviesModel),
                            );
                          },
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
