import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            // Top section with profile picture and name
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [Colors.green.shade300, Colors.green.shade600],
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                    left: 20.0, right: 20.0, top: 30.0, bottom: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      radius: 80.0,
                      backgroundColor: Colors.black38,
                      backgroundImage: AssetImage(
                        'assets/images/pic.jpeg',
                      ),
                    ),
                    SizedBox(height: 10.0),
                    Text(
                      'Parbat',
                      style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            // List of options
            Expanded(
              child: ListView(
                children: <Widget>[
                  ListTile(
                    leading: Icon(Icons.settings),
                    title: Text('Settings'),
                    onTap: () {
                      // Handle settings option
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.assignment),
                    title: Text('Orders'),
                    onTap: () {
                      // Handle orders option
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.star),
                    title: Text('Rate us'),
                    onTap: () {
                      // Handle rate us option
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.share),
                    title: Text('Share with friends'),
                    onTap: () {
                      // Handle share with friends option
                    },
                  ),
                  ListTile(
                    leading: Icon(Icons.exit_to_app),
                    title: Text('Logout'),
                    onTap: () {
                      // Handle logout option
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
