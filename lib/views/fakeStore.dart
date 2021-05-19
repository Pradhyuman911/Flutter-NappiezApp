import 'dart:convert';

import 'package:nappies_direct/models/fakeModel.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class FakeStore extends ChangeNotifier {
  FakeModel product = FakeModel();
  List<FakeModel> _baskets = [];
  bool loading = false;
  List productList = List<FakeModel>();
  FakeModel _activeProduct = null;

  FakeModel get activeProduct => _activeProduct;
  List<FakeModel> get baskets => _baskets;

  setActiveProduct(FakeModel p) {
    _activeProduct = p;
  }

  getPostData(context) async {
    loading = true;
    product = await getSinglePostData(context);
    loading = false;

    notifyListeners();
  }

  addOneItem(FakeModel p) {
    FakeModel found =
        _baskets.firstWhere((a) => a.id == p.id, orElse: () => null);
    baskets.add(p);
    notifyListeners();
  }

  removeOneItem(FakeModel p) {
    FakeModel found =
        _baskets.firstWhere((a) => a.id == p.id, orElse: () => null);
    baskets.remove(p);
    notifyListeners();
  }
}

Future<FakeModel> getSinglePostData(context) async {
  FakeModel result;
  http.Response response = await http.get('https://fakestoreapi.com/products/');

  if (response.statusCode == 200) {
    final data = json.decode(response.body);
    print(data);
    result = FakeModel.fromJson(data);
  } else {
    return null;
  }
  return result;
}
