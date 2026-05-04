import 'package:computer_app_provider/app/modules/view/home_screen.dart';
import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff0f2027), Color(0xff203a43), Color(0xff2c5364)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 20),
                // 🔙 Back Button + Menu
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => HomeScreen(),
                            ),
                          );
                        },
                        child: Icon(Icons.arrow_back, color: Colors.white),
                      ),
                      Icon(Icons.more_vert, color: Colors.white),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                // 👤 Profile Image
                CircleAvatar(
                  radius: 55,
                  backgroundImage: NetworkImage(
                    "https://i.pinimg.com/736x/1b/7b/e2/1b7be209fee3fd17943a981b5508384e.jpg",
                  ),
                ),
                SizedBox(height: 15),
                // 🧑 Name
                Text(
                  "Flutter",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 5),
                // 💼 Role
                Text(
                  "Flutter Developer",
                  style: TextStyle(color: Colors.white70, fontSize: 16),
                ),
                SizedBox(height: 20),
                // 📊 Stats
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildStat("12", "Projects"),
                    _buildStat("1.2K", "Followers"),
                    _buildStat("35", "Repositories"),
                  ],
                ),
                SizedBox(height: 25),
                // 📦 Card Section
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.08),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // 📝 About
                      Text(
                        "About",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        "Passionate Flutter developer with experience building modern mobile applications, REST APIs, and clean UI design.",
                        style: TextStyle(color: Colors.white70),
                      ),
                      SizedBox(height: 20),
                      // 🛠 Skills
                      Text(
                        "Skills",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 10,
                        runSpacing: 10,
                        children: [
                          _skillChip("Flutter"),
                          _skillChip("Dart"),
                          _skillChip("GetX"),
                          _skillChip("Riverpod"),
                          _skillChip("REST API"),
                          _skillChip("Git"),
                        ],
                      ),
                      SizedBox(height: 20),
                      // 🔗 Social Buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          _socialButton(Icons.code, "GitHub"),
                          _socialButton(Icons.business, "LinkedIn"),
                          _socialButton(Icons.message, "Telegram"),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 30),
              ],
            ),
          ),
        ),
      ),
    );
  }
  // 📊 Stat Widget
  static Widget _buildStat(String number, String label) {
    return Column(
      children: [
        Text(
          number,
          style: TextStyle(
            color: Colors.white,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 5),
        Text(label, style: TextStyle(color: Colors.white70)),
      ],
    );
  }
  // 🛠 Skill Chip
  static Widget _skillChip(String text) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.blueAccent.withOpacity(0.2),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text, style: TextStyle(color: Colors.white)),
    );
  }
  // 🔗 Social Button
  static Widget _socialButton(IconData icon, String label) {
    return Column(
      children: [
        CircleAvatar(
          backgroundColor: Colors.white.withOpacity(0.1),
          child: Icon(icon, color: Colors.white),
        ),
        SizedBox(height: 5),
        Text(label, style: TextStyle(color: Colors.white70)),
      ],
    );
  }
}
