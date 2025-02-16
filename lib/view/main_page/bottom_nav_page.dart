import '../../core.dart';

class BottomNavScreen extends StatefulWidget {
  const BottomNavScreen({super.key});

  @override
  BottomNavScreenState createState() => BottomNavScreenState();
}

class BottomNavScreenState extends State<BottomNavScreen> {
  final List<Widget> _pages = [
    HomeScreen(),
    TopUpScreen(),
    HistoryScreen(),
    ProfileScreen()
  ];

  @override
  Widget build(BuildContext context) {
    final bottomNavProvider = Provider.of<BottomNavProvider>(context);

    return Scaffold(
      body: _pages[bottomNavProvider.currentIndex],
      bottomNavigationBar: Container(
        height: 60,
        width: Get.width,
        child: BottomNavigationBar(
          selectedItemColor: Colors.black87,
          unselectedItemColor: Colors.black54,
          showUnselectedLabels: true,
          currentIndex: bottomNavProvider.currentIndex,
          onTap: (index) => bottomNavProvider.setIndex(index),
          items: [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
            BottomNavigationBarItem(
                icon: Icon(Icons.view_comfortable_outlined), label: "Top Up"),
            BottomNavigationBarItem(
                icon: Icon(Icons.credit_card), label: "Transactions"),
            BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
          ],
        ),
      ),
    );
  }
}
