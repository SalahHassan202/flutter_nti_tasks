import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_streaming_app/core/data/models/movies_model.dart';
import 'package:movie_streaming_app/core/theme/app_colors.dart';
import 'package:movie_streaming_app/features/movie/movie_details_screen.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({super.key, required this.movie});
  final MoviesModel movie;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        MaterialPageRoute(builder: (c) => MovieDetailsScreen(movie: movie)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(20),
            child: CachedNetworkImage(
              imageUrl: movie.image,
              placeholder: (context, url) => Container(
                width: double.infinity,
                height: 150,
                color: AppColors.bg2,
              ),
            ),
          ),
          Gap(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Text(
                  movie.title,
                  style: GoogleFonts.lato(
                    fontSize: 16,
                    color: AppColors.text1,
                    fontWeight: FontWeight.w700,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Expanded(
                child: Text(
                  "(${movie.releaseDate})",
                  style: GoogleFonts.lato(
                    fontSize: 13,
                    // ignore: deprecated_member_use
                    color: AppColors.text1.withOpacity(0.7),
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
