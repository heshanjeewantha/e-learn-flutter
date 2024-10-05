import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _searchController = TextEditingController();
  List<String> recentSearches = ['Math', 'Physics', 'AI'];
  List<String> categories = ['All', 'Courses', 'Articles', 'Videos', 'Quizzes'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Search Bar
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Search courses, topics, etc.',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    _searchController.clear();
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(),
                ),
                filled: true,
                fillColor: Colors.grey[200],
              ),
            ),
            const SizedBox(height: 20),

            // Categories
            SizedBox(
              height: 40,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Chip(
                      label: Text(
                        categories[index],
                        style: const TextStyle(color: Colors.white),
                      ),
                      backgroundColor: Colors.blueAccent,
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: 20),

            // Recent Searches
            Text(
              'Recent Searches',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent[700],
              ),
            ),
            const SizedBox(height: 10),
            Wrap(
              spacing: 10.0,
              children: recentSearches.map((search) {
                return Chip(
                  label: Text(search),
                  backgroundColor: Colors.grey[300],
                );
              }).toList(),
            ),
            const SizedBox(height: 20),

            // Popular Courses (Dummy Data)
            Text(
              'Popular Courses',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: Colors.blueAccent[700],
              ),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView(
                children: [
                  _buildCourseCard(
                    'Advanced AI Techniques',
                    'Learn about cutting-edge AI technologies...',
                    'assets/images/ui_ux_design.png',
                  ),
                  _buildCourseCard(
                    'Mastering Mathematics',
                    'Step-by-step guide to ace math exams.',
                    'assets/images/development.png',
                  ),
                  _buildCourseCard(
                    'Physics for Engineers',
                    'Physics essentials for engineering students.',
                    'assets/images/coding.png',
                  ),
                  _buildCourseCard(
                    'ui & ux',
                    'ui & ux essentials for student',
                    'assets/images/ui_ux_design.png',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCourseCard(String title, String description, String imagePath) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      child: ListTile(
        contentPadding: const EdgeInsets.all(10.0),
        leading: Image.asset(imagePath, fit: BoxFit.cover, width: 60),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Text(description),
        trailing: const Icon(Icons.arrow_forward_ios),
      ),
    );
  }
}
