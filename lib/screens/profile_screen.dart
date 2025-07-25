import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
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
      appBar: AppBar(
        backgroundColor: const Color(0xFFFCFAF3),
        elevation: 0,
        leading: const SizedBox(),
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Icon(Icons.restaurant, color: Color(0xFF4B2E2B)),
            SizedBox(width: 8),
            Text('Local', style: TextStyle(
              color: Color(0xFF4B2E2B),
              fontWeight: FontWeight.bold,
              fontSize: 24,
            )),
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Color(0xFF4B2E2B)),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 32,
                    backgroundImage: NetworkImage('https://randomuser.me/api/portraits/men/3.jpg'),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '@efeayalp023502',
                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        ),
                        const SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            _StatColumn(label: 'Tag ins', value: '25'),
                            _StatColumn(label: 'Followers', value: '230'),
                            _StatColumn(label: 'Following', value: '102'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Row(
                children: [
                  Icon(Icons.emoji_events_outlined, size: 20, color: Colors.brown),
                  SizedBox(width: 8),
                  Text('Mayor of İzmir', style: TextStyle(fontSize: 16)),
                ],
              ),
            ),
            // Story highlights always visible
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8),
              child: SizedBox(
                height: 60,
                child: _buildCircleList(),
              ),
            ),
            // Tabs
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: Colors.brown.shade100),
                ),
                child: TabBar(
                  controller: _tabController,
                  indicator: BoxDecoration(
                    color: Colors.brown.shade100,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  labelColor: Colors.brown[900],
                  unselectedLabelColor: Colors.brown[300],
                  tabs: const [
                    Tab(text: 'My Comments'),
                    Tab(text: 'Favorites'),
                    Tab(text: 'Saved'),
                  ],
                ),
              ),
            ),
            // TabBarView for feeds
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  _buildUserFeed(),
                  _buildFavoritesFeed(),
                  _buildSavedFeed(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCircleList() {
    return ListView.separated(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: 5,
      separatorBuilder: (_, __) => const SizedBox(width: 16),
      itemBuilder: (context, index) => CircleAvatar(
        radius: 24,
        backgroundColor: Colors.brown.shade100,
      ),
    );
  }

  Widget _buildUserFeed() {
    // Mock user comments/posts
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8),
      children: [
        _buildPostCard(
          place: 'Biber Burger',
          image: NetworkImage('https://images.unsplash.com/photo-1550547660-d9450f859349'),
          description: 'Güzel bir hamburgerdi',
          likes: 6,
          comments: 6,
        ),
        const SizedBox(height: 16),
        _buildPostCard(
          place: 'Kumrucu Ömür',
          image: NetworkImage('https://images.unsplash.com/photo-1504674900247-0877df9cc836'),
          description: '',
          likes: 2,
          comments: 1,
        ),
      ],
    );
  }

  Widget _buildFavoritesFeed() {
    // Mock favorites feed
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8),
      children: [
        _buildPostCard(
          place: 'Cafe de Paris',
          image: NetworkImage('https://images.unsplash.com/photo-1464306076886-debca5e8a6b0'),
          description: 'Harika bir kahve!',
          likes: 10,
          comments: 3,
        ),
        const SizedBox(height: 16),
        _buildPostCard(
          place: 'Pizza Locale',
          image: NetworkImage('https://images.unsplash.com/photo-1519864600265-abb23847ef2c'),
          description: 'En iyi pizza burada.',
          likes: 8,
          comments: 2,
        ),
      ],
    );
  }

  Widget _buildSavedFeed() {
    // Mock saved feed
    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 8),
      children: [
        _buildPostCard(
          place: 'Mado',
          image: NetworkImage('https://images.unsplash.com/photo-1504674900247-0877df9cc836'),
          description: 'Tatlılar şahane.',
          likes: 5,
          comments: 1,
        ),
        const SizedBox(height: 16),
        _buildPostCard(
          place: 'Midyeci Ahmet',
          image: NetworkImage('https://images.unsplash.com/photo-1523987355523-c7b5b0723c6a'),
          description: 'Midyeler taze ve lezzetli.',
          likes: 7,
          comments: 2,
        ),
      ],
    );
  }

  Widget _buildPostCard({
    required String place,
    required ImageProvider image,
    required String description,
    required int likes,
    required int comments,
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
                const CircleAvatar(
                  backgroundImage: NetworkImage('https://randomuser.me/api/portraits/men/3.jpg'),
                  radius: 16,
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      style: const TextStyle(color: Colors.black),
                      children: [
                        const TextSpan(
                          text: 'efeayalp023502',
                          style: TextStyle(fontWeight: FontWeight.bold),
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
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _StatColumn extends StatelessWidget {
  final String label;
  final String value;
  const _StatColumn({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(value, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
        Text(label, style: const TextStyle(fontSize: 14)),
      ],
    );
  }
} 