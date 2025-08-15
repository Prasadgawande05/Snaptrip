import 'package:flutter/material.dart';
import 'package:latlong2/latlong.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:snaptrip/mumbai.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;

  final List<Widget> _screens = [
    Center(child: Text("", style: TextStyle(fontSize: 24))),
    Center(child: Text("Calendar", style: TextStyle(fontSize: 24))),
    Center(child: Text("Search Screen", style: TextStyle(fontSize: 24))),
    Center(child: Text("Messages", style: TextStyle(fontSize: 24))),
    Center(child: Text("Profile Screen", style: TextStyle(fontSize: 24))),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Row(
          children: [
            Image.asset(
              "assets/images/Snaptrip.png",
              height: 40,
            ),
            SizedBox(width: 8),
            Text(
              "SnapTrip",
              style:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),

      // ✅ Only BODY is updated
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text("Explore Amazing ", style: TextStyle(fontSize: 20)),
                Text("Destinations !",
                    style: TextStyle(
                        color: Colors.orange,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
              ],
            ),

            SizedBox(height: 20),

            // Cities Row
            Text("Where would you like to visit?",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MumbaiDetailsScreen()),
                      );
                    },
                    child: cityAvatar("Mumbai", "assets/images/mumbai.jpg"),
                  ),
                  cityAvatar("Hydrabad", "assets/images/hydrabad.jpg"),
                  cityAvatar("Jaipur", "assets/images/jaipur.jpg"),
                  cityAvatar("Delhi", "assets/images/delhi.jpg"),
                  cityAvatar("Ladakh", "assets/images/ladakh.jpg"),
                  cityAvatar("Kashmir", "assets/images/kashmir.jpg"),
                  cityAvatar("Goa", "assets/images/goa.jpg"),
                  cityAvatar("Pune", "assets/images/pune.jpg"),
                ],
              ),
            ),

            SizedBox(height: 20),

            // Popular Destinations
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Popular Destinations",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Text("See all",
                    style: TextStyle(color: Colors.blue, fontSize: 18)),
              ],
            ),
            SizedBox(height: 10),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  destinationCard(
                    "The Nautilus mumbai",
                    "The Nautilus mumbai, highway street",
                    "assets/images/mumbai.jpg",
                  ),
                  SizedBox(width: 10),
                  destinationCard(
                    "The night city",
                    "pune, india",
                    "assets/images/pune.jpg",
                  ),
                  SizedBox(width: 10),
                  destinationCard(
                    "Charminar",
                    "Hydrabad, india",
                    "assets/images/hydrabad.jpg",
                  ),
                  SizedBox(width: 10),
                  destinationCard(
                    "Jal Mahal",
                    "Jaipur, india",
                    "assets/images/jaipur.jpg",
                  ),
                  SizedBox(width: 10),
                  destinationCard(
                    "Safdarjung Tomb",
                    "Delhi, india",
                    "assets/images/delhi.jpg",
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),

            // Choose Category
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Choose Category",
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
                Text("See all",
                    style: TextStyle(color: Colors.blue, fontSize: 18)),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                categoryButton("Beach", Icons.beach_access),
                SizedBox(width: 10),
                categoryButton("Mountain", Icons.terrain),
              ],
            ),
            SizedBox(height: 10),
            Row(
              children: [
                categoryButton("Forests", Icons.forest),
                SizedBox(width: 10),
                categoryButton("forts", Icons.castle),
              ],
            ),
            SizedBox(height: 20),
            Text(
              "Set Your Destination And Explore The Erth",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
            ),

            SizedBox(height: 10),
            SizedBox(
              height: 300,
              child: FlutterMap(
                options: MapOptions(
                  initialCenter: LatLng(20.5937, 78.9629), // Center of India
                  initialZoom: 4.5,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.app',
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        point: LatLng(19.0760, 72.8777), // Mumbai
                        width: 40,
                        height: 40,
                        child: const Icon(Icons.location_on,
                            color: Colors.red, size: 30),
                      ),
                      Marker(
                        point: LatLng(28.6139, 77.2090), // Delhi
                        width: 40,
                        height: 40,
                        child: const Icon(Icons.location_on,
                            color: Colors.blue, size: 30),
                      ),
                      Marker(
                        point: LatLng(15.2993, 74.1240), // Goa
                        width: 40,
                        height: 40,
                        child: const Icon(Icons.location_on,
                            color: Colors.green, size: 30),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: navIcon(Icons.home, 0),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: navIcon(Icons.calendar_month, 1),
            label: "Calendar",
          ),
          BottomNavigationBarItem(
            icon: navIcon(Icons.search, 2),
            label: "Search",
          ),
          BottomNavigationBarItem(
            icon: navIcon(Icons.message, 3),
            label: "Messages",
          ),
          BottomNavigationBarItem(
            icon: navIcon(Icons.person, 4),
            label: "Profile",
          ),
        ],
      ),
    );
  }

  // Custom Widgets
  Widget cityAvatar(String name, String imagePath) {
    return Padding(
      padding: EdgeInsets.only(right: 10),
      child: Column(
        children: [
          CircleAvatar(radius: 30, backgroundImage: AssetImage(imagePath)),
          SizedBox(height: 5),
          Text(name),
        ],
      ),
    );
  }

  Widget destinationCard(String title, String location, String imagePath) {
    return Container(
      width: 200,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        image: DecorationImage(
          image: AssetImage(imagePath),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 8,
            left: 8,
            child: Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(0.6),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: TextStyle(color: Colors.white, fontSize: 14)),
                  Text(location,
                      style: TextStyle(color: Colors.white, fontSize: 12)),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget categoryButton(String text, IconData icon) {
    return Expanded(
      child: OutlinedButton.icon(
        onPressed: () {},
        icon: Icon(icon, color: Colors.blue),
        label: Text(text, style: TextStyle(color: Colors.black)),
        style: OutlinedButton.styleFrom(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
        ),
      ),
    );
  }

  Widget navIcon(IconData icon, int index) {
    return Container(
      decoration: BoxDecoration(
        color: _selectedIndex == index ? Colors.black : Colors.transparent,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.all(8),
      child: Icon(icon),
    );
  }
}
