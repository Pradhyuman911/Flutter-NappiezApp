import 'category.dart';

List<Category> cateList = [
  Category(
    image: "assets/images/bottle.gif",
    title: "   Baby \nProducts",
  ),
  Category(
    image: "assets/images/sale.gif",
    title: "Great \nDeals",
  ),
  Category(
    image: "assets/images/toy.gif",
    title: "Ultimate \nToys",
  ),
  Category(
    image: "assets/images/book.gif",
    title: "School \nStationery",
  ),
  Category(
    image: "assets/images/gift.gif",
    title: "Offers",
  ),
  Category(
    image: "assets/images/girl.gif",
    title: "Girl \nClothing",
  ),
  Category(
    image: "assets/images/boy.jpg",
    title: "Boys \nClothing",
  ),
];
List<Products> proList = [
  Products(
    image: "assets/images/fea1.jpg",
    title: "Boy's Fashionable\n T-shirt",
    price: 799,
  ),
  Products(
    image: "assets/images/fea2.jpg",
    title: "Cucumbar Baby \nSummer Cap",
    price: 189,
  ),
  Products(
    image: "assets/images/fea3.jpg",
    title: "Little Kangaroos \nDenim Shorts",
    price: 251,
  ),
  Products(
    image: "assets/images/fea4.jpg",
    title: "Kookie Full \nSleeves Hoodie",
    price: 345,
  ),
  Products(
    image: "assets/images/fea5.jpg",
    title: "Kookie Party Wear \n Full Sleeves",
    price: 699,
  ),
  Products(
    image: "assets/images/fea6.jpg",
    title: "Full Sleeves Kurta \n & Pyjama Set ",
    price: 399,
  ),
  Products(
    image: "assets/images/fea7.jpg",
    title: "Benny Cap & Mitten \n&Booties Set",
    price: 199,
  ),
];

List<Sales> saleList = [
  Sales(
    image: "assets/images/sale1.jpg",
    title: "Huggies Baby \n Comfort 3 in 1",
    price: 299,
  ),
  Sales(
    image: "assets/images/sale2.jpg",
    title: "Baby Stuff Tedy\n Bear Soft",
    price: 399,
  ),
  Sales(
    image: "assets/images/sale3.jpg",
    title: "Baby Carrier \n --Best Carrier \nand Comfort",
    price: 570,
  ),
  Sales(
    image: "assets/images/sale4.jpg",
    title: "Baby Products \n For Grooming \nand Health",
    price: 199,
  ),
  Sales(
    image: "assets/images/sale5.jpg",
    title: "All in one \n Combo Pack",
    price: 999,
  ),
  Sales(
    image: "assets/images/sale6.jpg",
    title: "Baby Bathing Kit \n Best Product on Sale",
    price: 432,
  ),
  Sales(
    image: "assets/images/sale7.jpg",
    title: "Baby Bath Tub \n --with Sampoo Holder",
    price: 699,
  ),
];

List gridItems = [
  {
    "id": 1,
    "image": "assets/images/fea3.jpg",
    "title": "Little Kangaroos \nDenim Shorts",
    "price": 251,
    "promotionPrice": 11.50,
    "color": [
      {"id": 1, "value": "assets/images/fea3.jpg"},
      {"id": 2, "value": "assets/images/grid1.jpg"},
      {"id": 3, "value": "assets/images/grid2.jpg"},
      {"id": 4, "value": "assets/images/grid3.jpg"},
    ],
    "size": [
      {"id": 1, "value": "10"},
      {"id": 2, "value": "11"},
      {"id": 3, "value": "12"}
    ]
  },
  {
    "id": 2,
    "image": "assets/images/fea4.jpg",
    "title": "Kookie Full \nSleeves Hoodie",
    'price': 345,
    "promotionPrice": 11.50,
    "color": [
      {"id": 1, "value": "assets/images/fea4.jpg"},
      {"id": 2, "value": "assets/images/grid2.jpg"},
      {"id": 3, "value": "assets/images/grid7.jpg"},
      {"id": 4, "value": "assets/images/fea6.jpg"},
    ],
    "size": [
      {"id": 1, "value": "10"},
      {"id": 2, "value": "11"},
      {"id": 3, "value": "12"}
    ]
  },
  {
    'id': 3,
    "image": "assets/images/sale6.jpg",
    "title": "Baby Bathing Kit \n Best Product on Sale",
    "price": 432,
    "promotionPrice": 11.50,
    "color": [
      {"id": 1, "value": "assets/images/sale6.jpg"},
      {"id": 2, "value": "assets/images/grid5.jpg"},
      {"id": 3, "value": "assets/images/grid6.jpg"},
      {"id": 4, "value": "assets/images/grid7.jpg"},
    ],
    "size": [
      {"id": 1, "value": "10"},
      {"id": 2, "value": "11"},
      {"id": 3, "value": "12"}
    ]
  },
  {
    "id": 4,
    "image": "assets/images/sale4.jpg",
    "title": "Baby Products \n For Grooming ",
    "price": 199,
    "promotionPrice": 11.50,
    "color": [
      {"id": 1, "value": "assets/images/sale4.jpg"},
      {"id": 2, "value": "assets/images/grid8.jpg"},
      {"id": 3, "value": "assets/images/grid9.jpg"},
      {"id": 4, "value": "assets/images/grid10.jpg"},
    ],
    "size": [
      {"id": 1, "value": "10"},
      {"id": 2, "value": "11"},
      {"id": 3, "value": "12"}
    ]
  },
  {
    "id": 5,
    'image': "assets/images/fea6.jpg",
    'title': "Full Sleeves Kurta \n & Pyjama Set ",
    'price': 399,
    "promotionPrice": 11.50,
    "color": [
      {"id": 1, "value": "assets/images/sale4.jpg"},
      {"id": 2, "value": "assets/images/grid1.jpg"},
      {"id": 3, "value": "assets/images/grid7.jpg"},
      {"id": 4, "value": "assets/images/grid4.jpg"},
    ],
    "size": [
      {"id": 1, "value": "10"},
      {"id": 2, "value": "11"},
      {"id": 3, "value": "12"}
    ]
  },
  {
    'id': 6,
    'image': "assets/images/sale8.jpg",
    'title': "Baby Comfortable \n WheelChair",
    'price': 799,
    "promotionPrice": 11.50,
    "color": [
      {"id": 1, "value": "assets/images/sale8.jpg"},
      {"id": 2, "value": "assets/images/grid8.jpg"},
      {"id": 3, "value": "assets/images/grid2.jpg"},
      {"id": 4, "value": "assets/images/grid10.jpg"},
    ],
    "size": [
      {"id": 1, "value": "10"},
      {"id": 2, "value": "11"},
      {"id": 3, "value": "12"}
    ]
  },
  {
    'id': 7,
    'image': "assets/images/fea2.jpg",
    'title': "Cucumbar Baby \nSummer Cap",
    'price': 189,
    "promotionPrice": 11.50,
    "color": [
      {"id": 1, "value": "assets/images/fea2.jpg"},
      {"id": 2, "value": "assets/images/grid1.jpg"},
      {"id": 3, "value": "assets/images/grid8.jpg"},
      {"id": 4, "value": "assets/images/grid9.jpg"},
    ],
    "size": [
      {"id": 1, "value": "10"},
      {"id": 2, "value": "11"},
      {"id": 3, "value": "12"}
    ]
  },
  {
    'id': 8,
    'image': "assets/images/sale9.jpg",
    'title': "Combo Pack \n Toys",
    'price': 250,
    "promotionPrice": 11.50,
    "color": [
      {"id": 1, "value": "assets/images/sale9.jpg"},
      {"id": 2, "value": "assets/images/grid9.jpg"},
      {"id": 3, "value": "assets/images/grid3.jpg"},
      {"id": 4, "value": "assets/images/grid6.jpg"},
    ],
    "size": [
      {"id": 1, "value": "10"},
      {"id": 2, "value": "11"},
      {"id": 3, "value": "12"}
    ]
  },
];

List<String> banList = [
  "assets/images/ban1.jpg",
  "assets/images/ban2.jpg",
  "assets/images/ban3.jpg",
  "assets/images/ban4.jpg",
  "assets/images/ban5.jpg",
  "assets/images/ban6.jpg",
];
List<String> banDList = [
  "assets/images/ban7.jpg",
  "assets/images/ban8.jpg",
  "assets/images/ban9.jpg",
  "assets/images/ban10.jpg",
  "assets/images/ban11.jpg",
  "assets/images/ban5.jpg",
];
List dataItems = [
  {
    "id": 1,
    "code": "CS667880",
    "name":
        "Babyhug Dungaree Style Striped Frock with Half Sleeves Inner Tee - Blue White",
    "img": "assets/images/trans1.jpg",
    "price": 15.5,
    "promotionPrice": 11.50,
    "color": [
      {"id": 1, "value": "assets/images/trans1.jpg"},
      {"id": 2, "value": "assets/images/trans2.jpg"},
      {"id": 3, "value": "assets/images/trans1.jpg"},
      {"id": 4, "value": "assets/images/trans2.jpg"},
    ],
    "size": [
      {"id": 1, "value": "10"},
      {"id": 2, "value": "11"},
      {"id": 3, "value": "12"}
    ]
  },
  {
    "id": 2,
    "code": "CS883398",
    "name": "Babyhug Full Sleeves Checked Shirt & Trouser - Beige Red",
    "img": "assets/images/trans3.jpg",
    "price": 18.00,
    "promotionPrice": 15.00,
    "color": [
      {"id": 1, "value": "assets/images/trans3.jpg"},
      {"id": 2, "value": "assets/images/trans4.jpg"},
      {"id": 3, "value": "assets/images/trans3.jpg"},
      {"id": 4, "value": "assets/images/trans4.jpg"},
    ],
    "size": [
      {"id": 1, "value": "10"},
      {"id": 2, "value": "11"},
      {"id": 3, "value": "12"}
    ]
  },
  {
    "id": 3,
    "code": "CS757458",
    "name":
        "Little Bansi Full Sleeves Zardosi Work Kurti With Sharara & Dupatta - Blue",
    "img": "assets/images/trans5.jpg",
    "price": 16.5,
    "promotionPrice": 12.5,
    "color": [
      {"id": 1, "value": "assets/images/trans5.jpg"},
      {"id": 2, "value": "assets/images/trans6.jpg"},
      {"id": 3, "value": "assets/images/trans5.jpg"},
      {"id": 4, "value": "assets/images/trans6.jpg"},
    ],
    "size": [
      {"id": 1, "value": "10"},
      {"id": 2, "value": "11"},
      {"id": 3, "value": "12"}
    ]
  },
  {
    "id": 4,
    "code": "CS605084",
    "name": "Babyhug Full Sleeves 4 Piece Party Suit - Grey",
    "img": "assets/images/trans7.jpg",
    "price": 12.6,
    "promotionPrice": 11.00,
    "color": [
      {"id": 1, "value": "assets/images/trans7.jpg"},
      {"id": 2, "value": "assets/images/trans8.jpg"},
      {"id": 3, "value": "assets/images/trans7.jpg"},
      {"id": 4, "value": "assets/images/trans8.jpg"}
    ],
    "size": [
      {"id": 1, "value": "10"},
      {"id": 2, "value": "11"},
      {"id": 3, "value": "12"}
    ]
  },
  {
    "id": 5,
    "code": "CP555545",
    "name":
        "Enfance All Over Golden Stars Printed Sleeveless Flared Dress - White",
    "img": "assets/images/trans9.jpg",
    "price": 17.00,
    "promotionPrice": 13.00,
    "color": [
      {"id": 1, "value": "assets/images/trans9.jpg"},
      {"id": 2, "value": "assets/images/trans10.jpg"},
      {"id": 3, "value": "assets/images/trans9.jpg"},
      {"id": 4, "value": "assets/images/trans10.jpg"},
    ],
    "size": [
      {"id": 1, "value": "10"},
      {"id": 2, "value": "11"},
      {"id": 3, "value": "12"}
    ]
  },
  {
    "id": 6,
    "code": "CP598703",
    "name": "Cucumber Full Sleeves Tee & Lounge Pant Ball Print - Green",
    "img": "assets/images/trans11.jpg",
    "price": 14.5,
    "promotionPrice": 17.00,
    "color": [
      {"id": 1, "value": "assets/images/trans11.jpg"},
      {"id": 2, "value": "assets/images/trans12.jpg"},
      {"id": 3, "value": "assets/images/trans11.jpg"},
      {"id": 4, "value": "assets/images/trans12.jpg"}
    ],
    "size": [
      {"id": 1, "value": "10"},
      {"id": 2, "value": "11"},
      {"id": 3, "value": "12"}
    ]
  },
  {
    "id": 7,
    "code": "CS605084",
    "name":
        "Hopscotch Green Text Print Vertical Stripes Full Sleeves T-Shirt Hoodie and Pant Set",
    "img": "assets/images/trans13.jpg",
    "price": 12.6,
    "promotionPrice": 11.00,
    "color": [
      {"id": 1, "value": "assets/images/trans13.jpg"},
      {"id": 2, "value": "assets/images/trans14.jpg"},
      {"id": 3, "value": "assets/images/trans13.jpg"},
      {"id": 4, "value": "assets/images/trans14.jpg"}
    ],
    "size": [
      {"id": 1, "value": "10"},
      {"id": 2, "value": "11"},
      {"id": 3, "value": "12"}
    ]
  },
  {
    "id": 8,
    "code": "CS667880",
    "name": "2-7T Girl Dress Princess Autumn Winter Long Sleeve",
    "img": "assets/images/trans15.jpg",
    "price": 15.5,
    "promotionPrice": 11.50,
    "color": [
      {"id": 1, "value": "assets/images/trans15.jpg"},
      {"id": 2, "value": "assets/images/trans16.jpg"},
      {"id": 3, "value": "assets/images/trans15.jpg"},
      {"id": 4, "value": "assets/images/trans16.jpg"},
      {"id": 5, "value": "assets/images/trans15.jpg"},
      {"id": 6, "value": "assets/images/trans16.jpg"},
      {"id": 7, "value": "assets/images/trans15.jpg"},
      {"id": 8, "value": "assets/images/trans16.jpg"},
    ],
    "size": [
      {"id": 1, "value": "10"},
      {"id": 2, "value": "11"},
      {"id": 3, "value": "12"}
    ]
  },
  {
    "id": 9,
    "code": "CP598703",
    "name": "Cucumber Full Sleeves Tee & Lounge Pant Ball Print - Green",
    "img": "assets/images/trans11.jpg",
    "price": 14.5,
    "promotionPrice": 17.00,
    "color": [
      {"id": 1, "value": "assets/images/trans11.jpg"},
      {"id": 2, "value": "assets/images/trans12.jpg"},
      {"id": 3, "value": "assets/images/trans11.jpg"},
      {"id": 4, "value": "assets/images/trans12.jpg"}
    ],
    "size": [
      {"id": 1, "value": "10"},
      {"id": 2, "value": "11"},
      {"id": 3, "value": "12"}
    ]
  },
  {
    "id": 10,
    "code": "CS757458",
    "name":
        "Little Bansi Full Sleeves Zardosi Work Kurti With Sharara & Dupatta - Blue",
    "img": "assets/images/trans5.jpg",
    "price": 16.5,
    "promotionPrice": 12.5,
    "color": [
      {"id": 1, "value": "assets/images/trans5.jpg"},
      {"id": 2, "value": "assets/images/trans6.jpg"},
      {"id": 3, "value": "assets/images/trans5.jpg"},
      {"id": 4, "value": "assets/images/trans6.jpg"},
    ],
    "size": [
      {"id": 1, "value": "10"},
      {"id": 2, "value": "11"},
      {"id": 3, "value": "12"}
    ]
  },
];
