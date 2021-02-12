import 'package:flutter/material.dart';
import 'package:nappies_direct/bloc/cart_items_bloc.dart';
import 'package:nappies_direct/views/address.dart';
import 'package:nappies_direct/views/saveLaterPage.dart';
import 'package:nappies_direct/views/wishlist.dart';
import 'package:number_inc_dec/number_inc_dec.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'drawer.dart';
import 'home.dart';

class Checkout extends StatefulWidget {
  @override
  _CheckoutState createState() => _CheckoutState();
}

class _CheckoutState extends State<Checkout> {
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
          title: Text('Checkout',
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
                      // Expanded(child: checkoutListBuilder(snapshot)),
                      Expanded(
                        child: ListView.builder(
                          itemCount: snapshot.data["cart items"].length,
                          itemBuilder: (BuildContext context, i) {
                            final cartList = snapshot.data["cart items"];
                            return Card(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                      height: size.height * 0.2,
                                      child: Image.asset(cartList[i]['image'],
                                          fit: BoxFit.cover)),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(cartList[i]['title'],
                                          style: TextStyle(fontSize: 18)),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text("\$${cartList[i]['price']}",
                                          style: TextStyle(
                                              fontSize: 18,
                                              color: Colors.purple[600])),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0),
                                            child: Container(
                                              height: size.height * 0.04,
                                              width: size.width * 0.3,
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 5),
                                              child: NumberInputPrefabbed
                                                  .leafyButtons(
                                                controller:
                                                    TextEditingController(),
                                                incIconSize: 22,
                                                decIconSize: 22,
                                                buttonArrangement:
                                                    ButtonArrangement
                                                        .incLeftDecRight,
                                              ),
                                              // NumberInputPrefabbed
                                              //     .roundedButtons(
                                              //   controller:
                                              //       TextEditingController(),
                                              //   autovalidate: false,
                                              //   incDecBgColor: Colors.amber,
                                              //   buttonArrangement:
                                              //       ButtonArrangement
                                              //           .incLeftDecRight,
                                              // ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          IconButton(
                                            icon: Icon(Icons.delete),
                                            onPressed: () {
                                              bloc.removeFromCart(cartList[i]);
                                            },
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
                      SizedBox(height: 3),
                      Row(
                        children: [
                          Container(
                            width: size.width - 50,
                            padding: EdgeInsets.symmetric(horizontal: 15),
                            height: size.height * 0.06,
                            child: TextField(
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: const BorderRadius.all(
                                      const Radius.circular(10.0),
                                    ),
                                  ),
                                  labelText: 'Enter Promo Code',
                                  hintText: 'Use # before code'),
                            ),
                          ),
                          Container(
                            width: size.width * 0.1,
                            height: size.height * 0.1,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black,
                            ),
                            padding: EdgeInsets.symmetric(horizontal: 6),
                            child: InkWell(
                              onTap: () {
                                showCupertinoModalBottomSheet(
                                  context: context,
                                  backgroundColor: Colors.grey[200],
                                  builder: (context) => Container(
                                    padding: EdgeInsets.fromLTRB(10, 10, 10, 8),
                                    height: 300,
                                    child: SingleChildScrollView(
                                      scrollDirection: Axis.vertical,
                                      child: Column(
                                        children: [
                                          Card(
                                              child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 8.0),
                                                    child: Text('90% Off',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors
                                                                .purple[600],
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(16, 5, 1, 8),
                                                    child: Text(
                                                        'Up to 90% OFF Fashion, Electronics & More - Amazon\n Daily Day Deals',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                        )),
                                                  ),
                                                  Text('Code - #4D4PR6O8',
                                                      style: TextStyle(
                                                          color:
                                                              Colors.pinkAccent,
                                                          fontSize: 16)),
                                                ],
                                              ),
                                            ],
                                          )),
                                          Card(
                                              child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 8.0),
                                                    child: Text('60% OFF',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors
                                                                .purple[600],
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(16, 5, 1, 8),
                                                    child: Text(
                                                        'TataCLiQ Flash Offers: Upto 80% OFF on \nElectronics & Clothing',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                        )),
                                                  ),
                                                  Text('Code - #8D4QR598',
                                                      style: TextStyle(
                                                          color:
                                                              Colors.pinkAccent,
                                                          fontSize: 16)),
                                                ],
                                              ),
                                            ],
                                          )),
                                          Card(
                                              child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 8.0),
                                                    child: Text('80% OFF',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors
                                                                .purple[600],
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(16, 5, 1, 8),
                                                    child: Text(
                                                        '80% OFF Fashion & Apparel - 40% - 80% OFF + Extra 10% \nCashback On Top Brands',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                        )),
                                                  ),
                                                  Text('Code - #7T4PR9O8',
                                                      style: TextStyle(
                                                          color:
                                                              Colors.pinkAccent,
                                                          fontSize: 16)),
                                                ],
                                              ),
                                            ],
                                          )),
                                          Card(
                                              child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 8.0),
                                                    child: Text('60% OFF',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors
                                                                .purple[600],
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(16, 5, 1, 8),
                                                    child: Text(
                                                        'Reliance Trends Sale - Flat 60% OFF (All Users)',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                        )),
                                                  ),
                                                  Text('Code - #4F4PR6O9',
                                                      style: TextStyle(
                                                          color:
                                                              Colors.pinkAccent,
                                                          fontSize: 16)),
                                                ],
                                              ),
                                            ],
                                          )),
                                          Card(
                                              child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 8.0),
                                                    child: Text('40% Off',
                                                        style: TextStyle(
                                                            fontSize: 18,
                                                            color: Colors
                                                                .purple[600],
                                                            fontWeight:
                                                                FontWeight
                                                                    .bold)),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets
                                                        .fromLTRB(16, 5, 1, 8),
                                                    child: Text(
                                                        'Men T-Shirts Starts @ Rs 99',
                                                        style: TextStyle(
                                                          fontSize: 12,
                                                        )),
                                                  ),
                                                  Text('Code - #5P4PR6O8',
                                                      style: TextStyle(
                                                          color:
                                                              Colors.pinkAccent,
                                                          fontSize: 16)),
                                                ],
                                              ),
                                            ],
                                          ))
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                              child: Align(
                                  alignment: Alignment.centerLeft,
                                  child: Icon(
                                    Icons.arrow_forward_ios,
                                    size: 30,
                                    color: Colors.white,
                                  )),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text('Total Amount ', style: TextStyle(fontSize: 18)),
                          SizedBox(width: 15),
                          Text('\$799',
                              style: TextStyle(
                                  fontSize: 22, color: Colors.purple[600]))
                        ],
                      ),
                      SizedBox(height: 10),
                      InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddressPage()));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(55),
                            color: Colors.pink[50],
                          ),
                          width: size.width * 0.5,
                          height: size.height * 0.05,
                          child: Align(
                            child: Text(
                              "Checkout",
                              style: TextStyle(
                                  fontSize: 22, fontWeight: FontWeight.bold),
                            ),
                            alignment: Alignment.center,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                    ],
                  )
                : Center(child: Text("You haven't taken any item yet"));
          },
        ),
        bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              // sets the background color of the `BottomNavigationBar`
              canvasColor: Colors.pink[50],
            ),
            child: SizedBox(
              height: 50,
              child: BottomNavigationBar(
                  showUnselectedLabels: false,
                  selectedFontSize: 1,
                  unselectedFontSize: 1,
                  items: [
                    BottomNavigationBarItem(
                      // ignore: deprecated_member_use
                      title:
                          Text("Home", style: TextStyle(color: Colors.black)),
                      icon: IconButton(
                          icon: new Icon(
                            Icons.home_outlined,
                            size: 27.0,
                            color: Colors.black,
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => HomePage()));
                          }),
                    ),
                    BottomNavigationBarItem(
                      // ignore: deprecated_member_use
                      title:
                          Text("Offers", style: TextStyle(color: Colors.black)),
                      icon: IconButton(
                          icon: new Icon(
                            Icons.grade_outlined,
                            size: 27.0,
                            color: Colors.black,
                          ),
                          onPressed: null),
                    ),
                    BottomNavigationBarItem(
                      // ignore: deprecated_member_use
                      title:
                          Text("Cart", style: TextStyle(color: Colors.black)),
                      icon: IconButton(
                          icon: new Icon(
                            Icons.shopping_cart_outlined,
                            size: 27.0,
                            color: Colors.black,
                          ),
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ShopItems()))),
                    ),
                    BottomNavigationBarItem(
                      // ignore: deprecated_member_use
                      title: Text("Wishlist",
                          style: TextStyle(color: Colors.black)),
                      icon: IconButton(
                          icon: new Icon(
                            Icons.favorite_border,
                            size: 27.0,
                            color: Colors.black,
                          ),
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Wishlist()))),
                    ),
                    BottomNavigationBarItem(
                      // ignore: deprecated_member_use
                      title: Text("Profile",
                          style: TextStyle(color: Colors.black)),
                      icon: IconButton(
                          icon: new Icon(
                            Icons.perm_identity,
                            size: 27.0,
                            color: Colors.black,
                          ),
                          onPressed: null),
                    ),
                  ]),
            )));
  }
}
