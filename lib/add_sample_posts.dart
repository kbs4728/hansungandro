import 'package:cloud_firestore/cloud_firestore.dart';

Future<void> addSampleSalePosts() async {
  try {
    CollectionReference salePosts = FirebaseFirestore.instance.collection('sale_posts');

    // Add sample sale posts
    await salePosts.add({
      'title': 'Sample Post 1',
      'content': 'This is a sample post.',
      'price': 20.0,
      'is_available': true,
      'seller': 'android@hansung.ac.kr',
    });

    await salePosts.add({
      'title': 'Sample Post 2',
      'content': 'Another sample post.',
      'price': 15.0,
      'is_available': true,
      'seller': 'android@hansung.ac.kr',
    });

    await salePosts.add({
      'title': 'Sample Post 3',
      'content': 'This is a sample post.',
      'price': 47.0,
      'is_available': true,
      'seller': 'android@hansung.ac.kr',
    });

    await salePosts.add({
      'title': 'Sample Post 4',
      'content': 'This is a sample post.',
      'price': 28.0,
      'is_available': true,
      'seller': 'android@hansung.ac.kr',
    });

    await salePosts.add({
      'title': 'Sample Post 5',
      'content': 'This is a sample post.',
      'price': 13.0,
      'is_available': true,
      'seller': 'android@hansung.ac.kr',
    });

    // Add more sample posts as needed
  } catch (e) {
    print("Failed to add sample sale posts: $e");
  }
}
