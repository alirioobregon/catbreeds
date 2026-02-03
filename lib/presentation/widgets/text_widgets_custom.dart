import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleSubtitleData extends StatelessWidget {
  final String title;
  final String subtitle;
  final TextAlign textAlign;

  const TitleSubtitleData({
    super.key,
    required this.title,
    required this.subtitle,
    this.textAlign = TextAlign.start,
  });

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: textAlign,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      text: TextSpan(
        children: [
          TextSpan(
            text: title,
            style: GoogleFonts.montserrat(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          TextSpan(
            text: subtitle,
            style: GoogleFonts.montserrat(
              color: Theme.of(context).colorScheme.primary,
              fontWeight: FontWeight.normal,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
