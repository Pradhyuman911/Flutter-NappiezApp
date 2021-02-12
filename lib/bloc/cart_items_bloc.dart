import 'dart:async';

class CartItemsBloc {
  final cartStreamController = StreamController.broadcast();

  Stream get getStream => cartStreamController.stream;
  final Map allItems = {
    'shop items': [
      {
        "id": 1,
        "image": "assets/images/fea1.jpg",
        "title": "Boy's Fashionable\n T-shirt",
        "price": 799,
      },
      {
        "id": 2,
        "image": "assets/images/fea2.jpg",
        'title': "Cucumbar Baby \nSummer Cap",
        'price': 189,
      },
      {
        "id": 3,
        "image": "assets/images/fea3.jpg",
        "title": "Little Kangaroos \nDenim Shorts",
        "price": 251,
      },
      {
        "id": 4,
        "image": "assets/images/fea4.jpg",
        "title": "Kookie Full \nSleeves Hoodie",
        'price': 345,
      },
      {
        "id": 5,
        "image": "assets/images/fea5.jpg",
        "title": "Kookie Party Wear \nSleeves Hoodie",
        'price': 545,
      },
      {
        "id": 6,
        "image": "assets/images/fea6.jpg",
        'title': "Full Sleeves Kurta \n & Pyjama Set ",
        'price': 399,
      },
      {
        "id": 7,
        "image": "assets/images/trans1.jpg",
        "title": "Frock with Half Sleeves \nInner Tee - Blue White",
        "price": 799,
      },
      {
        "id": 8,
        "image": "assets/images/trans2.jpg",
        "title": "Frock with Half Sleeves \nInner Tee - Red",
        "price": 599,
      },
      {
        "id": 9,
        "image": "assets/images/trans3.jpg",
        "title": "Kookie Party Wear \nSleeves Hoodie",
        'price': 545,
      },
      {
        "id": 10,
        "image": "assets/images/trans4.jpg",
        "title": "Kookie Full \nSleeves Hoodie",
        'price': 345,
      },
      {
        "id": 11,
        "image": "assets/images/trans5.jpg",
        'title': "Cucumbar Baby \nSummer Cap",
        'price': 189,
      },
      {
        "id": 12,
        "image": "assets/images/trans6.jpg",
        "title": "Little Kangaroos \nDenim Shorts",
        "price": 251,
      },
      {
        "id": 13,
        "image": "assets/images/trans7.jpg",
        "title": "Boy's Fashionable\n T-shirt",
        "price": 799,
      },
      {
        "id": 14,
        "image": "assets/images/trans8.jpg",
        "title": "Boy's Fashionable\n T-shirt",
        "price": 799,
      },
      {
        "id": 15,
        "image": "assets/images/trans9.jpg",
        "title": "Baby Sleeves Checked \nShirt & Touser",
        "price": 499,
      },
      {
        "id": 16,
        "image": "assets/images/trans10.jpg",
        "title": "Kookie Party Wear \nSleeves Hoodie",
        'price': 545,
      },
      {
        "id": 17,
        "image": "assets/images/trans11.jpg",
        "title": "Boy's Fashionable\n T-shirt",
        "price": 799,
      },
      {
        "id": 18,
        "image": "assets/images/trans9.jpg",
        "title": "Baby Sleeves Checked \nShirt & Touser",
        "price": 499,
      },
    ],
    'cart items': []
  };

  void addToCart(item) {
    allItems['shop items'].remove(item);
    allItems['cart items'].add(item);
    cartStreamController.sink.add(allItems);
  }

  void removeFromCart(item) {
    allItems['cart items'].remove(item);
    allItems['shop items'].add(item);
    cartStreamController.sink.add(allItems);
  }

  void dispose() {
    cartStreamController.close(); // close our StreamController
  }
}

final bloc = CartItemsBloc();
