import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Navigation Bar',
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.blue,
        colorScheme: ColorScheme.fromSwatch().copyWith(
          secondary: Colors.amber,
          surface: Colors.white,
          onSurface: Colors.black,
          tertiary: Colors.grey[300],
          surfaceVariant: Colors.grey[200],
        ),
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int pageIndex = 0;
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: pageIndex == 0
            ? NeverScrollableScrollPhysics()
            : ClampingScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            pageIndex = index;
          });
        },
        children: [
          Center(child: Text("Map Page")),
          Center(child: Text("Create Page")),
          Center(child: Text("Explore Page")),
          Center(child: Text("Saved Page")),
          Center(child: Text("Shop Page")),
        ],
      ),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerTop,
      floatingActionButton: _buildTopBar(context),
      extendBody: true,
      bottomNavigationBar: _buildNavBar(context),
    );
  }

  // Builds the top bar with settings and account icons
  Stack _buildTopBar(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: 14,
          left: 10,
          child: IconButton(
            icon: Icon(Icons.settings,
                color: Theme.of(context).colorScheme.onSurface, size: 32),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage()));
            },
          ),
        ),
        Positioned(
          top: 11,
          right: 10,
          child: IconButton(
            icon: Icon(Icons.account_circle,
                color: Theme.of(context).colorScheme.onSurface, size: 32),
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => AccountPage()));
            },
          ),
        ),
      ],
    );
  }

  // Builds the bottom navigation bar
  Container _buildNavBar(BuildContext context) {
    Color iconColor = Theme.of(context).colorScheme.onSurfaceVariant;
    return Container(
      height: 60,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceVariant,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildNavItem(Icons.map, 0, iconColor),
          _buildNavItem(Icons.construction, 1, iconColor),
          _buildNavItem(Icons.language, 2, iconColor),
          _buildNavItem(Icons.bookmark, 3, iconColor),
          _buildNavItem(Icons.shopping_cart, 4, iconColor),
        ],
      ),
    );
  }

  // Builds individual navigation bar item
  IconButton _buildNavItem(IconData icon, int index, Color iconColor) {
    return IconButton(
      icon: Icon(
        icon,
        color: iconColor,
        size: pageIndex == index ? 35 : 27,
      ),
      onPressed: () {
        setState(() {
          pageController.animateToPage(
            index,
            duration: const Duration(milliseconds: 400),
            curve: Curves.easeInOut,
          );
        });
      },
    );
  }
}

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Center(child: Text('Settings Page')),
    );
  }
}

class AccountPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Account')),
      body: Center(child: Text('Account Page')),
    );
  }
}
