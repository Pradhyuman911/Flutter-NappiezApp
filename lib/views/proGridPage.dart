import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nappies_direct/models/addToCartModel.dart';
import 'package:nappies_direct/models/fakeModel.dart';
import 'package:nappies_direct/views/MyStore.dart';
import 'package:nappies_direct/views/fakeStore.dart';
import 'package:nappies_direct/views/productDetails.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:nappies_direct/views/providerPage.dart';
import 'package:http/http.dart' as http;

class ProGridPage extends StatefulWidget {
  @override
  _ProGridPageState createState() => _ProGridPageState();
}

class _ProGridPageState extends State<ProGridPage> {
  Future<List<FakeModel>> futureData;
  String token = "";
  int productId;
  int price;
  int qty;

  Future<List<FakeModel>> getData() async {
    String myUrl = "https://fakestoreapi.com/products/";
    var response = await http.get(myUrl);
    List data = json.decode(response.body);
    print('Response status : ${response.statusCode}');
    return data.map((data) => FakeModel.fromJson(data)).toList();
  }

  Future<List<FakeModel>> apiCart() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String token = prefs.getString('token');
    var url = 'http://firstchoice.net.in/api/user/cart/addTocart';
    // var body = jsonEncode({'data' : })
    http.Response response;
    response = await http.post(url, headers: {
      // "Content-Type": "application/json",
      'Accept': 'Application/json',
      'Authorization': 'Bearer $token'
    }, body: {
      'product_id': 101,
      'price': 12,
      'qty': 1
    });
    print(productId);
    print(price);
    print("transfer token " + token);
    print(response.body);
  }

  @override
  void initState() {
    futureData = getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var store = Provider.of<FakeStore>(context);
    // int productId = store.activeProduct.id;
    // int price = store.activeProduct.price.toInt();
    // int qty = 2;
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
            Expanded(
              child: FutureBuilder<List<FakeModel>>(
                future: getData(),
                // ignore: missing_return
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<FakeModel> data = snapshot.data;
                    return StaggeredGridView.countBuilder(
                        crossAxisCount: 2,
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 4,
                            child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  children: [
                                    InkWell(
                                        onTap: () {
                                          store.setActiveProduct(data[index]);
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      DeatilsPage()));
                                        },
                                        child: Image(
                                            image: NetworkImage(
                                                data[index].image))),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(data[index].title.toString()),
                                    ),
                                    IconButton(
                                      onPressed: apiCart,
                                      icon: Icon(Icons.shopping_cart),
                                    )
                                  ],
                                )),
                          );
                        },
                        staggeredTileBuilder: (index) => StaggeredTile.fit(1));
                  } else if (snapshot.hasError) {
                    return Text("${snapshot.error}");
                  }
                  // By default show a loading spinner.
                  return CircularProgressIndicator();
                },
              ),
            ),
          ],
        ));
  }
}
