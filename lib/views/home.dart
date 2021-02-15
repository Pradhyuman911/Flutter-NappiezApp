import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:nappies_direct/views/allProducts.dart';
import 'package:nappies_direct/views/gridEx.dart';
// import 'package:nappies_direct/views/login.dart';
import 'package:nappies_direct/views/login2.dart';
import 'package:nappies_direct/views/profile.dart';
import 'package:nappies_direct/views/cart.dart';
import 'package:nappies_direct/views/wishlist.dart';
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
  Icon cusIcon = Icon(
    Icons.search,
    size: 30,
    color: Colors.purple[900],
  );
  Widget cusSearch = Container(
    height: 50,
    width: 140,
    child: ClipRect(
      child: Image(
        image: AssetImage("assets/images/logo.jpg"),
        fit: BoxFit.fill,
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.grey[200],
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
          title: cusSearch,
          actions: [
            IconButton(
              icon: cusIcon,
              onPressed: () {
                setState(() {
                  if (this.cusIcon.icon == Icons.search) {
                    this.cusIcon = Icon(Icons.cancel);
                    this.cusSearch = TextField(
                      textInputAction: TextInputAction.go,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Colors.white38,
                        border: InputBorder.none,
                        hintText: 'Search Here',
                      ),
                      style: TextStyle(color: Colors.purple[900], fontSize: 16),
                    );
                  } else {
                    this.cusIcon = Icon(
                      Icons.search,
                      size: 30,
                      color: Colors.purple[900],
                    );
                    this.cusSearch = Container(
                      height: 50,
                      width: 140,
                      child: ClipRect(
                        child: Image(
                          image: AssetImage("assets/images/logo.jpg"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    );
                  }
                });
              },
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
          scrollDirection: Axis.vertical,
          child: Column(children: [
            SafeArea(
              child: Column(children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          Icons.home,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Top Categories",
                          style: TextStyle(
                            fontSize: 18,
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
                SafeArea(
                  child: Container(
                      height: size.height * 0.15,
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
                ),
                Container(
                    width: size.width,
                    height: size.height * 0.28,
                    child: CarouselSlider(
                      options: CarouselOptions(
                        height: size.height * 0.5,
                        aspectRatio: 16 / 9,
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
                SizedBox(height: 7),
                Padding(
                  padding: const EdgeInsets.only(left: 2.0, right: 2),
                  child: Container(
                      height: size.height * 0.15,
                      width: size.width,
                      // color: Colors.green,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              child: Image(
                                  width: size.width * 0.49,
                                  image: AssetImage("assets/images/pro7.jpg"),
                                  fit: BoxFit.cover)),
                          SizedBox(
                            width: 2,
                          ),
                          ClipRRect(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(5.0)),
                              child: Image(
                                  width: size.width * 0.49,
                                  image: AssetImage("assets/images/pro10.jpg"),
                                  fit: BoxFit.cover)),
                        ],
                      )),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 7.0),
                        child: Row(children: [
                          Icon(
                            Icons.shop_outlined,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Featured Products",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ]),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AllProductlist()));
                          },
                          icon: Icon(
                            Icons.arrow_forward,
                            size: 30,
                          )),
                    ]),
                Container(
                    padding: EdgeInsets.only(left: 5),
                    height: size.height * 0.37,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: proList
                          .map((product) => makeProduct(product))
                          .toList(),
                    )),
                SizedBox(height: 10),
                Container(
                  height: size.height * 0.2,
                  padding: EdgeInsets.symmetric(horizontal: 7),
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
                                      height: size.height * 0.2,
                                      width: size.width * 0.7,
                                      image: AssetImage(item),
                                      fit: BoxFit.cover,
                                    )),
                              ))
                          .toList()),
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 7.0),
                        child: Row(children: [
                          Icon(
                            Icons.loyalty_outlined,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "On Sale Products",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ]),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AllProductlist()));
                          },
                          icon: Icon(
                            Icons.arrow_forward,
                            size: 30,
                          )),
                    ]),
                Container(
                  padding: const EdgeInsets.only(left: 6.0),
                  height: size.height * 0.39,
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
                      Padding(
                        padding: const EdgeInsets.only(left: 7.0),
                        child: Row(children: [
                          Icon(
                            Icons.local_offer_outlined,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Latest Products",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ]),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => AllProductlist()));
                          },
                          icon: Icon(
                            Icons.arrow_forward,
                            size: 30,
                          )),
                    ]),
                Wrap(
                  children: List.generate(gridItems.length, (index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GridExPage(
                                      id: gridItems[index]['id'],
                                      title: gridItems[index]['title'],
                                      image: gridItems[index]['image'],
                                      price: gridItems[index]['price'],
                                      promotionPrice: gridItems[index]
                                              ['promotionPrice']
                                          .toString(),
                                      size: gridItems[index]['size'],
                                      color: gridItems[index]['color'],
                                    )));
                      },
                      child: Card(
                          elevation: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Hero(
                                tag: gridItems[index]['id'],
                                child: Container(
                                  width: (size.width - 16) / 2,
                                  height: (size.width - 70) / 2,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              gridItems[index]['image']),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  gridItems[index]['title'],
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, bottom: 5),
                                child: Text(
                                  "\$ ${gridItems[index]['price']}".toString(),
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.purple[600]),
                                ),
                              ),
                            ],
                          )),
                    );
                  }),
                ),
                SizedBox(
                  height: 7,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 7.0, right: 5),
                  child: Container(
                      width: size.width,
                      height: size.height * 0.3,
                      child: CarouselSlider(
                        options: CarouselOptions(
                          height: 400,
                          aspectRatio: 16 / 9,
                          viewportFraction: 1.1,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: Duration(seconds: 3),
                          autoPlayAnimationDuration:
                              Duration(milliseconds: 400),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          // onPageChanged: callbackFunction,
                          scrollDirection: Axis.horizontal,
                        ),
                        items: banDList
                            .map((item) => Container(
                                  padding: EdgeInsets.symmetric(horizontal: 3),
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(5.0)),
                                      child: Image.asset(item,
                                          fit: BoxFit.cover,
                                          width: size.width)),
                                ))
                            .toList(),
                      )),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Row(children: [
                          Icon(
                            Icons.local_offer_outlined,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Kids Clothing",
                            style: TextStyle(
                              fontSize: 18,
                            ),
                          ),
                        ]),
                      ),
                      IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PinterestGrid()));
                          },
                          icon: Icon(
                            Icons.arrow_forward,
                            size: 30,
                          )),
                    ]),
                Wrap(
                  children: List.generate(dataItems.length, (index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => ProductDetailPage(
                                      id: dataItems[index]['id'].toString(),
                                      name: dataItems[index]['name'],
                                      code: dataItems[index]['code'],
                                      img: dataItems[index]['img'],
                                      price:
                                          dataItems[index]['price'].toString(),
                                      promotionPrice: dataItems[index]
                                              ['promotionPrice']
                                          .toString(),
                                      size: dataItems[index]['size'],
                                      color: dataItems[index]['color'],
                                    )));
                      },
                      child: Card(
                          elevation: 2,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Hero(
                                tag: dataItems[index]['id'].toString(),
                                child: Container(
                                  width: (size.width - 16) / 2,
                                  height: (size.width - 16) / 2,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: AssetImage(
                                              dataItems[index]['img']),
                                          fit: BoxFit.cover)),
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  dataItems[index]['code'],
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 15),
                                child: Text(
                                  "\$ ${dataItems[index]['price']}".toString(),
                                  style: TextStyle(
                                      fontSize: 17, color: Colors.purple[600]),
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                            ],
                          )),
                    );
                  }),
                ),
                SizedBox(
                  height: 7,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Container(
                    width: size.width,
                    child: Image(
                      height: size.height * 0.25,
                      image: AssetImage("assets/images/downBan.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              ]),
            ),
          ]),
        ),
        bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(
              // sets the background color of the `BottomNavigationBar`
              canvasColor: Colors.pink[50],
            ),
            child: SizedBox(
              height: size.height * 0.1,
              child: BottomNavigationBar(
                  showUnselectedLabels: true,
                  selectedFontSize: 10,
                  unselectedFontSize: 10,
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
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginApi()));
                          }),
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
                          onPressed: () => Navigator.push(context,
                              MaterialPageRoute(builder: (context) => Cart())),
                        )),
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
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ProfilePage())),
                        )),
                  ]),
            )));
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
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
                image: AssetImage(category.image), fit: BoxFit.cover),
          ),
        ),
        Text(category.title, style: TextStyle(fontSize: 12))
      ],
    ),
  );
}

Widget makeProduct(product) {
  return Container(
    child: Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5.0)),
            child: Image(
              height: 180,
              width: 160,
              image: AssetImage(product.image),
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 9.0, bottom: 9, top: 12),
            child: Text(
              product.title,
              style: TextStyle(fontSize: 16),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              " \$ " + '${product.price}' + ".00",
              style: TextStyle(fontSize: 18, color: Colors.purple[600]),
            ),
          )
        ],
      ),
    ),
  );
}

Widget makeGrid(item) {
  return Card(
    // color: Colors.grey[100],
    child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(5)),
            child: FittedBox(
              fit: BoxFit.contain,
              child: Image(
                height: 109,
                width: 167,
                image: AssetImage(item.image),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Text(
            item.title,
            style: TextStyle(fontSize: 16),
          ),
          Text(
            " \$ " + '${item.price}' + ".00",
            style: TextStyle(fontSize: 18, color: Colors.purple[600]),
          )
        ]),
  );
}
