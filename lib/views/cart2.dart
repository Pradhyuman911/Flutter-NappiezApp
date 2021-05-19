import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:http/http.dart' as http;
import 'package:nappies_direct/views/signup.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'drawer.dart';
import 'login2.dart';

class Cart extends StatefulWidget {
  final String productname;

  const Cart({Key key, this.productname}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  String carttotal = '';
  String token = '';
  bool _isLogged = false;
  Map mapResponse;
  // Future<List<CartItemPro>> futureData;

  checkStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    if (token == '0') {
      setState(() {
        _isLogged = true;
      });
      print('cart -->' + token);
      return getToken(token);
    } else {
      setState(() {
        _isLogged = false;
      });
      // return null;
    }
  }

  Future cartTotal() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    var data = null;
    http.Response response;
    response = await http.get('http://firstchoice.net.in/api/user/cartshow',
        headers: {
          'Accept': 'application/json',
          'Authorization': "Bearer $token"
        });
    data = jsonDecode(response.body);
    if (response.statusCode == 200) {
      print("if " + token);
      String carttotal = data['TotalProduct'].toString();
      prefs.getString(carttotal);
      print("Total Product in cart : " + data['TotalProduct'].toString());
      print(response.body);
      setState(() {
        _isLogged = false;
        mapResponse = data;
        // return data['cartitems'];
      });
      return updateTotal(carttotal);
    } else {
      print('else ' + token);
      print(response.statusCode);
      // return null;
    }
  }

  Future deleteItem(id) async {
    var data = null;
    http.Response response;
    response = await http.delete(
        'https://firstchoice.net.in/api/user/cartitem/${id}',
        headers: {'Accept': 'application/json', 'Authorization': "Bearer "});
    data = json.decode(response.body);
    print(data);
  }

  @override
  void initState() {
    _isLogged = true;
    cartTotal();
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        drawer: DrawerApp(),
        appBar: AppBar(
          leading: IconButton(
              icon: Icon(
                Icons.sort,
                color: Colors.purple[900],
                size: 30,
              ),
              onPressed: () => _scaffoldKey.currentState.openDrawer()),
          iconTheme: IconThemeData(
            color: Colors.purple[900],
          ),
          backgroundColor: Colors.pink[50],
          title: Text('My Cart',
              style: TextStyle(color: Colors.purple[900], fontSize: 22)),
          actions: [
            IconButton(
              icon: Icon(
                Icons.search,
                size: 30,
                color: Colors.purple[900],
              ),
              onPressed: null,
            ),
            Stack(
              alignment: Alignment.topCenter,
              children: [
                _isLogged
                    ? Center(child: CircularProgressIndicator())
                    : Text(
                        mapResponse['TotalProduct'].toString(),
                        style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 22,
                        ),
                      )
              ],
            )
          ],
        ),
        body: _isLogged
            ? Center(
                child: Column(
                  children: [
                    CircularProgressIndicator(),
                    Align(
                      alignment: Alignment.center,
                      child: Text('First Login \n Or Register if new user ',
                          style: TextStyle(
                              color: Colors.purple[900], fontSize: 22)),
                    ),
                    FlatButton(
                      child: Text("Login"),
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginApi()));
                      },
                    ),
                    FlatButton(
                      child: Text("Register"),
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => SignUp()));
                      },
                    ),
                  ],
                ),
              )
            : ListView.builder(
                itemCount: mapResponse['cartitems'].length,
                itemBuilder: (BuildContext context, int index) {
                  return Card(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            mapResponse['cartitems'][index]['id'].toString(),
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: IconButton(
                              onPressed: () {
                                deleteItem(mapResponse['cartitems'][index]['id']
                                    .toString());
                              },
                              icon: Icon(Icons.delete)),
                        ),
                        // Text(listResponse['total'].toString())
                      ],
                    ),
                  );
                }));
  }

  getToken(String token) async {
    setState(() {
      this.token = token;
    });
  }

  updateTotal(String carttotal) async {
    setState(() {
      this.carttotal = carttotal;
    });
  }
}
