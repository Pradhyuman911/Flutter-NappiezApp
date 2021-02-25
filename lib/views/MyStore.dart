import 'package:flutter/material.dart';
import 'package:nappies_direct/models/gridModel.dart';

class MyStore extends ChangeNotifier {
  GridModel grids = GridModel();
  List<GridModel> _baskets = [];
  // List<GridModel> _grids = [];
  bool loading = false;
  GridModel _activeProduct = null;

  List<GridModel> get baskets => _baskets;
  // List<GridModel> get grids => _grids;
  GridModel get activeProduct => _activeProduct;

  setActiveProduct(GridModel p) {
    _activeProduct = p;
    // notifyListeners();
  }

  addOneItem(GridModel g) {
    GridModel found =
        _baskets.firstWhere((a) => a.id == g.id, orElse: () => null);
    _baskets.add(g);
    notifyListeners();
  }

  removeOneItem(GridModel g) {
    GridModel found =
        _baskets.firstWhere((a) => a.id == g.id, orElse: () => null);
    _baskets.remove(g);
    notifyListeners();
  }
}
