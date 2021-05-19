import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nappies_direct/views/login.dart';
import 'package:nappies_direct/views/profile.dart';
import 'package:nappies_direct/views/cart.dart';
import 'package:nappies_direct/views/wishlist.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'home.dart';
import 'login2.dart';

class DrawerApp extends StatefulWidget {
  @override
  _DrawerAppState createState() => _DrawerAppState();
}

class _DrawerAppState extends State<DrawerApp> {
  dynamic email = "";
  dynamic name = "";
  String token = "";
  bool _isDisplay = false;

  Future<dynamic> getEmailPreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    dynamic email = prefs.getString('email');
    dynamic name = prefs.getString('name');
    return updateEmail(email, name);
  }

  @override
  void initState() {
    getEmailPreference();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Drawer(
      child: Column(
        children: [
          Container(
            color: Colors.pink[50],
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  padding: const EdgeInsets.all(10),
                  height: size.height * 0.2,
                  width: size.width * 0.8,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      // color:Colors.red
                      image: DecorationImage(
                          image: AssetImage("assets/images/user.jpg"),
                          fit: BoxFit.cover)),
                ),
                FutureBuilder(
                  future: getEmailPreference(),
                  initialData: "First Login ...",
                  builder: (BuildContext context, text) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            name ?? 'User8',
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                FutureBuilder(
                  future: getEmailPreference(),
                  initialData: "First Login ...",
                  builder: (BuildContext context, text) {
                    return SingleChildScrollView(
                      child: Column(
                        children: [
                          Text(
                            email ?? 'User8@gmail.com',
                            style: TextStyle(
                              color: Colors.grey[700],
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: Colors.black,
                )
              ],
            ),
          ),
          _isDisplay
              ? ListTile(
                  leading: Icon(Icons.person),
                  title: Text('Profile'),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ProfilePage()));
                  },
                )
              : ListTile(
                  leading: Icon(Icons.login),
                  title: Text("Login"),
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => LoginApi()));
                  },
                ),
          ListTile(
            leading: Icon(Icons.shopping_cart),
            title: Text('My Cart'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Cart()));
            },
          ),
          ListTile(
            leading: Icon(Icons.list),
            title: Text('Wishlist'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Wishlist()));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text('Go to settings'),
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => HomePage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text("Logout"),
            onTap: () {
              _save('0');
            },
          )
        ],
      ),
    );
  }

  updateEmail(dynamic email, dynamic name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    if (token == '0') {
      setState(() {
        email = 'Login Again';
        this.name = ' Please Login';
        _isDisplay = false;
      });
      return getToken(token);
    } else {
      setState(() {
        this.email = email;
        this.name = name;
        _isDisplay = true;
      });
      // return null;
    }
  }

  getToken(String token) async {
    setState(() {
      this.token = token;
    });
  }

  _save(String token) async {
    final prefs = await SharedPreferences.getInstance();
    final key = 'token';
    final value = token;
    prefs.setString(key, value);
    print(value);
    Navigator.of(context).push(new MaterialPageRoute(
        builder: (BuildContext context) => new LoginApi()));
  }
}
