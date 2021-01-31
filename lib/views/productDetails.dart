import 'package:flutter/material.dart';
// import 'package:nappies_direct/views/shoppingList.dart';
import 'package:photo_view/photo_view.dart';
// import 'package:vector_math/vector_math_64.dart' show Vector3;

class ProductDetailPage extends StatefulWidget {
  final String id;
  final String name;
  final String code;
  final String img;
  final String price;
  final String promotionPrice;
  final List size;
  final List color;

  const ProductDetailPage(
      {Key key,
      this.id,
      this.name,
      this.code,
      this.img,
      this.price,
      this.promotionPrice,
      this.size,
      this.color})
      : super(key: key);
  @override
  _ProductDetailPageState createState() => _ProductDetailPageState();
}

class _ProductDetailPageState extends State<ProductDetailPage> {
  int activeSize = 1;
  int activeColor = 0;
  String activeImg = '';
  int qty = 1;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      activeImg = widget.img;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomSheet: getBottom(),
    );
  }

  Widget getBottom() {
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
                  // your add cart here
                  // var index;
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) => ShoppingPage(
                  //               id: dataItems[index]['id'].toString(),
                  //               name: dataItems[index]['name'],
                  //               code: dataItems[index]['code'],
                  //               img: dataItems[index]['img'],
                  //               price: dataItems[index]['price'].toString(),
                  //               promotionPrice: dataItems[index]

                  //                       ['promotionPrice']
                  //                   .toString(),
                  //               size: dataItems[index]['size'],
                  //               color: dataItems[index]['color'],
                  //             )));
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => CartApp()));
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
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 60),
        child: ListView(
          children: <Widget>[
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
            Card(
              elevation: 2,
              child: Hero(
                tag: widget.id.toString(),
                child: Container(
                    height: 400,
                    child: PhotoView(
                      imageProvider: AssetImage(activeImg),
                      minScale: PhotoViewComputedScale.contained * 0.9,
                      maxScale: PhotoViewComputedScale.covered * 1.0,
                      // enableRotation: true,
                      backgroundDecoration: BoxDecoration(color: Colors.white),
                    )),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                width: 700,
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
                      Text(
                        "\$" + widget.promotionPrice,
                        style: TextStyle(
                            fontSize: 30,
                            height: 1.5,
                            color: Colors.purple[800]),
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        "\$" + widget.price,
                        style: TextStyle(
                            fontSize: 20,
                            height: 1.5,
                            color: Colors.grey[400],
                            fontWeight: FontWeight.w400,
                            decoration: TextDecoration.lineThrough),
                      )
                    ],
                  )),
                ],
              ),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Name :",
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    child: Text(
                      widget.name,
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
                    "Code :",
                    style: TextStyle(fontSize: 16, height: 1.5),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Flexible(
                    child: Text(
                      widget.code,
                      style: TextStyle(fontSize: 16, height: 1.5),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
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
}
