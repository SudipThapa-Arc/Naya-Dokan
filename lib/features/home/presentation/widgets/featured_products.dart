import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../product/data/models/product_model.dart';
import '../../../../core/constants/themes.dart';
import 'product_card.dart';

class FeaturedProducts extends ConsumerWidget {
  const FeaturedProducts({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 24, 16, 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Featured Products',
                style: GoogleFonts.inter(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: AppTheme.textColor,
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'View All',
                  style: GoogleFonts.inter(
                    color: AppTheme.primaryColor,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 280,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: 5,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(right: 16),
              child: SizedBox(
                width: 200,
                child: ProductCard(
                  product: ProductModel(
                    id: 'featured-$index',
                    name: 'Premium Product $index',
                    description: 'High-quality featured product',
                    price: 149.99,
                    images: const ['https://picsum.photos/400'],
                    category: 'Featured',
                    stock: 10,
                    rating: 4.8,
                    reviewCount: 250,
                    discount: 15,
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
