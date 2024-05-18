import 'package:flutter/material.dart';
import 'package:educativa_frontend/src/models/sidebar_item.dart';

class SidebarProvider extends ChangeNotifier {
  SidebarItem _sidebarItem = SidebarItem.fundamentos;

  SidebarItem get sidebarItem => _sidebarItem;

  void setSidebarItem(SidebarItem sidebarItem) {
    _sidebarItem = sidebarItem;

    notifyListeners();
  }
}
