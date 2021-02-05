import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nappies_direct/views/drawer.dart';
import 'package:nappies_direct/views/wishlist.dart';

import 'package:nappies_direct/bloc/wishlist_bloc.dart';

class AllProductlist extends StatelessWidget {
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
              Icons.favorite,
              size: 30,
              color: Colors.purple[900],
            ),
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Wishlist()));
            },
          ),
        ],
      ),
      body: ShopItemsWidget(),
    );
  }
}

class ShopItemsWidget extends StatefulWidget {
  @override
  _ShopItemsWidgetState createState() => _ShopItemsWidgetState();
}

class _ShopItemsWidgetState extends State<ShopItemsWidget> {
  bool toggle = true;

  void changeState() {
    setState(() {
      toggle = !toggle;
    });
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: bloc.allItems, // The bloc was already instantiated.
      stream: bloc.getStream, // The stream we'll be listing to
      builder: (context, snapshot) {
        // snapshot contains the data of the bloc
        return snapshot.data['shop items'].length > 0
            ? Stack(
                children: <Widget>[
                  Container(
                    height: 648,
                    padding: EdgeInsets.only(top: 15, left: 5, right: 5),
                    child: StaggeredGridView.countBuilder(
                      crossAxisCount: 2,
                      itemCount: snapshot.data["shop items"].length,
                      itemBuilder: (context, i) {
                        final shopList = snapshot.data["shop items"];
                        // var isPressed = false;
                        return Card(
                          child: Column(
                            children: [
                              ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
                                child: Image.asset(shopList[i]['image'],
                                    fit: BoxFit.cover),
                              ),
                              Text(shopList[i]['title']),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("\$${shopList[i]['price']}"),
                                  IconButton(
                                      icon: toggle
                                          ? Icon(
                                              Icons.favorite_border,
                                              color: Colors.grey[600],
                                              size: 30,
                                            )
                                          : Icon(
                                              Icons.favorite,
                                              color: Colors.red[600],
                                              size: 30,
                                            ),
                                      onPressed: () {
                                        setState(() {
                                          toggle = !toggle;
                                        });
                                        final snackBar = SnackBar(
                                            duration:
                                                Duration(milliseconds: 500),
                                            content: Text(
                                                'Your Item is added to Wishlist'));
                                        Scaffold.of(context)
                                            .showSnackBar(snackBar);
                                        bloc.addToCart(shopList[i]);
                                      }),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                      staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                  ),
                ],
              )
            : Center(child: Text("All items of  have been taken"));
      },
    );
  }
}
