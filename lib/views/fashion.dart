import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nappies_direct/views/drawer.dart';
// import 'package:nappies_direct/views/home.dart';
// import 'data.dart';
import 'data.dart';
import 'fashionData.dart';

class PinterestGrid extends StatelessWidget {
  PinterestGrid({Key key}) : super(key: key);
  final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
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
      drawer: DrawerApp(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                width: 420,
                height: 200,
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
            Container(
              padding: EdgeInsets.only(top: 15, left: 5, right: 5),
              child: StaggeredGridView.countBuilder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                itemCount: imgList.length,
                itemBuilder: (context, index) => Container(
                  height: 200,
                  child: ImageCard(
                    imageData: imgList[index],
                  ),
                ),
                staggeredTileBuilder: (index) => StaggeredTile.fit(1),
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageCard extends StatefulWidget {
  const ImageCard({
    this.imageData,
  });

  final ImageData imageData;

  @override
  _ImageCardState createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
        borderRadius: BorderRadius.circular(16.0),
        child: InkWell(
          onDoubleTap: () {
            final snackBar = SnackBar(
              content: Text("You added this image into your Wishlist "),
              backgroundColor: Colors.black,
            );
            Scaffold.of(context).showSnackBar(snackBar);
          },
          child: Stack(children: [
            Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(widget.imageData.image),
                      fit: BoxFit.cover),
                ),
                child: Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.bottomRight,
                            colors: [
                      Colors.black.withOpacity(.3),
                      Colors.black.withOpacity(.2),
                    ])))),
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 6.0),
                    child: Text(
                      widget.imageData.title,
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0, bottom: 0),
                          child: Text(
                            " \$ " + '${widget.imageData.price}' + ".00",
                            style: TextStyle(
                                fontSize: 18, color: Colors.purple[900]),
                          ),
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.favorite,
                                color: Colors.red, size: 28))
                      ])
                ])
          ]),
        ));
  }
}
