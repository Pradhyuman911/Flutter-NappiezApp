import 'package:flutter/material.dart';
// import 'package:flutter_cart/flutter_cart.dart';
// import 'package:nappies_direct/views/fashionData.dart';
import 'package:photo_view/photo_view.dart';

class ShoppingPage extends StatefulWidget {
  final String id;
  final String image;

  const ShoppingPage({Key key, this.id, this.image}) : super(key: key);

  @override
  _ShoppingPageState createState() => _ShoppingPageState();
}

class _ShoppingPageState extends State<ShoppingPage> {
  String activeImg = '';
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
    return Scaffold(
      body: getBody(),
      // bottomSheet: getBottom(),
    );
  }

  Widget getBody() {
    return SafeArea(
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
          Card(
            elevation: 2,
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
        ],
      ),
    );
  }
}
