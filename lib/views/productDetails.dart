import 'package:flutter/material.dart';
// import 'package:nappies_direct/bloc/cart_items_bloc.dart';
// import 'package:nappies_direct/views/fashionData.dart';
import 'package:nappies_direct/views/cart.dart';
import 'package:photo_view/photo_view.dart';
// import 'package:nappies_direct/bloc/cart_items_bloc.dart';

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

  bool toggle = true;

  void changeState() {
    setState(() {
      toggle = !toggle;
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
                  // final snackBar =
                  //     SnackBar(content: Text('Your Item is added to Cart'));
                  // Scaffold.of(context).showSnackBar(snackBar);
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
    // bool toggle = false;
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(bottom: 60),
          child: ListView(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                    ),
                    child: InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Align(
                          alignment: Alignment.centerLeft,
                          child: Icon(Icons.arrow_back_ios)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                    ),
                    child: IconButton(
                      icon: Icon(Icons.shopping_cart),
                      onPressed: () => Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Cart())),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Hero(
                tag: widget.id.toString(),
                child: Container(
                    height: size.height * 0.5,
                    child: PhotoView(
                      imageProvider: AssetImage(activeImg),
                      customSize: Size.fromHeight(size.height * 0.5),
                      minScale: PhotoViewComputedScale.contained * 1.0,
                      maxScale: PhotoViewComputedScale.contained * 1.0,
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
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                        style: TextStyle(fontSize: 18, height: 1.5),
                      ),
                    ),
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
                          changeState();
                          final snackBar = SnackBar(
                              content: Text('Your Item is added to Wishlist'));
                          Scaffold.of(context).showSnackBar(snackBar);
                          // bloc.addToCart(shopList[i]);
                        }),
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
                            children:
                                List.generate(widget.size.length, (index) {
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
      ),
    );
  }
}
