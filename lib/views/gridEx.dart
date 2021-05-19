import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:nappies_direct/bloc/cart_items_bloc.dart';
import 'package:nappies_direct/models/addToCartModel.dart';
import 'package:nappies_direct/views/MyStore.dart';
import 'package:nappies_direct/views/data.dart';
// import 'package:nappies_direct/models/cart_model.dart';
// import 'package:flutter_cart/flutter_cart.dart';
// import 'package:nappies_direct/views/fashionData.dart';
import 'package:photo_view/photo_view.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'cart2.dart';

class GridExPage extends StatefulWidget {
  final int id;
  final String image;
  final String title;
  final int price;
  final String promotionPrice;
  final List size;
  final List color;

  const GridExPage(
      {Key key,
      this.id,
      this.image,
      this.title,
      this.price,
      this.promotionPrice,
      this.size,
      this.color})
      : super(key: key);

  @override
  _GridExPageState createState() => _GridExPageState();
}

class _GridExPageState extends State<GridExPage> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  int activeSize = 1;
  int activeColor = 0;
  String activeImg = '';
  int qty = 0;
  bool _isLogged = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      activeImg = widget.image;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: getBody(),
      bottomSheet: getBottom(),
    );
  }

  Widget getBottom() {
    // String id = '1';
    // String price = '10';
    // Future<AddToCart> _futureCart;
    var store = Provider.of<MyStore>(context);
    var size = MediaQuery.of(context).size;
    return Container(
      height: 60,
      width: size.width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: FlatButton(
                color: Colors.red,
                onPressed: () {
                  store.addOneItem(store.activeProduct);
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Cart()));
                },
                child: Text(
                  "ADD TO CART",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                )),
          ),
          Expanded(
            child: FlatButton(
              color: Colors.purple[600],
              onPressed: () {},
              child: Text(
                "Buy Now",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget getBody() {
    var store = Provider.of<MyStore>(context);
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 60.0),
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Icon(Icons.arrow_back_ios)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Hero(
              tag: widget.id,
              child: Container(
                  height: size.height * 0.4,
                  child: PhotoView(
                    imageProvider: AssetImage(
                      activeImg,
                    ),
                    customSize: Size.fromHeight(size.height * 0.4),
                    minScale: PhotoViewComputedScale.contained * 1.0,
                    maxScale: PhotoViewComputedScale.contained * 1.1,
                    // enableRotation: true,
                    backgroundDecoration: BoxDecoration(color: Colors.white),
                  )),
            ),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                padding: EdgeInsets.only(left: 10),
                width: size.height,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Flexible(
                        child: Wrap(
                            children:
                                List.generate(widget.color.length, (index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 2),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              activeColor = widget.color[index]['id'];
                              activeImg = widget.color[index]['value'];
                            });
                          },
                          child: Container(
                            width: 75,
                            height: 75,
                            decoration: BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        widget.color[index]['value']),
                                    fit: BoxFit.cover),
                                border: Border.all(
                                  width: 2,
                                  color:
                                      activeColor == widget.color[index]['id']
                                          ? Colors.red
                                          : Colors.transparent,
                                ),
                                borderRadius: BorderRadius.circular(5)),
                          ),
                        ),
                      );
                    }))),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Flexible(
                      child: Row(
                    children: <Widget>[
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "\$${widget.price}",
                        style: TextStyle(
                            fontSize: 30,
                            height: 1.5,
                            color: Colors.purple[800]),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "\$" + widget.promotionPrice,
                        style: TextStyle(
                            fontSize: 20,
                            height: 1.5,
                            color: Colors.grey[400],
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.lineThrough),
                      ),
                    ],
                  )),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Name :",
                    style: TextStyle(
                      fontSize: 18,
                      height: 1.5,
                    ),
                  ),
                  SizedBox(
                    width: 40,
                  ),
                  Flexible(
                    child: Text(
                      widget.title,
                      style: TextStyle(fontSize: 16, height: 1.5),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Size :",
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Flexible(
                      child: Wrap(
                          children: List.generate(widget.size.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 20),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            activeSize = widget.size[index]['id'];
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: activeSize == widget.size[index]['id']
                                  ? Colors.purple
                                  : Colors.white,
                              border: Border.all(
                                width: 2,
                                color: activeSize == widget.size[index]['id']
                                    ? Colors.grey[100]
                                    : Colors.grey[200],
                              ),
                              borderRadius: BorderRadius.circular(5)),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 12, bottom: 12, right: 15, left: 15),
                            child: Text(
                              widget.size[index]['value'],
                              style: TextStyle(fontSize: 16, height: 1.5),
                            ),
                          ),
                        ),
                      ),
                    );
                  }))),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Qty :",
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Flexible(
                      child: Row(
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          if (qty > 1) {
                            setState(() {
                              qty = --qty;
                            });
                          }
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.5))),
                          width: 35,
                          height: 35,
                          child: Icon(
                            Icons.remove,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      Text(
                        qty.toString(),
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(
                        width: 25,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() {
                            qty = ++qty;
                          });
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                  color: Colors.black.withOpacity(0.5))),
                          width: 35,
                          height: 35,
                          child: Icon(
                            Icons.add,
                            color: Colors.black.withOpacity(0.5),
                          ),
                        ),
                      )
                    ],
                  )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget getId() {
    return SafeArea(
        child: Column(
      children: [],
    ));
  }
}
