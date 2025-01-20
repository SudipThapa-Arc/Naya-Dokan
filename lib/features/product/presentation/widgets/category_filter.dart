// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/constants/themes.dart';
import '../../../../providers/product_provider.dart';

class CategoryFilter extends StatefulWidget {
  final List<String> categories;

  const CategoryFilter({super.key, required this.categories});

  @override
  State<CategoryFilter> createState() => _CategoryFilterState();
}

class _CategoryFilterState extends State<CategoryFilter> {
  final ScrollController _scrollController = ScrollController();

  void _scrollForward() {
    final currentPosition = _scrollController.position.pixels;
    _scrollController.animateTo(
      currentPosition + (3 * 100), // Approximate width of 3 items
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  void _scrollBackward() {
    final currentPosition = _scrollController.position.pixels;
    _scrollController.animateTo(
      currentPosition - (3 * 100), // Approximate width of 3 items
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final uniqueCategories = widget.categories.toSet().toList();

    return Container(
      height: 50,
      margin: const EdgeInsets.only(top: 8), // Fix overflow
      child: Stack(
        children: [
          ListView.builder(
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 56),
            itemCount: uniqueCategories.length,
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 4),
              child: FilterChip(
                label: Text(uniqueCategories[index]),
                onSelected: (selected) {
                  // Handle category selection
                },
                backgroundColor: Colors.white,
                selectedColor: AppTheme.primaryColor.withOpacity(0.1),
                side: BorderSide(color: Colors.grey[300]!),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
            ),
          ),
          Positioned(
            left: 8,
            top: 0,
            bottom: 0,
            child: Center(
              child: IconButton(
                onPressed: _scrollBackward,
                icon: const Icon(Icons.chevron_left),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 2,
                  shadowColor: Colors.black26,
                ),
              ),
            ),
          ),
          Positioned(
            right: 8,
            top: 0,
            bottom: 0,
            child: Center(
              child: IconButton(
                onPressed: _scrollForward,
                icon: const Icon(Icons.chevron_right),
                style: IconButton.styleFrom(
                  backgroundColor: Colors.white,
                  elevation: 2,
                  shadowColor: Colors.black26,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
