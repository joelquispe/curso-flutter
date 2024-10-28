import 'package:flutter/material.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({super.key});

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  final pageController = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const BouncingScrollPhysics(),
        onPageChanged: (value) {
          debugPrint(value.toString());
        },
        children: const [
          HomeScreen(),
          ProfileScreen(),
          NotificationsScreen(),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // pageController.animateToPage(2, duration: const Duration(seconds: 5), curve: Curves.easeInOut);

          pageController.jumpToPage(2);
        },
        child: const Icon(Icons.arrow_forward),
      ),
    );
  } //
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Home Screen",
        style: TextStyle(
          fontSize: 26,
        ),
      ),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Profile Screen",
        style: TextStyle(
          fontSize: 26,
        ),
      ),
    );
  }
}

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        "Notifications Screen",
        style: TextStyle(
          fontSize: 26,
        ),
      ),
    );
  }
}
