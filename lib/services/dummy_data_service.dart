import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DummyDataService {
  final FirebaseFirestore _firestore;

  DummyDataService(this._firestore);

  Future<void> initializeDummyData() async {
    await _initializeCategories();
    await _initializeProducts();
    await _initializeReviews();
  }

  Future<void> _initializeCategories() async {
    final categories = [
      'Electronics',
      'Clothing',
      'Books',
      'Home & Garden',
      'Sports',
    ];

    final batch = _firestore.batch();

    for (final category in categories) {
      batch.set(
        _firestore.collection('categories').doc(category.toLowerCase()),
        {'name': category},
      );
    }

    await batch.commit();
  }

  Future<void> _initializeProducts() async {
    final products = [
      {
        'id': 'prod1',
        'name': 'Sony WH-1000XM4',
        'description':
            'Industry-leading noise canceling with Dual Noise Sensor technology. Next-level music with Edge-AI, co-developed with Sony Music Studios Tokyo. Up to 30-hour battery life with quick charging (10 min charge for 5 hours of playback).',
        'price': 349.99,
        'images': [
          'https://images.unsplash.com/photo-1618366712010-f4ae9c647dcb?w=500',
          'https://images.unsplash.com/photo-1572536147248-ac59a8abfa4b?w=500',
        ],
        'category': 'Electronics',
        'stock': 50,
        'rating': 4.8,
        'reviewCount': 1284,
      },
      {
        'id': 'prod2',
        'name': 'Premium Cotton Crew Neck',
        'description':
            'Ultra-soft Pima cotton t-shirt with a modern fit. Pre-shrunk fabric ensures lasting comfort and shape retention. Available in multiple colors.',
        'price': 29.99,
        'images': [
          'https://images.unsplash.com/photo-1521572163474-6864f9cf17ab?w=500',
          'https://images.unsplash.com/photo-1562157873-818bc0726f68?w=500',
        ],
        'category': 'Clothing',
        'stock': 100,
        'rating': 4.5,
        'reviewCount': 856,
      },
      {
        'id': 'prod3',
        'name': 'Smart Fitness Watch',
        'description':
            '24/7 heart rate monitoring, sleep tracking, and 20+ exercise modes. Water-resistant up to 50m. Compatible with iOS and Android.',
        'price': 199.99,
        'images': [
          'https://images.unsplash.com/photo-1579586337278-3befd40fd17a?w=500',
          'https://images.unsplash.com/photo-1508685096489-7aacd43bd3b1?w=500',
        ],
        'category': 'Electronics',
        'stock': 75,
        'rating': 4.6,
        'reviewCount': 923,
      },
    ];

    final batch = _firestore.batch();

    for (final product in products) {
      batch.set(
        _firestore.collection('products').doc(product['id'] as String),
        product,
      );
    }

    await batch.commit();
  }

  Future<void> _initializeReviews() async {
    final reviews = [
      <String, dynamic>{
        'id': 'rev1',
        'productId': 'prod1',
        'userId': 'user1',
        'userName': 'Sarah Johnson',
        'rating': 5,
        'comment':
            'Absolutely amazing sound quality! The noise cancellation is incredible.',
        'date': Timestamp.now(),
      },
      <String, dynamic>{
        'id': 'rev2',
        'productId': 'prod1',
        'userId': 'user2',
        'userName': 'Michael Chen',
        'rating': 4,
        'comment':
            'Great battery life and comfortable for long listening sessions.',
        'date': Timestamp.now(),
      },
      <String, dynamic>{
        'id': 'rev3',
        'productId': 'prod1',
        'userId': 'user3',
        'userName': 'Emma Wilson',
        'rating': 5,
        'comment':
            'Best headphones I\'ve ever owned! The sound quality is exceptional.',
        'date': Timestamp.now(),
      },
    ];

    final batch = _firestore.batch();

    for (final review in reviews) {
      batch.set(
        _firestore.collection('reviews').doc(review['id'] as String),
        review,
      );
    }

    await batch.commit();
  }
}

final dummyDataServiceProvider = Provider<DummyDataService>((ref) {
  return DummyDataService(FirebaseFirestore.instance);
});
