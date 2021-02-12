import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:nappies_direct/views/drawer.dart';
import 'package:nappies_direct/views/shoppingList.dart';
import 'data.dart';
import 'fashionData.dart';
import 'gridEx.dart';

class PinterestGrid extends StatelessWidget {
  PinterestGrid({Key key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
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
        title: Text('Kids Fashion',
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
      drawer: DrawerApp(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                width: size.width,
                height: size.height * 0.27,
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 400,
                    aspectRatio: 16 / 9,
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
            SizedBox(
              height: 10,
            ),
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
                                      image:
                                          AssetImage(gridItems[index]['image']),
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
                            padding: const EdgeInsets.only(left: 15, bottom: 5),
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
          ],
        ),
      ),
    );
  }
}

class ImageCard extends StatefulWidget {
  ImageCard(imgList);

  @override
  _ImageCardState createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(imgList.length, (index) {
        return InkWell(
          onTap: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => ShoppingPage(
                          id: imgList[index]['id'].toString(),
                          image: imgList[index]['image'],
                        )));
          },
          child: Card(
              elevation: 2,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: 200,
                    height: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(imgList[index]['image']),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      imgList[index]['title'],
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Text(
                      "\$" + imgList[index]['price'].toString(),
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              )),
        );
      }),
    );
  }
}
