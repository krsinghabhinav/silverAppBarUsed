import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class SilverAppBarExample extends StatelessWidget {
  final List<String> images = [
    "assets/images/image_45.png",
    "assets/images/image_46.png",
    "assets/images/image_44.png",
    "assets/images/image_57.png",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          // SliverAppBar with Carousel and Additional Text
          SliverAppBar(
            expandedHeight: 500,
            floating: false,
            pinned: false,
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  // Background carousel slider
                  CarouselSlider.builder(
                    itemCount: images.length,
                    itemBuilder: (context, index, realIndex) {
                      return Image.asset(
                        images[index],
                        fit: BoxFit.cover,
                      );
                    },
                    options: CarouselOptions(
                      autoPlay: true,
                      enlargeCenterPage: true,
                      viewportFraction: 1.0,
                      height: 500,
                    ),
                  ),
                  // Gradient overlay
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.black.withOpacity(0.7),
                          Colors.transparent,
                        ],
                        begin: Alignment.bottomCenter,
                        end: Alignment.topCenter,
                      ),
                    ),
                  ),
                  // Title, subtitle, and description text
                  Positioned(
                    bottom: 30,
                    left: 20,
                    right: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Featured Movie Title",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          "Action · Drama · 2025",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 16,
                          ),
                        ),
                        SizedBox(height: 16),
                        Text(
                          "This is a brief description of the featured movie. "
                          "Explore the world of drama and action in this thrilling tale "
                          "that keeps you on the edge of your seat.",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 14,
                          ),
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          // ListView.builder inside Sliver
          SliverList(
            delegate: SliverChildBuilderDelegate(
              childCount: 10, // Number of list items
              (BuildContext context, int index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: ListTile(
                    title: Text('List Item $index'),
                    subtitle: Text('Subtitle for item $index'),
                    leading: CircleAvatar(child: Text('$index')),
                  ),
                );
              },
            ),
          ),

          // GridView.builder inside Sliver
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, // Number of grid items per row
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              childAspectRatio: 0.75, // Aspect ratio of grid items
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  margin: EdgeInsets.all(8),
                  color: Colors.blueAccent,
                  child: Center(
                    child: Text(
                      'Grid Item $index',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                );
              },
              childCount: 20, // Number of grid items
            ),
          ),
        ],
      ),
    );
  }
}
