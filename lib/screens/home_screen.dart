import 'package:audio_app/screens/more_screen.dart';
import 'package:audio_app/widgets/home_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/audio_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isInit = true;
  bool _isLoading = false;
  final List<Widget> _pages = [
    HomeWidget(),
    MoreScreen(),
  ];

  int _selectedPageIndex = 0;
  void _selectedPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void didChangeDependencies() {
    if (_isInit) {
      setState(() {
        _isLoading = true;
      });
      Provider.of<AudioProvider>(context).fetchAudio().then((_) {
        setState(() {
          _isLoading = false;
        });
      });
    }
    _isInit = false;

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.background,
        appBar: AppBar(
          title: Text(
            'Audio App',
            style: TextStyle(color: Colors.black),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        body: _isLoading
            ? Center(child: CircularProgressIndicator())
            : _pages[_selectedPageIndex],
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Color.fromARGB(255, 91, 42, 174),
          unselectedItemColor: Color.fromARGB(255, 134, 133, 133),
          currentIndex: _selectedPageIndex,
          onTap: _selectedPage,
          backgroundColor: Theme.of(context).colorScheme.primary,
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: 'home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.more),
              label: 'more',
            ),
          ],
        ),
      ),
    );
  }
}
