import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../models/image_model.dart';

class ImageCard extends StatelessWidget {
  final ImageModel image;
  const ImageCard({super.key, required this.image});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double aspectRatio = image.width == 0 || image.height == 0
        ? 16 / 9
        : image.width / image.height;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: SizedBox(
              width: screenWidth,
              child: AspectRatio(
                aspectRatio: aspectRatio,
                child: Image.network(
                  image.downloadUrl,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) return child;
                    return Container(
                      color: Colors.grey.shade200,
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(strokeWidth: 2),
                    );
                  },
                  errorBuilder: (context, error, stackTrace) => Container(
                    color: Colors.grey.shade200,
                    alignment: Alignment.center,
                    child: const Icon(Icons.broken_image, size: 32, color: Colors.grey),
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            image.author,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w600,
              fontSize: 16,
              color: Colors.black87,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            image.url,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: GoogleFonts.montserrat(
              fontWeight: FontWeight.w400,
              fontSize: 12,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
    );
  }
}

