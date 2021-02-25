import 'package:flutter/material.dart';
import 'package:nappies_direct/views/MyStore.dart';
import 'package:nappies_direct/views/providerPage.dart';
import 'package:provider/provider.dart';

class ProGridPage extends StatefulWidget {
  @override
  _ProGridPageState createState() => _ProGridPageState();
}

class _ProGridPageState extends State<ProGridPage> {
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
        body: GridView.builder(
          itemCount: 5,
          gridDelegate:
              SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemBuilder: (context, i) {
            return InkWell(
              onTap: () {
                store.setActiveProduct(store.grids);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProviderPage()));
              },
              child: Column(
                children: [
                  Container(
                    width: 150,
                    height: 150,
                    child: Image(
                        fit: BoxFit.cover,
                        image: AssetImage(store.grids.image)),
                  ),
                  Text(store.grids.title),
                ],
              ),
            );
          },
        ));
  }
}
