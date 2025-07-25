import 'package:flutter/material.dart';
import 'profile_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFCFAF3),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.only(left: 16, top: 16),
              child: Text(
                'Local',
                style: TextStyle(
                  fontSize: 56,
                  fontWeight: FontWeight.w400,
                  fontFamily: 'Serif',
                  color: Color(0xFF4B2E2B),
                ),
              ),
            ),
            TabBar(
              controller: _tabController,
              indicatorColor: Colors.transparent,
              labelColor: Colors.black,
              unselectedLabelColor: Colors.grey,
              labelStyle: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              tabs: const [
                Tab(text: 'Following'),
                Tab(text: 'For you'),
              ],
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildFeed(),
                  Center(child: Text('For You feed coming soon...')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFeed() {
    // Placeholder for the feed UI
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildPostCard(
          avatar: NetworkImage('https://randomuser.me/api/portraits/men/1.jpg'),
          username: 'Enis_eno',
          place: 'Spo Burger',
          image: NetworkImage('https://images.unsplash.com/photo-1550547660-d9450f859349'),
          description: 'Güzel bir hamburgerdi',
          likes: 6,
          comments: 6,
          rating: null,
        ),
        const SizedBox(height: 24),
        _buildPostCard(
          avatar: NetworkImage('https://randomuser.me/api/portraits/men/2.jpg'),
          username: 'Karşıyakalı İzzet',
          place: 'Söğüşçü Eno',
          image: NetworkImage('https://images.unsplash.com/photo-1504674900247-0877df9cc836'),
          description: '',
          likes: 6,
          comments: 6,
          rating: 4,
        ),
      ],
    );
  }

  Widget _buildPostCard({
    required ImageProvider avatar,
    required String username,
    required String place,
    required ImageProvider image,
    required String description,
    required int likes,
    required int comments,
    int? rating,
  }) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                CircleAvatar(backgroundImage: avatar, radius: 16),
                const SizedBox(width: 8),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: username,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        const TextSpan(text: ' in '),
                        TextSpan(
                          text: place,
                          style: const TextStyle(fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  ),
                ),
                const Icon(Icons.more_horiz),
              ],
            ),
            const SizedBox(height: 12),
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image(image: image, height: 160, width: double.infinity, fit: BoxFit.cover),
            ),
            if (description.isNotEmpty) ...[
              const SizedBox(height: 12),
              Text(description),
            ],
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.favorite_border, size: 20),
                const SizedBox(width: 4),
                Text(likes.toString()),
                const SizedBox(width: 16),
                const Icon(Icons.mode_comment_outlined, size: 20),
                const SizedBox(width: 4),
                Text(comments.toString()),
                if (rating != null) ...[
                  const SizedBox(width: 16),
                  Row(
                    children: List.generate(5, (i) => Icon(
                      i < rating ? Icons.star : Icons.star_border,
                      color: Colors.amber,
                      size: 20,
                    )),
                  ),
                ],
              ],
            ),
          ],
        ),
      ),
    );
  }
} 