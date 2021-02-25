import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nappies_direct/views/MyStore.dart';

class ProviderPage extends StatefulWidget {
  @override
  _ProviderPageState createState() => _ProviderPageState();
}

class _ProviderPageState extends State<ProviderPage> {
  @override
  Widget build(BuildContext context) {
    var store = Provider.of<MyStore>(context);
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        title: Text('Product Detail Page'),
        actions: [
          // Text(store.getBasketQty().toString()),
          IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.black,
              ),
              onPressed: () {
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => BasketPage()));
              })
        ],
      ),
      body: Column(
        children: [
          Container(
            width: 150,
            height: 150,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(store.activeProduct.image))),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(store.activeProduct.title),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(store.activeProduct.price.toString()),
          ),
        ],
      ),
    );
  }
}
