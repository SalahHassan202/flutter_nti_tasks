import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_streaming_app/core/data/controllers/movies_controller.dart';
import 'package:movie_streaming_app/core/data/enums/request_status_enum.dart';
import 'package:movie_streaming_app/core/data/models/movies_model.dart';
import 'package:movie_streaming_app/core/theme/app_colors.dart';
import 'package:movie_streaming_app/features/home/components/movie_card.dart';
import 'package:movie_streaming_app/features/home/components/movie_loading_card.dart';
import 'package:provider/provider.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MoviesSection extends StatelessWidget {
  const MoviesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<MoviesController>(
      builder: (context, p, child) {
        switch (p.requestStatus) {
          case RequestStatusEnum.loading:
            return SliverSkeletonizer(
              effect: ShimmerEffect(
                baseColor: Colors.grey.shade500,
                highlightColor: Colors.white,
              ),
              child: SliverMasonryGrid.count(
                crossAxisCount: 2,
                mainAxisSpacing: 24,
                crossAxisSpacing: 16,
                childCount: 6,
                itemBuilder: (context, index) {
                  return MovieLoadingCard();
                },
              ),
            );
          case RequestStatusEnum.loaded:
            return SliverMasonryGrid.count(
              crossAxisCount: 2,
              mainAxisSpacing: 24,
              crossAxisSpacing: 16,
              childCount: p.filteredMoviesList.length,
              itemBuilder: (context, index) {
                final MoviesModel movie = p.filteredMoviesList[index];
                return MovieCard(movie: movie);
              },
            );
          case RequestStatusEnum.error:
            return SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: Text(
                  "Failed To Load Movies",
                  style: GoogleFonts.lato(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    color: AppColors.text1,
                  ),
                ),
              ),
            );
        }
      },
    );
  }
}
