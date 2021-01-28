import 'package:flutter/material.dart';


class ProductDetails extends StatefulWidget {
  final String id;
  final String name;
  final String code;
  final String img;
  final String price;
  final String promotion;
  final List size;
  final List color;

  const ProductDetails({Key key, this.id, this.name, this.code, this.img, this.price, this.promotion, this.size, this.color}) : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      
    );
  }
  Widget getBody(){
    return SafeArea(
          child: ListView(
        children:<Widget> [
          Align(
                      child: Icon(
               Icons.arrow_back_ios
            ),
          ),
        ],
      ),
    );
  }
}