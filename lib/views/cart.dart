import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nappies_direct/views/checkout.dart';

import 'package:nappies_direct/bloc/cart_items_bloc.dart';
import 'package:nappies_direct/views/drawer.dart';
import 'package:nappies_direct/views/signup.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'login2.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

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

  @override
  void initState() {
    checkStatus();
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
          IconButton(
            icon: Icon(Icons.shopping_cart, size: 30),
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => Checkout())),
          )
        ],
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: Image(
                    height: 100,
                    width: 300,
                    image: AssetImage("assets/images/logo.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              _isLogged
                  ? Center(
                      child: Column(
                        children: [
                          CircularProgressIndicator(),
                          Text('First Login \n Or Register if new user ',
                              style: TextStyle(
                                  color: Colors.purple[900], fontSize: 22)),
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
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUp()));
                            },
                          ),
                        ],
                      ),
                    )
                  : Container(
                      margin: const EdgeInsets.only(top: 30),
                      padding: const EdgeInsets.all(10),
                      height: 200,
                      width: 200,
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          // color:Colors.red
                          image: DecorationImage(
                              image: AssetImage("assets/images/user.jpg"),
                              fit: BoxFit.cover)),
                    ),
            ],
          )),
    );
  }

  getToken(String token) async {
    setState(() {
      this.token = token;
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
