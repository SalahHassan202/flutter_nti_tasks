import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_streaming_app/core/theme/app_colors.dart';

class MovieLoadingCard extends StatelessWidget {
  const MovieLoadingCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        ClipRRect(
          borderRadius: BorderRadiusGeometry.circular(20),
          child: Container(
            color: Colors.grey,
            width: double.infinity,
            height: 200,
          ),
        ),
        Gap(8),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Flexible(
              child: Text(
                "Abdelwahab Mohamed",
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
                "(2002)",
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
    );
  }
}
