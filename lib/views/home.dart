import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
// import 'package:dots_indicator/dots_indicator.dart';
// import 'category.dart';
import 'data.dart';
import 'fashion.dart';
import 'drawer.dart';
import 'productDetails.dart';



final List imgList = [
  "assets/images/pro1.jpg",
  "assets/images/pro2.jpg",
  "assets/images/pro3.jpg",
  "assets/images/pro4.jpg",
  "assets/images/pro5.jpg",
  "assets/images/pro6.jpg",
];

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
        body: SingleChildScrollView(
            child: Column(children: [
          Container(
            height: size.height * 3,
            width: double.infinity,
            color: Colors.grey[200],
            child: Column(
              children: [
                // SizedBox(height: 10),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Icon(
                          Icons.home,
                        ),
                        Text(
                          "Top Categories",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ]),
                      IconButton(
                          onPressed: null,
                          icon: Icon(
                            Icons.arrow_forward,
                            size: 30,
                          )),
                    ]),
                Container(
                    height: 100,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: cateList
                          .map((category) => makeCategory(category))
                          .toList(),

                      // IconButton(
                      //   onPressed: null,
                      //   icon: Icon(
                      //     Icons.arrow_forward_ios_outlined,
                      //     size: 30,
                      //   ),
                      // ),
                    )),
                Container(
                    width: 370,
                    height: 160,
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: 400,
      aspectRatio: 16/9,
      viewportFraction: 1.0,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 3),
      autoPlayAnimationDuration: Duration(milliseconds: 800),
      autoPlayCurve: Curves.fastOutSlowIn,
      enlargeCenterPage: true,
      // onPageChanged: callbackFunction,
      scrollDirection: Axis.horizontal,
                      ),
                      items: imgList
                          .map((item) => Container(
                                padding: EdgeInsets.symmetric(horizontal: 3),
                                child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                    child: Image.asset(item,
                                        fit: BoxFit.cover, width: 1000)),
                              ))
                          .toList(),
                    )),
                // SizedBox(height: 10),
                Container(
                    height: 100,
                    width: 400,
                    // color: Colors.green,
                    child: Card(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              child: Image(
                                  width: 170,
                                  image: AssetImage("assets/images/pro7.jpg"),
                                  fit: BoxFit.cover)),
                          ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              child: Image(
                                  width: 170,
                                  image: AssetImage("assets/images/pro10.jpg"),
                                  fit: BoxFit.fill)),
                        ],
                      ),
                    )),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Icon(
                          Icons.shop_outlined,
                        ),
                        Text(
                          "Featured Products",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ]),
                      IconButton(
                          onPressed: null,
                          icon: Icon(
                            Icons.arrow_forward,
                            size: 30,
                          )),
                    ]),
                Container(
                    padding: EdgeInsets.only(left: 5),
                    height: 280,
                    child: Card(
                        child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: proList
                          .map((product) => makeProduct(product))
                          .toList(),
                    ))),
                SizedBox(height: 10),
                Container(
                  height: 150,
                  padding: EdgeInsets.symmetric(horizontal: 5),
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: banList
                          .map((item) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 2.0),
                                child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                    child: Image(
                                      height: 150,
                                      width: 200,
                                      image: AssetImage(item),
                                      fit: BoxFit.cover,
                                    )),
                              ))
                          .toList()),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Icon(
                          Icons.loyalty_outlined,
                        ),
                        Text(
                          "On Sale Products",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ]),
                      IconButton(
                          onPressed: null,
                          icon: Icon(
                            Icons.arrow_forward,
                            size: 30,
                          )),
                    ]),
                Container(
                  height: 260,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: saleList
                        .map((product) => makeProduct(product))
                        .toList(),
                  ),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Icon(
                          Icons.local_offer_outlined,
                        ),
                        Text(
                          "Latest Products",
                          style: TextStyle(
                            fontSize: 20,
                          ),
                        ),
                      ]),
                      IconButton(
                          onPressed: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context) => PinterestGrid()));
                          },
                          icon: Icon(
                            Icons.arrow_forward,
                            size: 30,
                          )),
                    ]),
                Container(
                    height: 720,
                    child: GridView.count(
                      physics: NeverScrollableScrollPhysics(),
                      crossAxisCount: 2,
                      // mainAxisSpacing: 8,
                      // crossAxisSpacing: 8,
                      children: gridList.map((item) => makeGrid(item)).toList(),
                    )),
                    SizedBox(height:20),
                Container(
                    width: 420,
                    height: 200,
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: 400,
      aspectRatio: 16/9,
      viewportFraction: 1.0,
      initialPage: 0,
      enableInfiniteScroll: true,
      reverse: false,
      autoPlay: true,
      autoPlayInterval: Duration(seconds: 3),
      autoPlayAnimationDuration: Duration(milliseconds: 400),
      autoPlayCurve: Curves.fastOutSlowIn,
      enlargeCenterPage: true,
      // onPageChanged: callbackFunction,
      scrollDirection: Axis.horizontal,
                      ),
                      items: banDList
                          .map((item) => Container(
                                padding: EdgeInsets.symmetric(horizontal: 3),
                                child: ClipRRect(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5.0)),
                                    child: Image.asset(item,
                                        fit: BoxFit.cover, width: 1000)),
                              ))
                          .toList(),
                    )),
              ],
            ),
          ),
        ])),
        bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              // sets the background color of the `BottomNavigationBar`
              canvasColor: Colors.pink[50],
            ),
            child: BottomNavigationBar(
                showUnselectedLabels: true,
                selectedFontSize: 15,
                unselectedFontSize: 15,
                items: [
                  BottomNavigationBarItem(
                    // ignore: deprecated_member_use
                    title: Text("Home", style: TextStyle(color: Colors.black)),
                    icon: IconButton(
                        icon: new Icon(
                          Icons.home_outlined,
                          size: 30.0,
                          color: Colors.black,
                        ),
                        onPressed: null),
                  ),
                  BottomNavigationBarItem(
                    // ignore: deprecated_member_use
                    title:
                        Text("Offers", style: TextStyle(color: Colors.black)),
                    icon: IconButton(
                        icon: new Icon(
                          Icons.grade_outlined,
                          size: 30.0,
                          color: Colors.black,
                        ),
                        onPressed: null),
                  ),
                  BottomNavigationBarItem(
                    // ignore: deprecated_member_use
                    title: Text("Cart", style: TextStyle(color: Colors.black)),
                    icon: IconButton(
                        icon: new Icon(
                          Icons.shopping_cart_outlined,
                          size: 30.0,
                          color: Colors.black,
                        ),
                        onPressed: null),
                  ),
                  BottomNavigationBarItem(
                    // ignore: deprecated_member_use
                    title:
                        Text("Wishlist", style: TextStyle(color: Colors.black)),
                    icon: IconButton(
                        icon: new Icon(
                          Icons.favorite_border,
                          size: 30.0,
                          color: Colors.black,
                        ),
                        onPressed: null),
                  ),
                  BottomNavigationBarItem(
                    // ignore: deprecated_member_use
                    title:
                        Text("Profile", style: TextStyle(color: Colors.black)),
                    icon: IconButton(
                        icon: new Icon(
                          Icons.perm_identity,
                          size: 30.0,
                          color: Colors.black,
                        ),
                        onPressed: null),
                  ),
                ])));
  }
}

Widget makeCategory(category) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 5.0),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: 60,
          height: 60,
          decoration: BoxDecoration(shape:BoxShape.circle,
            image: DecorationImage(image: AssetImage(category.image),fit: BoxFit.cover),
          ),
        ),
        Text(
          category.title,
          style: TextStyle(fontSize:12)
        )
      ],
    ),
  );
}

Widget makeProduct(product) {
  return Container(
    // padding: EdgeInsets.all(3),
    child: Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Image(
              height: 170,
              width: 150,
              image: AssetImage(product.image),
              fit: BoxFit.cover,
            ),
          ),
          Text(
            product.title,
            style: TextStyle(fontSize:16),
          ),
          Text(" \$ "+'${product.price}'+".00",style: TextStyle(fontSize: 18,color: Colors.purple[600]),)
        ],
      ),
    ),
  );
}

Widget makeGrid(item) {
  return InkWell(
    onTap:(){
      Navigator.push(context, MaterialPageRoute(builder: (context) => ProductDetails() ));
    },
      child: Card(
      color: Colors.grey[100],
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              child: Padding(
                padding: const EdgeInsets.only(top:8.0),
                child: Image(
                  height: 90,
                  width: 150,
                  image: AssetImage(item.image),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Text(
              item.title,
              style: TextStyle(fontSize:16),
            ),
            Text(" \$ "+'${item.price}'+".00",style: TextStyle(fontSize: 18,color: Colors.purple[600]),)
          ]),
    ),
  );
}
