import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nappies_direct/views/MyStore.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nappies_direct/views/checkout.dart';
import 'package:http/http.dart' as http;
import 'package:nappies_direct/bloc/cart_items_bloc.dart';
import 'package:nappies_direct/views/drawer.dart';
import 'package:nappies_direct/views/signup.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
      // print("if " + token);
      String carttotal = data['TotalProduct'].toString();
      prefs.getString(carttotal);
      print("Total Product in cart : " + data['TotalProduct'].toString());
      print(response.body);
      return updateTotal(carttotal);
    } else {
      print('else ' + token);
      print(response.statusCode);
      // return null;
    }
  }

  Future fetchData() async {
    var response =
        await http.get('http://firstchoice.net.in/api/user/cartshow');
    return json.decode(response.body)['cartitems'];
  }

  String _productName(dynamic user) {
    return user['product_name'];
  }

  @override
  void initState() {
    checkStatus();
    super.initState();
  }

  Widget build(BuildContext context) {
    var store = Provider.of<MyStore>(context);
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
              FutureBuilder(
                future: cartTotal(),
                initialData: "First Login ...",
                builder: (BuildContext context, text) {
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          carttotal,
                          style: TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                            fontSize: 22,
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.shopping_cart_outlined, size: 30),
                onPressed: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => Checkout())),
              ),
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
                        style:
                            TextStyle(color: Colors.purple[900], fontSize: 22)),
                  ),
                  FlatButton(
                    child: Text("Login"),
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginApi()));
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
              itemCount: store.baskets.length,
              itemBuilder: (BuildContext context, int i) {
                return Row(
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(store.baskets[i].image))),
                    ),
                    Text(store.baskets[i].title),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.add),
                          onPressed: () {
                            store.addOneItem(store.baskets[i]);
                          },
                        ),
                        // Text(store.baskets[i].qty.toString()),
                        IconButton(
                          icon: Icon(Icons.remove),
                          onPressed: () {
                            store.removeOneItem(store.baskets[i]);
                          },
                        ),
                      ],
                    )
                  ],
                );
              },
            ),
    );
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

class CartWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: bloc.allItems, // The bloc was already instantiated.
      stream: bloc.getStream, // The stream we'll be listing to
      builder: (context, snapshot) {
        // snapshot contains the data of the bloc
        return snapshot.data['shop items'].length > 0
            ? Column(
                children: <Widget>[
                  Expanded(child: cartListBuilder(snapshot)),
                  SizedBox(height: 40)
                ],
              )
            : Center(child: Text("All items in shop have been taken"));
      },
    );
  }
}

Widget cartListBuilder(snapshot) {
  return ListView.builder(
    itemCount: snapshot.data["shop items"].length,
    itemBuilder: (BuildContext context, i) {
      final shopList = snapshot.data["shop items"];
      return ListTile(
        leading: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: 44,
            minHeight: 44,
            maxWidth: 64,
            maxHeight: 64,
          ),
          child: Image.asset(shopList[i]['image'], fit: BoxFit.cover),
        ),
        title: Text(shopList[i]['title'],
            style: TextStyle(
              fontSize: 15,
            )),
        subtitle: Text(
          "\$${shopList[i]['price']}",
          style: TextStyle(fontSize: 17, color: Colors.purple[900]),
        ),
        trailing: IconButton(
          icon: Icon(Icons.add_shopping_cart),
          onPressed: () {
            final snackBar = SnackBar(
                duration: Duration(milliseconds: 500),
                content: Text('Your Item is added to Cart'));
            Scaffold.of(context).showSnackBar(snackBar);
            bloc.addToCart(shopList[i]);
          },
        ),
        onTap: () {},
      );
    },
  );
}
