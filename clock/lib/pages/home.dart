import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map data = {};

  @override
  Widget build(BuildContext context) {
    data = data.isNotEmpty ? data : ModalRoute.of(context).settings.arguments;
    print(data);
    return Scaffold(
      backgroundColor: Colors.grey[900],
      drawerScrimColor: Colors.grey[800],
      drawer: Drawer(
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  UserAccountsDrawerHeader(
                    decoration: BoxDecoration(color: Colors.grey[850]),
                    accountName: Text(
                      "Maharshi",
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 2,
                      ),
                    ),
                    accountEmail: Text(
                      "20bcs004@nith.ac.in",
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                        letterSpacing: 2,
                        color: Colors.amber,
                      ),
                    ),
                    margin: EdgeInsets.all(0),
                  ),
                  Divider(
                    thickness: 4,
                    color: Colors.amber,
                    height: 0,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    tileColor: Colors.grey[900],
                    leading: CircleAvatar(
                      radius: 20,
                      child: Align(
                        alignment: Alignment.center,
                        child: Icon(
                          Icons.edit_location,
                          color: Colors.grey[850],
                          size: 40,
                        ),
                      ),
                      backgroundColor: Colors.amber,
                    ),
                    title: Text(
                      'Edit Location',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.amber,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    // dense: true,
                    onTap: () {
                      Navigator.pushNamed(context, 'location');
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
      appBar: AppBar(
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        elevation: 0,
        backgroundColor: Colors.grey[850],
        title: Text(
          'Home',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
            letterSpacing: 2,
            color: Colors.amber[400],
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            CircleAvatar(
              radius: 86,
              backgroundColor: Colors.amber,
              child: CircleAvatar(
                radius: 84,
                backgroundColor: Colors.grey[900],
                child: CircleAvatar(
                  radius: 80,
                  backgroundImage: AssetImage("assets/${data["flag"]}"),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Location:",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  data['location'],
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Time:",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Text(
                  data['time'],
                  style: TextStyle(
                    color: Colors.amber,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.all(12),
                primary: Colors.amber,
              ),
              onPressed: () async {
                dynamic result = await Navigator.pushNamed(context, 'location');
                setState(
                  () {
                    data = {
                      "time": result["time"],
                      "location": result["location"],
                      "flag": result["flag"],
                    };
                  },
                );
              },
              icon: Icon(
                Icons.edit_location,
                color: Colors.grey[850],
                size: 40,
              ),
              label: Text(
                "Edit Location",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.grey[850],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
