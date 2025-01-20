import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../core/constants/themes.dart';
import 'filter_options_sheet.dart';

class SearchFilterBar extends ConsumerWidget {
  const SearchFilterBar({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.fromLTRB(16, 60, 16, 0),
      child: Column(
        children: [
          Row(
            children: [
              Text(
                'Discover',
                style: GoogleFonts.spaceMono(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: AppTheme.textColor,
                ),
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.favorite_border),
                onPressed: () => context.push('/favorites'),
              ),
              IconButton(
                icon: const Icon(Icons.shopping_cart_outlined),
                onPressed: () => context.push('/cart'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          SearchBar(
            hintText: 'Search products...',
            leading: const Icon(Icons.search),
            trailing: [
              IconButton(
                icon: const Icon(Icons.filter_list),
                onPressed: () => _showFilterBottomSheet(context),
              ),
            ],
          ),
        ],
      ),
    );
  }

  void _showFilterBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) => const FilterOptionsSheet(),
    );
  }
}
