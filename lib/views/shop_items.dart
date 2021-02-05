import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:nappies_direct/views/checkout.dart';

import 'package:nappies_direct/bloc/cart_items_bloc.dart';

class ShopItems extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Cart'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () => Navigator.push(
                context, MaterialPageRoute(builder: (context) => Checkout())),
          )
        ],
      ),
      body: ShopItemsWidget(),
    );
  }
}

class ShopItemsWidget extends StatelessWidget {
  Widget build(BuildContext context) {
    return StreamBuilder(
      initialData: bloc.allItems, // The bloc was already instantiated.
      stream: bloc.getStream, // The stream we'll be listing to
      builder: (context, snapshot) {
        // snapshot contains the data of the bloc
        return snapshot.data['shop items'].length > 0
            ? Column(
                children: <Widget>[
                  Expanded(child: shopItemsListBuilder(snapshot)),
                  SizedBox(height: 40)
                ],
              )
            : Center(child: Text("All items in shop have been taken"));
      },
    );
  }
}

Widget shopItemsListBuilder(snapshot) {
  return ListView.builder(
    itemCount: snapshot.data["shop items"].length,
    itemBuilder: (BuildContext context, i) {
      final shopList = snapshot.data["shop items"];
      return ListTile(
        leading: ConstrainedBox(
          constraints: BoxConstraints(
            minWidth: 44,
            minHeight: 44,
            maxWidth: 64,
            maxHeight: 64,
          ),
          child: Image.asset(shopList[i]['image'], fit: BoxFit.cover),
        ),
        title: Text(shopList[i]['title']),
        subtitle: Text("\$${shopList[i]['price']}"),
        trailing: IconButton(
          icon: Icon(Icons.add_shopping_cart),
          onPressed: () {
            bloc.addToCart(shopList[i]);
          },
        ),
        onTap: () {},
      );
    },
  );
}
// Widget shopItemsListBuilder(snapshot) {
//   return Container(
//     padding: EdgeInsets.only(top: 15, left: 5, right: 5),
//     child: StaggeredGridView.countBuilder(
//       crossAxisCount: 2,
//       itemCount: snapshot.data["shop items"].length,
//       itemBuilder: (context, i) {
//         final shopList = snapshot.data["shop items"];
//         return Column(
//           children: [
//             ConstrainedBox(
//               constraints: BoxConstraints(
//                   // minWidth: 44,
//                   // minHeight: 44,
//                   // maxWidth: 64,
//                   // maxHeight: 64,
//                   ),
//               child: Image.asset(shopList[i]['image'], fit: BoxFit.cover),
//             ),
//             Text(shopList[i]['title']),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Text("\$${shopList[i]['price']}"),
//                 IconButton(
//                   icon: Icon(Icons.favorite),
//                   color: Colors.red,
//                   onPressed: () {
//                     bloc.addToCart(shopList[i]);
//                   },
//                 ),
//               ],
//             )
//           ],
//         );
//       },
//       staggeredTileBuilder: (index) => StaggeredTile.fit(1),
//       mainAxisSpacing: 10,
//       crossAxisSpacing: 10,
//     ),
//   );
// }
