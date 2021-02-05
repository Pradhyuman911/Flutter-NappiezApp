import 'package:flutter/material.dart';
import 'package:nappies_direct/bloc/wishlist_bloc.dart';
import 'package:nappies_direct/views/drawer.dart';
// import 'package:nappies_direct/views/appBar.dart';

class Wishlist extends StatelessWidget {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
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
        title: Container(
          height: 50,
          width: 160,
          child: ClipRect(
            child: Image(
              image: AssetImage("assets/images/logo.jpg"),
              fit: BoxFit.fill,
            ),
          ),
        ),
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
            icon: Icon(
              Icons.notifications_active,
              size: 30,
              color: Colors.purple[900],
            ),
            onPressed: null,
          ),
        ],
      ),
      body: StreamBuilder(
        stream: bloc.getStream,
        initialData: bloc.allItems,
        builder: (context, snapshot) {
          return snapshot.data['cart items'].length > 0
              ? Column(
                  children: <Widget>[
                    Expanded(child: checkoutListBuilder(snapshot)),
                    RaisedButton(
                      onPressed: () {},
                      child: Text("My Wishlist"),
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(height: 40)
                  ],
                )
              : Center(child: Text("You haven't taken added any item yet"));
        },
      ),
    );
  }
}

Widget checkoutListBuilder(snapshot) {
  return ListView.builder(
    itemCount: snapshot.data["cart items"].length,
    itemBuilder: (BuildContext context, i) {
      final cartList = snapshot.data["cart items"];
      return ListTile(
        leading: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: 44,
            minHeight: 44,
            maxWidth: 64,
            maxHeight: 64,
          ),
          child: Image.asset(cartList[i]['image'], fit: BoxFit.cover),
        ),
        title: Text(cartList[i]['title']),
        subtitle: Text("\$${cartList[i]['price']}"),
        trailing: IconButton(
          icon: Icon(Icons.delete),
          onPressed: () {
            bloc.removeFromCart(cartList[i]);
          },
        ),
        onTap: () {},
      );
    },
  );
}
