import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../product/data/models/product_model.dart';
import 'product_card.dart';

class RecentlyViewedSection extends ConsumerWidget {
  const RecentlyViewedSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Recently Viewed',
          style: GoogleFonts.spaceMono(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 200,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => SizedBox(
              width: 160,
              child: ProductCard(
                product: ProductModel(
                  id: 'recent-$index',
                  name: 'Recent Product $index',
                  description: 'Description',
                  price: 49.99,
                  images: const ['https://picsum.photos/200'],
                  category: 'Recent',
                  stock: 10,
                  rating: 4.0,
                  reviewCount: 50,
                ),
              ),
            ),
            itemCount: 5,
          ),
        ),
      ],
    );
  }
}
