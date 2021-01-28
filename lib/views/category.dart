class Category{
  String image;
  String title;

  Category({this.image,this.title});
}

class Products{
  String image;
  String title;
  int price;

  Products({this.image,this.title,this.price});
}

class Sales{
  String image;
  String title;
  int price;

  Sales({this.image,this.title,this.price});
}

class GridList{
  String image;
  String title;
  int price;

  GridList({this.image,this.title,this.price});
}

class DataItems {
  String id;
  String name;
  String code;
  String img;
  String price;
  String promotion;
  List size;
  List color;

  DataItems({this.id, this.name, this.code, this.img, this.price, this.promotion, this.size, this.color});
}