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
      'All Products',
      'Electronics',
      'Clothing',
      'Beauty and Make up',
      'Decoration',
      'Kids Section',
      'Sports',
      'Hardware'
    ];

    final batch = _firestore.batch();

    for (final category in categories) {
      batch.set(
        _firestore.collection('categories').doc(),
        {'name': category},
      );
    }

    await batch.commit();
  }

  Future<void> _initializeProducts() async {
    final List<Map<String, dynamic>> products = [];

    // Electronics products
    final electronics = [
      {
        'name': 'Wireless Noise-Canceling Headphones',
        'description':
            'Premium audio experience with 30-hour battery life and adaptive sound control.',
        'price': 299.99,
        'colors': ['Black', 'Silver', 'Midnight Blue'],
        'features': [
          'Active Noise Cancellation',
          'Touch Controls',
          'Voice Assistant'
        ],
      },
      {
        'name': '4K Smart TV',
        'description': '65-inch OLED display with HDR and smart features.',
        'price': 1299.99,
        'colors': ['Black'],
        'features': ['4K Resolution', 'Smart TV Features', 'HDR Support'],
      },
      {
        'name': 'Wireless Noise-Canceling Headphones',
        'description':
            'Premium audio experience with 30-hour battery life and adaptive sound control.',
        'price': 299.99,
        'colors': ['Black', 'Silver', 'Midnight Blue'],
        'features': [
          'Active Noise Cancellation',
          'Touch Controls',
          'Voice Assistant'
        ],
      },
      {
        'name': 'Smartphone Pro Max',
        'description':
            'Latest flagship smartphone with 6.7" display and advanced camera system.',
        'price': 999.99,
        'colors': ['Graphite', 'Gold', 'Sierra Blue'],
        'features': ['5G Capable', 'Pro Camera System', 'All-Day Battery Life'],
      },
      {
        'name': 'Gaming Laptop',
        'description':
            'High-performance gaming laptop with RTX graphics and 165Hz display.',
        'price': 1799.99,
        'colors': ['Black', 'White'],
        'features': ['NVIDIA RTX Graphics', '165Hz Display', '32GB RAM'],
      },
      {
        'name': 'Wireless Earbuds',
        'description':
            'True wireless earbuds with active noise cancellation and spatial audio.',
        'price': 199.99,
        'colors': ['White', 'Black', 'Sage'],
        'features': [
          'Active Noise Cancellation',
          'Spatial Audio',
          'Water Resistant'
        ],
      },
      {
        'name': 'Smart Watch Series 7',
        'description':
            'Advanced health monitoring and fitness tracking smartwatch.',
        'price': 399.99,
        'colors': ['Silver', 'Space Gray', 'Gold'],
        'features': ['ECG Monitor', 'Always-On Display', 'Water Proof'],
      },
      {
        'name': 'Tablet Pro',
        'description': '12.9-inch tablet with M1 chip and mini-LED display.',
        'price': 1099.99,
        'colors': ['Space Gray', 'Silver'],
        'features': ['M1 Chip', 'Mini-LED Display', 'Apple Pencil Support'],
      },
      {
        'name': 'Wireless Gaming Mouse',
        'description': 'Ultra-lightweight gaming mouse with 25K DPI sensor.',
        'price': 149.99,
        'colors': ['Black', 'White', 'Pink'],
        'features': ['25K DPI Sensor', '70hr Battery Life', 'RGB Lighting'],
      },
      {
        'name': 'Mechanical Keyboard',
        'description': 'Premium mechanical keyboard with RGB backlighting.',
        'price': 179.99,
        'colors': ['Black', 'White'],
        'features': [
          'Hot-swappable Switches',
          'RGB Per-key Lighting',
          'Aluminum Frame'
        ],
      },
      {
        'name': 'Ultra-wide Monitor',
        'description':
            '34-inch curved ultra-wide monitor for immersive viewing.',
        'price': 699.99,
        'colors': ['Black'],
        'features': ['144Hz Refresh Rate', 'HDR Support', '1ms Response Time'],
      },
      {
        'name': 'Portable SSD',
        'description': '1TB portable SSD with USB-C connectivity.',
        'price': 159.99,
        'colors': ['Black', 'Blue'],
        'features': ['1TB Storage', 'USB-C Connection', 'Shock Resistant'],
      },
      {
        'name': 'Smart Home Hub',
        'description':
            'Central hub for controlling all your smart home devices.',
        'price': 129.99,
        'colors': ['White', 'Charcoal'],
        'features': [
          'Voice Control',
          'Smart Home Integration',
          'Multi-room Audio'
        ],
      },
      {
        'name': 'Wireless Charging Pad',
        'description':
            '15W fast wireless charging pad with multiple device support.',
        'price': 49.99,
        'colors': ['Black', 'White'],
        'features': [
          '15W Fast Charging',
          'Multi-device Support',
          'LED Indicator'
        ],
      },
      {
        'name': 'Bluetooth Speaker',
        'description': 'Portable waterproof speaker with 360° sound.',
        'price': 199.99,
        'colors': ['Black', 'Blue', 'Red'],
        'features': ['Waterproof', '24hr Battery Life', '360° Sound'],
      }
    ];

    // Beauty and Makeup products
    final beauty = [
      {
        'name': 'Professional Makeup Palette',
        'description': '35 highly pigmented eyeshadow colors.',
        'price': 49.99,
        'colors': ['Neutral', 'Warm', 'Cool'],
        'features': ['Cruelty-free', 'Long-lasting', 'Buildable Coverage'],
      },
      {
        'name': 'Skincare Set',
        'description': 'Complete 5-step skincare routine.',
        'price': 89.99,
        'features': ['Natural Ingredients', 'Suitable for All Skin Types'],
      },
      {
        'name': 'Luxury Lipstick Collection',
        'description': 'Set of 6 premium matte lipsticks.',
        'price': 79.99,
        'colors': ['Red', 'Pink', 'Nude', 'Plum', 'Coral', 'Berry'],
        'features': ['Long-lasting', 'Moisturizing', 'Paraben-free'],
      },
      {
        'name': 'Advanced Facial Serum',
        'description': 'Anti-aging serum with vitamin C and hyaluronic acid.',
        'price': 69.99,
        'features': ['Anti-aging', 'Brightening', 'Hydrating'],
      },
      {
        'name': 'Professional Hair Care Set',
        'description':
            'Complete hair care system with shampoo, conditioner, and treatments.',
        'price': 129.99,
        'features': ['Sulfate-free', 'Color Protection', 'Keratin Infused'],
      },
      {
        'name': 'Luxury Face Mask Collection',
        'description':
            'Set of 5 premium sheet masks for different skin concerns.',
        'price': 39.99,
        'features': ['Hydrating', 'Brightening', 'Pore Minimizing'],
      },
      {
        'name': 'Premium Makeup Brush Set',
        'description': '15 professional-grade makeup brushes with case.',
        'price': 89.99,
        'colors': ['Rose Gold', 'Black'],
        'features': ['Synthetic Bristles', 'Professional Quality', 'Vegan'],
      },
      {
        'name': 'Facial Cleansing Device',
        'description': 'Sonic cleansing brush with multiple speed settings.',
        'price': 149.99,
        'colors': ['Pink', 'White', 'Mint'],
        'features': ['Waterproof', 'Multiple Speeds', 'USB Rechargeable'],
      },
      {
        'name': 'Natural Perfume Set',
        'description': 'Collection of 4 botanical-based fragrances.',
        'price': 119.99,
        'features': ['All Natural', 'Long-lasting', 'Cruelty-free'],
      },
      {
        'name': 'Nail Care Kit',
        'description': 'Professional nail care and manicure set.',
        'price': 59.99,
        'features': ['Professional Tools', 'Travel Case', 'Stainless Steel'],
      },
      {
        'name': 'BB Cream with SPF',
        'description': 'Lightweight coverage with sun protection.',
        'price': 34.99,
        'colors': ['Light', 'Medium', 'Dark'],
        'features': ['SPF 30', 'Oil-free', 'Natural Finish'],
      },
      {
        'name': 'Eyelash Enhancement Kit',
        'description': 'Complete kit for eyelash growth and enhancement.',
        'price': 79.99,
        'features': ['Growth Serum', 'Mascara', 'Applicator'],
      },
      {
        'name': 'Facial Toning Device',
        'description': 'Microcurrent device for facial muscle toning.',
        'price': 199.99,
        'colors': ['Rose Gold'],
        'features': ['FDA Cleared', 'Rechargeable', '5 Intensity Levels'],
      },
      {
        'name': 'Hair Styling Tools Set',
        'description':
            '3-in-1 styling set with straightener, curler, and waver.',
        'price': 159.99,
        'colors': ['Black', 'Purple'],
        'features': ['Ceramic Plates', 'Digital Controls', 'Auto Shut-off'],
      },
      {
        'name': 'Organic Body Care Set',
        'description': 'Complete organic body care collection.',
        'price': 89.99,
        'features': [
          '100% Organic',
          'Essential Oils',
          'Eco-friendly Packaging'
        ],
      }
    ];

    // Kids Section products
    final kids = [
      {
        'name': 'Educational Building Blocks',
        'description': '100-piece set for ages 3-8.',
        'price': 34.99,
        'colors': ['Multicolor'],
        'features': ['Non-toxic', 'Educational', 'Durable'],
      },
      {
        'name': 'Kids Smart Watch',
        'description': 'GPS tracking and educational games.',
        'price': 79.99,
        'colors': ['Blue', 'Pink', 'Green'],
        'features': ['GPS Tracking', 'Educational Games', 'Water Resistant'],
      },
      {
        'name': 'Interactive Learning Tablet',
        'description': 'Kid-friendly tablet with educational apps and games.',
        'price': 129.99,
        'colors': ['Blue', 'Pink'],
        'features': [
          'Parental Controls',
          'Educational Content',
          'Drop-resistant'
        ],
      },
      {
        'name': 'Musical Play Mat',
        'description': 'Interactive floor mat with musical instruments.',
        'price': 44.99,
        'colors': ['Multicolor'],
        'features': ['8 Instruments', 'Machine Washable', 'Non-slip Base'],
      },
      {
        'name': 'Art Supply Kit',
        'description': 'Complete art set for young artists.',
        'price': 39.99,
        'colors': ['Rainbow'],
        'features': ['Non-toxic Colors', '100+ Pieces', 'Storage Case'],
      },
      {
        'name': 'Remote Control Robot',
        'description': 'Programmable robot for STEM learning.',
        'price': 69.99,
        'colors': ['White', 'Orange'],
        'features': ['Voice Control', 'Rechargeable', 'App Compatible'],
      },
      {
        'name': 'Kids Science Kit',
        'description': 'Hands-on experiments for young scientists.',
        'price': 49.99,
        'features': ['30+ Experiments', 'Safety Tested', 'Instruction Guide'],
      },
      {
        'name': 'Balance Bike',
        'description': 'Training bike for toddlers.',
        'price': 89.99,
        'colors': ['Red', 'Blue', 'Yellow'],
        'features': [
          'Adjustable Height',
          'Puncture-proof Tires',
          'Lightweight'
        ],
      },
      {
        'name': 'Story Time Projector',
        'description': 'Bedtime story projector with sound effects.',
        'price': 54.99,
        'colors': ['Purple', 'Blue'],
        'features': ['30 Stories', 'Timer Function', 'Night Light'],
      },
      {
        'name': 'Kids Digital Camera',
        'description': 'Durable camera designed for children.',
        'price': 45.99,
        'colors': ['Green', 'Pink', 'Blue'],
        'features': ['HD Photos', 'Games', 'Shockproof'],
      },
      {
        'name': 'Magnetic Building Set',
        'description': 'Magnetic construction toys for creative play.',
        'price': 64.99,
        'colors': ['Multicolor'],
        'features': ['64 Pieces', 'Storage Box', 'Guide Book'],
      },
      {
        'name': 'Play Kitchen Set',
        'description': 'Interactive kitchen with realistic features.',
        'price': 119.99,
        'colors': ['White', 'Pink'],
        'features': ['Light & Sound', 'Accessories Included', 'Easy Assembly'],
      },
      {
        'name': 'Kids Fitness Tracker',
        'description': 'Activity tracker designed for children.',
        'price': 39.99,
        'colors': ['Blue', 'Purple', 'Green'],
        'features': ['Step Counter', 'Sleep Monitor', 'Water Resistant'],
      },
      {
        'name': 'Drawing Tablet',
        'description': 'Digital drawing pad with LCD screen.',
        'price': 29.99,
        'colors': ['Blue', 'Pink', 'Green'],
        'features': ['Battery Powered', 'Stylus Included', 'Eye Protection'],
      },
      {
        'name': 'Musical Instruments Set',
        'description': 'Collection of kid-friendly instruments.',
        'price': 49.99,
        'colors': ['Multicolor'],
        'features': ['10 Instruments', 'Storage Bag', 'Learning Guide'],
      }
    ];

    // Sports products
    final sports = [
      {
        'name': 'Professional Basketball',
        'description':
            'Official size and weight basketball with superior grip.',
        'price': 29.99,
        'colors': ['Orange', 'Black'],
        'features': ['Official Size', 'Enhanced Grip', 'Durable Material'],
      },
      {
        'name': 'Yoga Mat Premium',
        'description':
            'Extra thick eco-friendly yoga mat with alignment lines.',
        'price': 49.99,
        'colors': ['Purple', 'Blue', 'Green'],
        'features': ['6mm Thickness', 'Non-slip Surface', 'Alignment Lines'],
      },
      {
        'name': 'Tennis Racket Pro',
        'description':
            'Professional grade tennis racket with carbon fiber frame.',
        'price': 199.99,
        'colors': ['Black/Red', 'Blue/White'],
        'features': [
          'Carbon Fiber Frame',
          'Vibration Dampening',
          'Premium Strings'
        ],
      },
      {
        'name': 'Smart Fitness Watch',
        'description': 'Advanced fitness tracker with heart rate and GPS.',
        'price': 149.99,
        'colors': ['Black', 'Silver', 'Rose Gold'],
        'features': ['Heart Rate Monitor', 'GPS Tracking', 'Water Resistant'],
      },
      {
        'name': 'Adjustable Dumbbell Set',
        'description':
            'Space-saving adjustable dumbbells from 5-52.5 lbs each.',
        'price': 299.99,
        'colors': ['Black/Chrome'],
        'features': ['Quick Adjustment', '5-52.5 lbs Range', 'Compact Design'],
      },
      {
        'name': 'Soccer Ball Elite',
        'description':
            'Professional match soccer ball with enhanced durability.',
        'price': 39.99,
        'colors': ['White/Black', 'Yellow/Blue'],
        'features': ['Match Quality', 'All-Weather', 'FIFA Approved'],
      },
      {
        'name': 'Cycling Helmet Pro',
        'description': 'Lightweight aerodynamic cycling helmet with LED light.',
        'price': 89.99,
        'colors': ['Black', 'White', 'Red'],
        'features': [
          'LED Safety Light',
          'Adjustable Fit',
          'Ventilation System'
        ],
      },
      {
        'name': 'Running Shoes Elite',
        'description': 'Professional running shoes with responsive cushioning.',
        'price': 159.99,
        'colors': ['Black/Red', 'Blue/White', 'Grey/Orange'],
        'features': [
          'Responsive Cushioning',
          'Breathable Mesh',
          'Anti-slip Sole'
        ],
      },
      {
        'name': 'Boxing Gloves Pro',
        'description': 'Professional boxing gloves with superior padding.',
        'price': 79.99,
        'colors': ['Red', 'Black', 'Blue'],
        'features': ['Premium Leather', 'Wrist Support', 'Multi-Layer Padding'],
      },
      {
        'name': 'Swimming Goggles Elite',
        'description':
            'Professional anti-fog swimming goggles with UV protection.',
        'price': 34.99,
        'colors': ['Black', 'Blue', 'Clear'],
        'features': ['Anti-fog Coating', 'UV Protection', 'Adjustable Strap'],
      },
      {
        'name': 'Resistance Bands Set',
        'description':
            'Complete set of resistance bands with different strengths.',
        'price': 29.99,
        'colors': ['Multicolor'],
        'features': ['5 Resistance Levels', 'Door Anchor', 'Carrying Case'],
      },
      {
        'name': 'Basketball Hoop System',
        'description':
            'Adjustable height basketball system with tempered glass backboard.',
        'price': 399.99,
        'colors': ['Black'],
        'features': ['Adjustable Height', 'Tempered Glass', 'Pro-style Rim'],
      },
      {
        'name': 'Golf Club Set',
        'description':
            'Complete set of golf clubs for beginners to intermediates.',
        'price': 499.99,
        'colors': ['Silver/Black'],
        'features': ['Complete Set', 'Graphite Shafts', 'Premium Bag Included'],
      },
      {
        'name': 'Volleyball Pro',
        'description': 'Official indoor volleyball with soft touch technology.',
        'price': 44.99,
        'colors': ['White/Blue/Yellow'],
        'features': ['Soft Touch', 'Official Size', 'Indoor Use'],
      },
      {
        'name': 'Exercise Bike',
        'description':
            'Stationary exercise bike with digital display and resistance levels.',
        'price': 299.99,
        'colors': ['Black/Grey'],
        'features': [
          'Digital Display',
          '16 Resistance Levels',
          'Heart Rate Monitor'
        ],
      }
    ];

    // Hardware products
    final hardware = [
      {
        'name': 'Power Drill Set',
        'description':
            '20V cordless drill with variable speed and accessories kit.',
        'price': 149.99,
        'colors': ['Yellow/Black'],
        'features': ['20V Motor', '2 Batteries', '50pc Accessory Kit'],
      },
      {
        'name': 'Professional Tool Box',
        'description':
            'Heavy-duty rolling tool box with multiple compartments.',
        'price': 199.99,
        'colors': ['Red/Black'],
        'features': ['Rolling Wheels', 'Multiple Drawers', 'Lock System'],
      },
      {
        'name': 'Circular Saw',
        'description': '7-1/4 inch circular saw with laser guide system.',
        'price': 129.99,
        'colors': ['Blue/Black'],
        'features': ['Laser Guide', '15 Amp Motor', 'Electric Brake'],
      },
      {
        'name': 'Air Compressor',
        'description': '6-gallon portable air compressor with quick recovery.',
        'price': 179.99,
        'colors': ['Red'],
        'features': ['Oil-Free Pump', '150 PSI', 'Quick Recovery'],
      },
      {
        'name': 'Welding Machine',
        'description': 'Multi-process welder for MIG, TIG, and Stick welding.',
        'price': 599.99,
        'colors': ['Blue/Black'],
        'features': ['Multi-Process', 'Digital Display', 'Thermal Protection'],
      },
      {
        'name': 'Router Tool',
        'description': 'Variable speed wood router with plunge base.',
        'price': 159.99,
        'colors': ['Teal/Black'],
        'features': ['Variable Speed', 'Plunge Base', 'Soft Start'],
      },
      {
        'name': 'Pressure Washer',
        'description': 'Electric pressure washer with multiple nozzle tips.',
        'price': 249.99,
        'colors': ['Yellow/Black'],
        'features': ['2000 PSI', 'Multiple Nozzles', 'Quick Connect'],
      },
      {
        'name': 'Generator',
        'description': 'Portable inverter generator with low noise operation.',
        'price': 699.99,
        'colors': ['Red/Black'],
        'features': ['3000W Output', 'Quiet Operation', 'Fuel Efficient'],
      },
      {
        'name': 'Chain Saw',
        'description':
            '16-inch gas-powered chainsaw with anti-vibration system.',
        'price': 299.99,
        'colors': ['Orange/Black'],
        'features': ['Anti-Vibration', 'Quick Start', 'Auto Chain Oiler'],
      },
      {
        'name': 'Level Set',
        'description': 'Professional 3-piece level set with magnetic strips.',
        'price': 79.99,
        'colors': ['Yellow/Black'],
        'features': ['Magnetic Strip', '3 Sizes', 'Shock Resistant'],
      },
      {
        'name': 'Shop Vacuum',
        'description': '12-gallon wet/dry vacuum with built-in blower.',
        'price': 149.99,
        'colors': ['Black/Yellow'],
        'features': ['Wet/Dry Use', 'Built-in Blower', 'Large Capacity'],
      },
      {
        'name': 'Hammer Drill',
        'description': 'SDS-Plus rotary hammer drill for concrete and masonry.',
        'price': 199.99,
        'colors': ['Blue/Black'],
        'features': ['SDS-Plus', '3 Modes', 'Anti-Vibration'],
      },
      {
        'name': 'Miter Saw',
        'description': '12-inch compound miter saw with laser guide.',
        'price': 349.99,
        'colors': ['Silver/Black'],
        'features': ['Laser Guide', 'Dust Collection', 'Extended Fence'],
      },
      {
        'name': 'Tool Set',
        'description':
            '215-piece mechanical tool set with ratchets and sockets.',
        'price': 199.99,
        'colors': ['Chrome'],
        'features': ['215 Pieces', 'Lifetime Warranty', 'Case Included'],
      },
      {
        'name': 'Work Light',
        'description': 'LED work light with adjustable stand and 10000 lumens.',
        'price': 89.99,
        'colors': ['Yellow/Black'],
        'features': ['10000 Lumens', 'Adjustable Stand', 'Weather Resistant'],
      }
    ];

    // Decoration products
    final decoration = [
      {
        'name': 'Modern Wall Art Set',
        'description': 'Set of 3 abstract canvas prints for modern home decor.',
        'price': 129.99,
        'colors': ['Multicolor'],
        'features': ['Gallery Wrapped', 'Ready to Hang', 'UV Resistant'],
      },
      {
        'name': 'Decorative Mirror',
        'description': 'Large round mirror with gold geometric frame.',
        'price': 199.99,
        'colors': ['Gold'],
        'features': ['36-inch Diameter', 'Wall Mounted', 'Beveled Edge'],
      },
      {
        'name': 'Table Lamp Set',
        'description':
            'Set of 2 modern ceramic table lamps with fabric shades.',
        'price': 149.99,
        'colors': ['White', 'Grey', 'Navy'],
        'features': ['Dimmable', 'USB Port', 'LED Compatible'],
      },
      {
        'name': 'Area Rug',
        'description': 'Soft geometric pattern area rug for living room.',
        'price': 249.99,
        'colors': ['Grey/White', 'Blue/Beige'],
        'features': ['Stain Resistant', 'Non-Shedding', 'Easy Clean'],
      },
      {
        'name': 'Throw Pillow Set',
        'description': 'Set of 4 decorative throw pillows with inserts.',
        'price': 79.99,
        'colors': ['Mixed Patterns'],
        'features': ['Removable Covers', 'Premium Fill', 'Machine Washable'],
      },
      {
        'name': 'Wall Clock',
        'description': 'Large decorative wall clock with silent movement.',
        'price': 89.99,
        'colors': ['Black', 'Gold', 'Silver'],
        'features': ['Silent Movement', 'Battery Operated', '24-inch Diameter'],
      },
      {
        'name': 'Floating Shelves',
        'description': 'Set of 3 wooden floating shelves with hidden brackets.',
        'price': 59.99,
        'colors': ['Natural', 'White', 'Espresso'],
        'features': ['Hidden Brackets', 'Easy Install', 'Strong Support'],
      },
      {
        'name': 'Artificial Plant',
        'description': 'Realistic artificial fiddle leaf fig tree with pot.',
        'price': 129.99,
        'colors': ['Green'],
        'features': ['6ft Tall', 'UV Resistant', 'Premium Pot'],
      },
      {
        'name': 'Candle Holders',
        'description': 'Set of 3 geometric metal candle holders.',
        'price': 49.99,
        'colors': ['Gold', 'Black', 'Silver'],
        'features': ['Various Heights', 'Stable Base', 'Modern Design'],
      },
      {
        'name': 'Wall Tapestry',
        'description': 'Large bohemian wall tapestry with intricate design.',
        'price': 39.99,
        'colors': ['Multicolor'],
        'features': ['100% Cotton', 'Machine Washable', 'Multiple Uses'],
      },
      {
        'name': 'Decorative Vase',
        'description': 'Ceramic floor vase with modern geometric design.',
        'price': 89.99,
        'colors': ['White/Gold', 'Black/Silver'],
        'features': ['24-inch Height', 'Waterproof', 'Stable Base'],
      },
      {
        'name': 'LED String Lights',
        'description': 'Copper wire LED string lights for indoor/outdoor use.',
        'price': 29.99,
        'colors': ['Warm White', 'Cool White'],
        'features': ['33ft Length', 'Remote Control', 'Water Resistant'],
      },
      {
        'name': 'Wall Shelf Unit',
        'description': 'Industrial style wall shelf with metal frame.',
        'price': 159.99,
        'colors': ['Brown/Black'],
        'features': ['5 Shelves', 'Easy Assembly', 'Heavy Duty'],
      },
      {
        'name': 'Macrame Wall Hanging',
        'description': 'Handmade cotton macrame wall art with wooden dowel.',
        'price': 69.99,
        'colors': ['Natural', 'White'],
        'features': ['Handcrafted', '100% Cotton', 'Unique Design'],
      },
      {
        'name': 'Photo Frames Set',
        'description': 'Set of 7 matching photo frames in various sizes.',
        'price': 79.99,
        'colors': ['Black', 'White', 'Gold'],
        'features': ['Gallery Wall Set', 'Glass Front', 'Wall Mounting Kit'],
      }
    ];

    // Clothing products
    final clothing = [
      {
        'name': 'Classic Denim Jacket',
        'description': 'Vintage style denim jacket with modern fit.',
        'price': 79.99,
        'colors': ['Blue', 'Black', 'Light Wash'],
        'features': ['100% Cotton', 'Button Closure', 'Multiple Pockets'],
        'sizes': ['S', 'M', 'L', 'XL'],
      },
      {
        'name': 'Casual T-Shirt Pack',
        'description': 'Set of 3 premium cotton crew neck t-shirts.',
        'price': 39.99,
        'colors': ['Mixed Colors'],
        'features': ['100% Cotton', 'Preshrunk', 'Tagless'],
        'sizes': ['S', 'M', 'L', 'XL', 'XXL'],
      },
      {
        'name': 'Slim Fit Chinos',
        'description': 'Comfortable stretch chinos for casual or formal wear.',
        'price': 59.99,
        'colors': ['Khaki', 'Navy', 'Olive'],
        'features': ['Stretch Fabric', 'Wrinkle Resistant', 'Hidden Pocket'],
        'sizes': ['30x30', '32x32', '34x34', '36x34'],
      },
      {
        'name': 'Wool Blend Sweater',
        'description': 'Soft wool blend sweater with ribbed details.',
        'price': 89.99,
        'colors': ['Grey', 'Navy', 'Burgundy'],
        'features': ['Wool Blend', 'Machine Washable', 'Ribbed Cuffs'],
        'sizes': ['S', 'M', 'L', 'XL'],
      },
      {
        'name': 'Athletic Shorts',
        'description': 'Quick-dry athletic shorts with built-in liner.',
        'price': 34.99,
        'colors': ['Black', 'Grey', 'Navy'],
        'features': ['Quick Dry', 'Built-in Liner', 'Zip Pocket'],
        'sizes': ['S', 'M', 'L', 'XL'],
      },
      {
        'name': 'Business Dress Shirt',
        'description': 'Non-iron dress shirt for professional wear.',
        'price': 69.99,
        'colors': ['White', 'Light Blue', 'Pink'],
        'features': ['Non-Iron', 'Wrinkle Free', 'Spread Collar'],
        'sizes': ['15/32', '16/33', '17/34', '18/35'],
      },
      {
        'name': 'Leather Belt',
        'description': 'Genuine leather belt with classic buckle.',
        'price': 39.99,
        'colors': ['Brown', 'Black'],
        'features': ['Genuine Leather', 'Classic Buckle', 'Dress Style'],
        'sizes': ['32', '34', '36', '38', '40'],
      },
      {
        'name': 'Hooded Sweatshirt',
        'description': 'Comfortable pullover hoodie with kangaroo pocket.',
        'price': 49.99,
        'colors': ['Grey', 'Black', 'Navy'],
        'features': ['Cotton Blend', 'Double-lined Hood', 'Ribbed Cuffs'],
        'sizes': ['S', 'M', 'L', 'XL', 'XXL'],
      },
      {
        'name': 'Swim Trunks',
        'description': 'Quick-dry swim trunks with mesh liner.',
        'price': 29.99,
        'colors': ['Blue', 'Red', 'Black'],
        'features': ['Quick Dry', 'UPF 50+', 'Mesh Liner'],
        'sizes': ['S', 'M', 'L', 'XL'],
      },
      {
        'name': 'Formal Suit',
        'description': 'Modern fit two-piece suit for formal occasions.',
        'price': 299.99,
        'colors': ['Navy', 'Charcoal', 'Black'],
        'features': ['Wool Blend', 'Modern Fit', 'Lined'],
        'sizes': ['38R', '40R', '42R', '44R'],
      },
      {
        'name': 'Winter Parka',
        'description': 'Insulated winter parka with faux fur hood.',
        'price': 199.99,
        'colors': ['Black', 'Olive', 'Navy'],
        'features': ['Waterproof', 'Insulated', 'Multiple Pockets'],
        'sizes': ['S', 'M', 'L', 'XL'],
      },
      {
        'name': 'Polo Shirt',
        'description': 'Classic fit polo shirt with moisture-wicking fabric.',
        'price': 44.99,
        'colors': ['White', 'Navy', 'Red'],
        'features': ['Moisture Wicking', 'UV Protection', 'No-Curl Collar'],
        'sizes': ['S', 'M', 'L', 'XL', 'XXL'],
      },
      {
        'name': 'Cargo Pants',
        'description': 'Durable cargo pants with multiple pockets.',
        'price': 69.99,
        'colors': ['Khaki', 'Olive', 'Black'],
        'features': ['Ripstop Fabric', 'Cargo Pockets', 'Reinforced Knees'],
        'sizes': ['30x30', '32x32', '34x34', '36x34'],
      },
      {
        'name': 'Rain Jacket',
        'description': 'Lightweight packable rain jacket with hood.',
        'price': 79.99,
        'colors': ['Yellow', 'Navy', 'Black'],
        'features': ['Waterproof', 'Packable', 'Ventilated'],
        'sizes': ['S', 'M', 'L', 'XL'],
      },
      {
        'name': 'Dress Socks Pack',
        'description': 'Set of 6 premium dress socks for formal wear.',
        'price': 24.99,
        'colors': ['Mixed Colors'],
        'features': ['Moisture Wicking', 'Reinforced Toe', 'Non-Slip'],
        'sizes': ['8-12', '13-15'],
      }
    ];

    // Process and add all products
    final allProducts = [
      ...electronics,
      ...beauty,
      ...kids,
      ...sports,
      ...hardware,
      ...decoration,
      ...clothing
    ];
    for (int i = 0; i < allProducts.length; i++) {
      products.add({
        'id': 'prod_${i + 1}',
        ...allProducts[i],
        'images': [
          'https://source.unsplash.com/random/400x400/?${allProducts[i]['name']}'
        ],
        'category': _getCategoryForProduct(i, allProducts.length),
        'stock': 50 + (i * 2),
        'rating': 4.0 + (i % 10) / 10,
        'reviewCount': 50 + (i * 3),
        'isFavorite': false,
      });
    }

    final batch = _firestore.batch();
    for (final product in products) {
      batch.set(
        _firestore.collection('products').doc(product['id'] as String),
        product,
      );
    }
    await batch.commit();
  }

  String _getCategoryForProduct(int index, int totalProducts) {
    final categoriesCount = {
      'Electronics': 15,
      'Beauty and Make up': 15,
      'Kids Section': 15,
      'Sports': 15,
      'Hardware': 15,
      'Decoration': 15,
      'Clothing': 15,
    };

    int currentIndex = 0;
    for (final entry in categoriesCount.entries) {
      currentIndex += entry.value;
      if (index < currentIndex) {
        return entry.key;
      }
    }
    return 'Other';
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
